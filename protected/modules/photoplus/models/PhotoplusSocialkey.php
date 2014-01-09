<?php

/**
 * This is the model class for table "{{photoplus_socialkey}}".
 *
 * The followings are the available columns in table '{{photoplus_socialkey}}':
 * @property integer $id
 * @property integer $user_id
 * @property string $vkAccessToken
 * @property string $fbAccessToken
 * @property string $inAccessToken
 *
 * The followings are the available model relations:
 * @property UserUser $user
 */
class PhotoplusSocialkey extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return PhotoplusSocialkey the static model class
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
		return '{{photoplus_socialkey}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('user_id', 'required'),
			array('user_id', 'numerical', 'integerOnly'=>true),
			array('vkAccessToken, fbAccessToken, inAccessToken', 'length', 'max'=>250),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, user_id, vkAccessToken, fbAccessToken, inAccessToken', 'safe', 'on'=>'search'),
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
			'user' => array(self::BELONGS_TO, 'UserUser', 'user_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'user_id' => 'User',
			'vkAccessToken' => 'Vk Access Token',
			'fbAccessToken' => 'Fb Access Token',
			'inAccessToken' => 'In Access Token',
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
		$criteria->compare('user_id',$this->user_id);
		$criteria->compare('vkAccessToken',$this->vkAccessToken,true);
		$criteria->compare('fbAccessToken',$this->fbAccessToken,true);
		$criteria->compare('inAccessToken',$this->inAccessToken,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}