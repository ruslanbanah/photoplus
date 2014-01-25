<?php
/* @var $this PhotoController */
/* @var $model PhotoplusPhoto */

$this->breadcrumbs=array(
	'Photoplus Photos'=>array('index'),
	$model->name,
);

$this->menu=array(
	array('label'=>'List PhotoplusPhoto', 'url'=>array('index')),
	array('label'=>'Create PhotoplusPhoto', 'url'=>array('create')),
	array('label'=>'Update PhotoplusPhoto', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete PhotoplusPhoto', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage PhotoplusPhoto', 'url'=>array('admin')),
);
?>

<h1>View PhotoplusPhoto #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'category_id',
		'creation_date',
		'change_date',
		'user_id',
		'name',
		'title',
		'description',
		'status',
	),
)); ?>
