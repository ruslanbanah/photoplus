<?php
/* @var $this PhotoController */
/* @var $model PhotoplusPhoto */

$this->breadcrumbs=array(
	'Photoplus Photos'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PhotoplusPhoto', 'url'=>array('index')),
	array('label'=>'Create PhotoplusPhoto', 'url'=>array('create')),
	array('label'=>'View PhotoplusPhoto', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PhotoplusPhoto', 'url'=>array('admin')),
);
?>

<h1>Update PhotoplusPhoto <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>