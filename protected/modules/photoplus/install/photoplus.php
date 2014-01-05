<?php
return array(
    'module'   => array(
        'class'  => 'application.modules.photoplus.PhotoplusModule',
        // Указание здесь layout'a портит отображение на фронтенде:
        //'layout' => '//layouts/column2',
    ),
    'import'    => array(
        'application.modules.photoplus.models.*',
    ),
    'component' => array(),
    'rules'     => array(
        '/photo/<slug>' => '/photoplus/show',
    ),
);