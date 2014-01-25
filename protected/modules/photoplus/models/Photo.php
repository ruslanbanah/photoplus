<?php

/**
 * This is the model class for table "{{photoplus_photo}}".
 *
 * The followings are the available columns in table '{{photoplus_photo}}':
 * @property integer $id
 * @property integer $category_id
 * @property string $creation_date
 * @property string $change_date
 * @property integer $user_id
 * @property string $name
 * @property string $title
 * @property string $description
 * @property integer $status
 */
class Photo extends YModel
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return PhotoplusPhoto the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{photoplus_photo}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('creation_date, change_date, name, title, description, status', 'required'),
			array('category_id, user_id, status', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>150),
			array('title', 'length', 'max'=>250),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, category_id, creation_date, change_date, user_id, name, title, description, status', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'category_id' => 'Category',
			'creation_date' => 'Creation Date',
			'change_date' => 'Change Date',
			'user_id' => 'User',
			'name' => 'Name',
			'title' => 'Title',
			'description' => 'Description',
			'status' => 'Status',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id',$this->id);
		$criteria->compare('category_id',$this->category_id);
		$criteria->compare('creation_date',$this->creation_date,true);
		$criteria->compare('change_date',$this->change_date,true);
		$criteria->compare('user_id',$this->user_id);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('status',$this->status);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}