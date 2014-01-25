<?php
/* @var $this UploadController */

$this->breadcrumbs=array(
	'Upload',
);
?>
<script>

//    var postData = {
//        "category_id":"2",
//        "creation_date":"2014-01-21 17:34:10",
//        "change_date":"2014-01-21 17:34:13",
//        "user_id":"2",
//        "name":"newobj",
//        "title":"this is new object",
//        "description":"it is description for new object",
//        "status":"2"
//    };
//
//    $.ajax({
//        url:'/api/photoplus/photo',
//        data:JSON.stringify(postData),
//        type:"POST",
//        success:function(data) {
//            console.log(data);
//            $.ajax({
//                url:'/api/photoplus/photo',
//                type:"GET",
//                success:function(data) {
//                    console.log(data);
//                },
//                error:function (xhr, ajaxOptions, thrownError){
//                    console.log(xhr.responseText);
//                }
//            });
//        },
//        error:function (xhr, ajaxOptions, thrownError){
//            console.log(xhr.responseText);
//        }
//    });


    $.ajax({
        url:'/api/photoplus/photo/2',
        type:"DELETE",
        success:function(data) {
            console.log(data);
            $.ajax({
                url:'/api/photoplus/photo',
                type:"GET",
                success:function(data) {
                    console.log(data);
                },
                error:function (xhr, ajaxOptions, thrownError){
                    console.log(xhr.responseText);
                }
            });
        },
        error:function (xhr, ajaxOptions, thrownError){
            console.log(xhr.responseText);
        }
    });
</script>


<div class="page-header">
    <h1>
        Example page header <small>Subtext for header</small>
    </h1>
</div>

<div>
    <div id="import_from_facebook">Імпорт із фейсбук</div>
    <div id="import_from_vkontakte">Імпорт із вконтакте</div>
    <div id="import_from_instagram">Імпорт із інстаграм</div>

    <div id="from_instagram">Імпорт із інстаграм foto</div>
    <div id="from_vk_album">Імпорт із вконтакте альбоми</div>
    <div id="from_vk_photo">Імпорт із вконтакте фото</div>
</div>

<div id="result">

</div>
<script>
    function getInstagramPhotos() {
        $.ajax({
            url:      '/photoplus/upload/GetInstagramPhotos',
            type:     'GET',
            dataType: 'JSON',
            success: function($data) {
                // Получили фотографии, выводим их
                console.log($data);

            }
        });
    }

    function getVkontakteAlbums() {
        $.ajax({
            url:      '/photoplus/upload/GetHtmlVkontakteAlbums',
            type:     'GET',
            success: function(htm) {
                $("#result").html(htm);
            }
        });
    }
    function getVkontaktePhoto() {
        var albumId = 181981404;
        $.ajax({
            url:      '/photoplus/upload/GetVkontaktePhotos',
            type:     'GET',
            dataType: 'JSON',
            data:      {
                albumId: albumId
            },
            success: function($data) {
                // Получили альбоми, выводим их
                console.log($data);

            }
        });
    }
    function getVkontakteHtmlPhoto(albumId) {
        $.ajax({
            url:      '/photoplus/upload/GetHtmlVkontaktePhotos',
            type:     'GET',
            data:      {
                albumId: albumId
            },
            success: function(htm) {
                // Получили альбоми, выводим их

                $("#result").html(htm);
            }
        });
    }

    $(document).ready(function() {
        $('#from_instagram').click(getInstagramPhotos);
        $('#from_vk_album').click(getVkontakteAlbums);
        $('#from_vk_photo').click(getVkontaktePhoto);

        $("#result").on("click",".album",function(){
            getVkontakteHtmlPhoto($(this).data("id"));
        });


        // Обрабатываем нажатие на кнопку импорта из Facebook
        $('#import_from_facebook').click(function() {
            // Размеры окна
            var left = (screen.width - 600)/ 2,
                top  = (screen.height - 400)/ 2;

            window.facebookAuthorized = 0;
            window.open('<?php echo $facebook->getPermissionsUri(); ?>',
                'vk', 'toolbar=0,status=0,width=600,height=400,left=' + left + ',top=' + top);

            // Таким хитрым образом мы отслеживаем, когда можно закрыть окно. facebookAuthorized установит страница, на которую нас перенаправил facebook
            var intervalFacebook = setInterval(function() {
                if (window.facebookAuthorized == 1) {
                    clearInterval(intervalFacebook);
                }
            }, 250);
            return false;
            }
        );

        // Такая же логика для Vkontakte и Instagram
        $('#import_from_vkontakte').click(function() {
            var left = (screen.width - 600)/ 2,
                top  = (screen.height - 400)/ 2;

            window.vkontakteAuthorized = 0;
            window.open('<?php echo $vkontakte->getPermissionsUri(); ?>',
                'vk', 'toolbar=0,status=0,width=600,height=400,left=' + left + ',top=' + top);

            var intervalVkontakte = setInterval(function() {
                if (window.vkontakteAuthorized == 1) {
                    clearInterval(intervalVkontakte);
                }
            }, 250);
            return false;
            }
        );

        $('#import_from_instagram').click(function() {
            var left = (screen.width - 600)/ 2,
                top  = (screen.height - 400)/ 2;

            window.instagramAuthorized = 0;
            window.open('<?php echo $instagram->getPermissionsUri(); ?>',
                'vk', 'toolbar=0,status=0,width=600,height=400,left=' + left + ',top=' + top);

            var intervalInstagram = setInterval(function() {
                if (window.instagramAuthorized == 1) {
                    clearInterval(intervalInstagram);
                }
            }, 250);
            return false;
            });
        });
</script>