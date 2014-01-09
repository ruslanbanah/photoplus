<?php
/**
 * Created by PhpStorm.
 * User: user
 * Date: 05.01.14
 * Time: 17:48
 *
 *
 * https://developers.facebook.com/apps
 */
class Social_Facebook extends SocialAbstract
{
    /**
     * @var Facebook
     */
    private $_api;

    public function __construct()
    {
        // Данные приложения мы храним в конфиге
        $modulesId= array("photoplus");
        $userId = Yii::app()->user->id;

        $criteria = new CDbCriteria();
        /* Выборка всех модулей или только указанных */
        if (!empty($modulesId))
            $criteria->addInCondition("module_id", $modulesId);
        /* Выборка для определённого пользователя: */
        $criteria->compare("user_id", $userId);

        $result = Settings::model()->findAll($criteria);
        $sett=array("facebook_app_id","facebook_secret");
        if (count($result)) {
            foreach ($result as $s){
                $sett[$s->param_name]=$s->param_value;
            }
        }

        $this->_api     = new Facebook(array(
            'appId'  =>Yii::app()->getModule("photoplus")->facebook_app_id,
            'secret' => Yii::app()->getModule("photoplus")->facebook_secret
        ));
    }

    public function getPermissionsUri()
    {
        $args = array(
            // На этот адрес пользователь будет перенаправлен после успешной авторизации
            'redirect_uri' => ROOT_PATH . '/social/facebook-auth',
            // Приложение запрашивает права на получение фотографий пользователя
            'scope'        => 'user_photos'
        );

        return $this->_api->getLoginUrl($args);
    }

    public function getAccessToken($code)
    {
        return $this->_api->getAccessToken();
    }

    public function getAlbums()
    {
        $session = new Zend_Session_Namespace('social');

        $this->_api->setAccessToken($session->facebook_token);
        $albums = $this->_api->api('/me/albums');

        // Get cover photo URL
        foreach ($albums['data'] as &$album) {
            $album['cover_path'] = 'https://graph.facebook.com/' . $album['cover_photo'] . '/picture';
        }

        return $albums;
    }

    public function getPhotos($album=null)
    {
        $session = new Zend_Session_Namespace('social');

        $this->_api->setAccessToken($session->facebook_token);
        $photos = $this->_fb->api('/' . $album . '/photos');

        return $photos['data'];
    }
}