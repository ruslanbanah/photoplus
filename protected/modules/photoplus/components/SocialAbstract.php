<?php
/**
 * Created by PhpStorm.
 * User: user
 * Date: 05.01.14
 * Time: 17:45
 */
abstract class SocialAbstract
{
    /**
     * Возвращает массив с альбомами, которые включают в себя название, кол-во объектов и превью
     * @return array
     */
    abstract function getAlbums();

    /**
     * Возвращает массив фотографий из альбома, или фотографии Instagram-пользователя (в этом случае не передается $album)
     * @param int|null $album
     * @return array
     */
    abstract function getPhotos($album = null);

    /**
     * Возвращает URI страницу, на которой пользователь должен авторизовать приложение. Об этом подробней чуть позже
     * @return string
     */
    abstract function getPermissionsUri();

    /**
     * @param string $code - параметр, который вернет социальная сеть, при помощи которого получается access_token
     * @return string
     */
    abstract function getAccessToken($code);
}