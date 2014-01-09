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
class m000000_000001_photoplus_base extends YDbMigration
{
    /**
     * Функция настройки и создания таблицы:
     *
     * @return null
     **/
    public function safeUp()
    {
        $this->createTable(
            '{{photoplus_order}}',
            array(
                'id' => 'pk',
                'category_id' => 'integer DEFAULT NULL',
                'creation_date' => 'integer NOT NULL',
                'change_date' => 'integer NOT NULL',
                'user_id' => 'integer  DEFAULT NULL',
                'alias' => 'varchar(150) NOT NULL',
                'title' => 'varchar(250) NOT NULL',
                'description' => 'text NOT NULL',
                'status' => 'integer NOT NULL',
                'suma' => 'float NOT NULL',
                'discount_type' => 'integer NOT NULL',
            ),
            $this->getOptions()
        );

        //fk
        $this->addForeignKey("fk_{{photoplus_order}}_user_id", '{{photoplus_order}}', 'user_id', '{{user_user}}', 'id', 'SET NULL', 'NO ACTION');

    }
 
    /**
     * Функция удаления таблицы:
     *
     * @return null
     **/
    public function safeDown()
    {
        $this->dropTableWithForeignKeys("{{photoplus_order}}");
    }
}