<?php
/**
 * FileDocComment
 * Page install migration
 * Класс миграций для модуля Page:
 *
 * @category YupeMigration
 * @package  YupeCMS
 * @author   YupeTeam <team@yupe.ru>
 * @license  BSD https://raw.github.com/yupe/yupe/master/LICENSE
 * @link     http://yupe.ru
 **/
class m000000_000002_photoplus_base extends YDbMigration
{
    /**
     * Функция настройки и создания таблицы:
     *
     * @return null
     **/
    public function safeUp()
    {
        $this->createTable(
            '{{photoplus_socialkey}}',
            array(
                'id' => 'pk',
                'user_id' => 'integer  DEFAULT NULL',
                'vkAccessToken' => 'varchar(250) NOT NULL',
                'fbAccessToken' => 'varchar(250) NOT NULL',
                'inAccessToken' => 'varchar(250) NOT NULL',
            ),
            $this->getOptions()
        );
        //fk
        $this->addForeignKey("fk_{{photoplus_socialkey}}_user_id", '{{photoplus_socialkey}}', 'user_id', '{{user_user}}', 'id', 'SET NULL', 'NO ACTION');

    }
 
    /**
     * Функция удаления таблицы:
     *
     * @return null
     **/
    public function safeDown()
    {
        $this->dropTableWithForeignKeys("{{photoplus_photo}}");
        $this->dropTableWithForeignKeys("{{photoplus_order}}");
    }
}