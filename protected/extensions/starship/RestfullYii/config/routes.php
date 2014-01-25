<?php
return [
	'api/<module:\w+>/<controller:\w+>'=>['<module>/<controller>/REST.GET', 'verb'=>'GET'],
	'api/<module:\w+>/<controller:\w+>/<id:\w*>'=>['<module>/<controller>/REST.GET', 'verb'=>'GET'],
	'api/<module:\w+>/<controller:\w+>/<id:\w*>/<param1:\w*>'=>['<module>/<controller>/REST.GET', 'verb'=>'GET'],
	'api/<module:\w+>/<controller:\w+>/<id:\w*>/<param1:\w*>/<param2:\w*>'=>['<module>/<controller>/REST.GET', 'verb'=>'GET'],

	['<module:\w+>/<controller>/REST.PUT', 'pattern'=>'api/<module>/<controller:\w+>/<id:\w*>', 'verb'=>'PUT'],
	['<module:\w+>/<controller>/REST.PUT', 'pattern'=>'api/<module>/<controller:\w+>/<id:\w*>/<param1:\w*>', 'verb'=>'PUT'],
	['<module:\w+>/<controller>/REST.PUT', 'pattern'=>'api/<module>/<controller:\w*>/<id:\w*>/<param1:\w*>/<param2:\w*>', 'verb'=>'PUT'],

	['<module>/<controller>/REST.DELETE', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w*>', 'verb'=>'DELETE'],
	['<module>/<controller>/REST.DELETE', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w*>/<param1:\w*>', 'verb'=>'DELETE'],
	['<module>/<controller>/REST.DELETE', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w*>/<param1:\w*>/<param2:\w*>', 'verb'=>'DELETE'],

	['<module>/<controller>/REST.POST', 'pattern'=>'api/<module:\w+>/<controller:\w+>', 'verb'=>'POST'],
	['<module>/<controller>/REST.POST', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w+>', 'verb'=>'POST'],
	['<module>/<controller>/REST.POST', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w*>/<param1:\w*>', 'verb'=>'POST'],
	['<module>/<controller>/REST.POST', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w*>/<param1:\w*>/<param2:\w*>', 'verb'=>'POST'],

	['<module>/<controller>/REST.OPTIONS', 'pattern'=>'api/<module:\w+>/<controller:\w+>', 'verb'=>'OPTIONS'],
	['<module>/<controller>/REST.OPTIONS', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w+>', 'verb'=>'OPTIONS'],
	['<module>/<controller>/REST.OPTIONS', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w*>/<param1:\w*>', 'verb'=>'OPTIONS'],
	['<module>/<controller>/REST.OPTIONS', 'pattern'=>'api/<module:\w+>/<controller:\w+>/<id:\w*>/<param1:\w*>/<param2:\w*>', 'verb'=>'OPTIONS'],

//	'<module>/<controller:\w+>/<id:\d+>'=>'<module:\w+>/<controller>/view',
//	'<module>/<controller:\w+>/<action:\w+>/<id:\d+>'=>'<module:\w+>/<controller>/<action>',
//	'<module>/<controller:\w+>/<action:\w+>'=>'<module:\w+>/<controller>/<action>',
];
