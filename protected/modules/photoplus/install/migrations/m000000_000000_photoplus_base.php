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
class m000000_000000_photoplus_base extends YDbMigration
{
    /**
     * Функция настройки и создания таблицы:
     *
     * @return null
     **/
    public function safeUp()
    {
        $this->createTable(
            '{{photoplus_photo}}',
            array(
                'id' => 'pk',
                'category_id' => 'integer DEFAULT NULL',
                'creation_date' => 'datetime NOT NULL',
                'change_date' => 'datetime NOT NULL',
                'user_id' => 'integer  DEFAULT NULL',
                'name' => 'varchar(150) NOT NULL',
                'title' => 'varchar(250) NOT NULL',
                'description' => 'text NOT NULL',
                'status' => 'integer NOT NULL',
            ),
            $this->getOptions()
        );

        $this->createIndex("ix_{{photoplus_photo}}_status", '{{photoplus_photo}}', "status", false);
        $this->createIndex("ix_{{photoplus_photo}}_user_id", '{{photoplus_photo}}', "user_id", false);

        //fk

        $this->addForeignKey("fk_{{page_page}}_user_id", '{{photoplus_photo}}', 'user_id', '{{user_user}}', 'id', 'SET NULL', 'NO ACTION');

    }
 
    /**
     * Функция удаления таблицы:
     *
     * @return null
     **/
    public function safeDown()
    {
        $this->dropTableWithForeignKeys("{{photoplus_photo}}");
    }
}