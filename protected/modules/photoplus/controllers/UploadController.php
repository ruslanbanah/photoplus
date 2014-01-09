<?php

class UploadController extends YFrontController
{
    public function filters()
    {
        return array(
            array('application.modules.yupe.filters.YFrontAccessControl'), //Дозволено тільки залогіненим
        );
    }

	public function actionIndex()
	{
        $facebook  = new Social_Facebook();
        $vkontakte = new Social_Vkontakte();
        $instagram = new Social_Instagram();
		$this->render('index',array(
                "facebook"=>$facebook,
                "vkontakte"=>$vkontakte,
                "instagram"=>$instagram
        ));
	}

//Екшени авторизації соц мереж
    public function actionFacebookAuth()
    {
        $facebook = new Social_Facebook();
        $code = $_GET["code"];
        $token    = $facebook->getAccessToken($code);
        //Тут збрегти ключ у ключницю, і звязати його із юзером і записати у сесію
        Yii::app()->session->add("facebook_token", $token);
        Yii::app()->clientScript->registerScript('search',"window.opener.facebookAuthorized = 1;window.close();",CClientScript::POS_READY);
    }

    public function actionVkontakteAuth()
    {
        $code = $_GET["code"];
        $vkontakte = new Social_Vkontakte();
        $token    = $vkontakte->getAccessToken($code);
        $model = $this->loadModel();
        PhotoplusSocialkey::model()->updateByPk($model->id,array("vkAccessToken"=>$token));
        echo "<script>window.opener.instagramAuthorized = 1;window.close();</script>";
    }

    public function actionInstagramAuth()
    {
        $code = $_GET["code"];
        $instagram = new Social_Instagram();
        $token    = $instagram->getAccessToken($code);
        $model = $this->loadModel();
        PhotoplusSocialkey::model()->updateByPk($model->id,array("inAccessToken"=>$token));
        echo "<script>window.opener.instagramAuthorized = 1;window.close();</script>";
    }

    function loadModel(){
        $userId = Yii::app()->user->id;
        $criteria = new CDbCriteria();
        $criteria->compare("user_id", $userId);
        $criteria->limit = 1;
        $result = PhotoplusSocialkey::model()->find($criteria);
        if(!count($result)){
            $result = new PhotoplusSocialkey;
            $result->user_id = $userId;
            $result->save();
            $result = PhotoplusSocialkey::model()->find($criteria);
        }
        return $result;
    }
//=========== Отривати список альбомів ===================================================================
    public function ationGetFacebookAlbums()
    {
        $facebook = new Social_Facebook();
        $albums   = $facebook->getAlbums();
        echo json_encode($albums);
    }

    public function actionGetVkontakteAlbums()
    {
        $vkontakte = new Social_Vkontakte();
        $albums   = $vkontakte->getAlbums();
        echo json_encode($albums);
    }
    public function actionGetHtmlVkontakteAlbums()
    {
        $vkontakte = new Social_Vkontakte();
        $albums   = $vkontakte->getAlbums();

        $this->renderPartial('albums',array("albums"=>$albums
        ));
    }
//============Отримати список фото =========================================================
    public function actionGetFacebookPhotos($albumId)
    {
        $facebook = new Social_Facebook();
        $photos   = $facebook->getPhotos($albumId);

        echo json_encode($photos);
    }

    public function actionGetVkontaktePhotos($albumId)
    {
        $vkontakte = new Social_Vkontakte();
        $photos   = $vkontakte->getPhotos($albumId);

        echo json_encode($photos);
    }
    public function actionGetHtmlVkontaktePhotos($albumId)
    {
        $vkontakte = new Social_Vkontakte();
        $photos   = $vkontakte->getPhotos($albumId);
        $this->renderPartial('photos',array("photos"=>$photos));
    }

    public function actionGetInstagramPhotos()
    {

        $instagram = new Social_Instagram();
        $photos   = $instagram->getPhotos();

        echo json_encode($photos);

    }
//=============================================================================================

}