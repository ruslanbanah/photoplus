<?php
/* @var $this PhotoController */
/* @var $model PhotoplusPhoto */

$this->breadcrumbs=array(
	'Photoplus Photos'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PhotoplusPhoto', 'url'=>array('index')),
	array('label'=>'Manage PhotoplusPhoto', 'url'=>array('admin')),
);
?>

<h1>Create PhotoplusPhoto</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>