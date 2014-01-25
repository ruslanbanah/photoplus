<?php
/* @var $this PhotoController */
/* @var $dataProvider CActiveDataProvider */

$this->breadcrumbs=array(
	'Photoplus Photos',
);

$this->menu=array(
	array('label'=>'Create PhotoplusPhoto', 'url'=>array('create')),
	array('label'=>'Manage PhotoplusPhoto', 'url'=>array('admin')),
);
?>

<h1>Photoplus Photos</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
