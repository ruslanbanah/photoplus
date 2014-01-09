<?php
/**
 * Created by PhpStorm.
 * User: user
 * Date: 05.01.14
 * Time: 17:50
 */
class Social_Vkontakte extends SocialAbstract
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
        $sett=array("vkontakte_app_id","vkontakte_secret");
        if (count($result)) {
            foreach ($result as $s){
                $sett[$s->param_name]=$s->param_value;
            }
        }
        $this->_appId  = Yii::app()->getModule("photoplus")->vkontakte_app_id;
        $this->_secret = Yii::app()->getModule("photoplus")->vkontakte_secret;
    }

    public function getPermissionsUri()
    {
        $url = 'http://photo.dev/photoplus/upload/VkontakteAuth';///photoplus/upload/VkontakteAuth

        // Перадаем обратный URL, необходимые права
        return 'https://oauth.vk.com/authorize?client_id=' . $this->_appId . '&redirect_uri=' . urlencode($url) .
        '&display=popup&scope=photos&response_type=code';
    }

    public function getAccessToken($code)
    {
        // Должен быть такой же, какой и отправлялся при запросе на авторизацию

        $url       = 'http://photo.dev/photoplus/upload/VkontakteAuth';
        $response = file_get_contents('https://oauth.vk.com/access_token?client_id=' . $this->_appId . '&client_secret=' . urlencode($this->_secret) . '&code=' . urlencode($code) . '&redirect_uri=' . urlencode($url));
        $data     = json_decode($response);

        return $data->access_token;
    }

    public function getAlbums()
    {
        $userId = Yii::app()->user->id;
        $criteria = new CDbCriteria();
        $criteria->compare("user_id", $userId);
        $criteria->limit = 1;
        $result = PhotoplusSocialkey::model()->find($criteria);
        $vk_token = $result->vkAccessToken;

        $albums = file_get_contents('https://api.vk.com/method/photos.getAlbums?need_covers=1&access_token=' . $vk_token);
        $albums = json_decode($albums, true);

        // Хочется одинаковую структуру возвращаемого массива
        $albums = $albums['response'];
        $alb = array();
        foreach ($albums as &$album) {
            $albu['id']         = $album['aid'];
            $albu['count']      = $album['size'];
            $albu['name']       = $album['title'];
            $albu['cover_path'] = $album['thumb_src'];
            $alb[]=$albu;
        }

        return $alb;
    }

    public function getPhotos($album=null)
    {
        $userId = Yii::app()->user->id;
        $criteria = new CDbCriteria();
        $criteria->compare("user_id", $userId);
        $criteria->limit = 1;
        $result = PhotoplusSocialkey::model()->find($criteria);
        $vk_token = $result->vkAccessToken;
        $photos = file_get_contents('https://api.vk.com/method/photos.get?aid=' . $album . '&need_covers=1&access_token=' . $vk_token);
        $photos = json_decode($photos, true);

        $photos = $photos['response'];
        $phots=array();
        // Приводим к одному формату с Facebook
        foreach ($photos as $photo) {
            $phot['picture'] = $photo['src'];
            $phot['source']  = $photo['src_big'];
            $phots[]=$phot;
        }
        return $phots;
    }
}