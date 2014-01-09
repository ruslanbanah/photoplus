<?php
/**
 * Created by PhpStorm.
 * User: user
 * Date: 05.01.14
 * Time: 17:51
 *
 *
 * Створення додатка : http://instagram.com/developer/clients/manage/
 */
class Social_Instagram extends SocialAbstract
{
    /**
     * @var string
     */
    private $_appId;

    /**
     * @var string
     */
    private $_secret;

    public function __construct()
    {
        $modulesId= array("photoplus");
        $userId = Yii::app()->user->id;

        $criteria = new CDbCriteria();
        /* Выборка всех модулей или только указанных */
        if (!empty($modulesId))
            $criteria->addInCondition("module_id", $modulesId);
        /* Выборка для определённого пользователя: */
        $criteria->compare("user_id", $userId);

        $result = Settings::model()->findAll($criteria);
        $sett=array("instagram_app_id","instagram_secret");
        if (count($result)) {
            foreach ($result as $s){
                $sett[$s->param_name]=$s->param_value;
            }
        }
        $this->_appId  = Yii::app()->getModule("photoplus")->instagram_app_id;
        $this->_secret = Yii::app()->getModule("photoplus")->instagram_secret;

    }

    public function getPermissionsUri()
    {
        $url = 'http://photo.dev/photoplus/upload/InstagramAuth';

        return 'https://api.instagram.com/oauth/authorize/?client_id=' . $this->_appId . '&redirect_uri=' . urlencode($url) . '&response_type=code';
    }

    public function getAccessToken($code)
    {
        // Тут Instagram выебнулся и решил заставить программистов использовать CURL. Так что ваш PHP должен его поддерживать
        $url      = 'http://photo.dev/photoplus/upload/InstagramAuth';

        $apiData = array(
            'client_id'       => $this->_appId,
            'client_secret'   => $this->_secret,
            'grant_type'      => 'authorization_code',
            'redirect_uri'    => $url,
            'code'            => $code
        );

        $apiHost = 'https://api.instagram.com/oauth/access_token/';

        $ch = curl_init($apiHost);
        //curl_setopt($ch, CURLOPT_URL, $apiHost);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($apiData));
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('Accept: application/json'));
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);   // to stop cURL from verifying the peer's certificate.
        $jsonData = curl_exec($ch);
        curl_close($ch);

        $user = json_decode($jsonData);
        return $user->access_token;
    }

    // Заглушка
    public function getAlbums()
    {
        return array();
    }

    public function getPhotos($album=null)
    {
        // count=-1 показывает, что нужно вернуть все фото
        $userId = Yii::app()->user->id;
        $criteria = new CDbCriteria();
        $criteria->compare("user_id", $userId);
        $criteria->limit = 1;
        $result = PhotoplusSocialkey::model()->find($criteria);
        $instagram_token = $result->inAccessToken;
        $response = file_get_contents('https://api.instagram.com/v1/users/self/media/recent?access_token=' . $instagram_token . '&count=-1');
        $feed   = json_decode($response, true);

        $photos = array();
        foreach ($feed['data'] as $item) {
            $photos[] = array(
                'picture' => $item['images']['low_resolution']['url'],
                'source'  => $item['images']['standard_resolution']['url']
            );
        };

        return $photos;
    }
}