<?php

class PhotoplusModule extends YWebModule
{
    public $uploadPath = "PhotoPlus";

    public $vkontakte_app_id;
    public $vkontakte_secret;
    public $facebook_app_id ;
    public $facebook_secret ;
    public $instagram_app_id;
    public $instagram_secret;

    public function getDependencies()
    {
        return array(
            'user',
        );
    }

    public function  getVersion()
    {
        return Yii::t('PhotoplusModule.photo', '0.1');
    }


    public function getIsInstallDefault()
    {
        return true;
    }

    public function getCategory()
    {
        return Yii::t('PhotoplusModule.photo', 'Контент');
    }

    public function getName()
    {
        return Yii::t('PhotoplusModule.photo', 'ФотоДрук');
    }

    public function getDescription()
    {
        return Yii::t('PhotoplusModule.photo', 'Модуль для закачки и редактирования фотографий');
    }

    public function getAuthor()
    {
        return Yii::t('PhotoplusModule.photo', 'BooM');
    }

    public function getAuthorEmail()
    {
        return Yii::t('PhotoplusModule.photo', 'ruslanbanah@gmail.com');
    }

    public function getUrl()
    {
        return Yii::t('PhotoplusModule.photo', 'http://ruslanbanah');
    }

    public function getIcon()
    {
        return "camera";
    }

    public function isMultiLang()
    {
        return true;
    }
    public function getParamsLabels()
    { // опис параметрів модуля!!!!!!
        return array(
            'adminMenuOrder' => Yii::t('PageModule.photo', 'Порядок следования в меню'),
            'editor'         => Yii::t('PageModule.photo', 'Визуальный редактор'),
            'mainCategory'   => Yii::t('PageModule.photo', 'Главная категория страниц'),
            'uploadPath'     => Yii::t('PageModule.photo', 'Каталог для загрузки фото (относительно {path})', array('{path}' => Yii::getPathOfAlias('webroot') . DIRECTORY_SEPARATOR . Yii::app()->getModule("yupe")->uploadPath)),
            'vkontakte_app_id'     => Yii::t('PageModule.photo', 'ID - приложения вконтакте'),
            'vkontakte_secret'     => Yii::t('PageModule.photo', 'Секретный ключ приложения Вконтакте'),

            'facebook_app_id'     => Yii::t('PageModule.photo', 'ID - приложения facebook'),
            'facebook_secret'     => Yii::t('PageModule.photo', 'Секретный ключ приложения facebook'),

            'instagram_app_id'     => Yii::t('PageModule.photo', 'ID - приложения instagram'),
            'instagram_secret'     => Yii::t('PageModule.photo', 'Секретный ключ приложения instagram'),
        );
    }

    public function getEditableParams()
    {
        return array(
            'adminMenuOrder',
            'editor'        => Yii::app()->getModule('yupe')->editors,
            'uploadPath',
            'vkontakte_app_id',
            'vkontakte_secret',
            'facebook_app_id',
            'facebook_secret',
            'instagram_app_id',
            'instagram_secret'
        );
    }

    public function getUploadPath()
    {
        return Yii::getPathOfAlias('webroot') . '/' . Yii::app()->getModule('yupe')->uploadPath . '/' . $this->uploadPath . '/';
    }

    public function getInstall()
    {
        if(parent::getInstall())
            @mkdir($this->getUploadPath(),0755);

        return false;
    }

	public function init()
	{
        parent::init();

        $this->setImport(array(
            'application.modules.photoplus.models.*',
            'application.modules.photoplus.components.*',
            'application.modules.photoplus.components.widgets.*',
        ));

    }



    public function getNavigation()
    {
        return array(
            array('icon' => 'list-alt', 'label' => Yii::t('PhotoplusModule.photo', 'Список фото'), 'url' => array('/page/default/index')),
            array('icon' => 'plus-sign', 'label' => Yii::t('PhotoplusModule.photo', 'Добавить страницу'), 'url' => array('/page/default/create')),
        );
    }

}
