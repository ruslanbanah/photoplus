<?php

class DefaultController extends YFrontController
{
	public function actionIndex()
	{
		$this->render('index');
	}
}