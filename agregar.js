/*para agregar un campo en la base de datos y 
configurar en el modelo vista controlador para que se vea*/
1.-agregamos el campo en tabla correspondiente
2.- luego vamos a /vista/"la tabla donde aumentamos el campo para que se vea" de la
siguiente manera "en este caso agregamos el campo 'stock' en la tabla movimiento"

{
			config:{
				name: 'stock',
				fieldLabel: 'stock',
				allowBlank: true,
				anchor: '80%',
				gwidth: 100,
				maxLength:50
			},
				type:'Field',
				id_grupo:0,
				grid:true,
				form:true
},

3.-en el mismo archivo agregamos
/*despues de */
tam_pag:50,	
	title:'Producto',
	ActSave:'../../sis_salee/control/Producto/insertarProducto',
	ActDel:'../../sis_salee/control/Producto/eliminarProducto',
	ActList:'../../sis_salee/control/Producto/listarProducto',
	id_store:'id_producto',
	fields: [
		{name:'id_producto', type: 'numeric'},
		{name:'id_marca', type: 'numeric'},
		{name:'descripcion', type: 'string'},
		{name:'id_categoria', type: 'numeric'},
		{name:'estado_reg', type: 'string'},
		{name:'nombre', type: 'string'},
		{name:'id_usuario_ai', type: 'numeric'},
		{name:'id_usuario_reg', type: 'numeric'},
		{name:'fecha_reg', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usuario_ai', type: 'string'},
		{name:'id_usuario_mod', type: 'numeric'},
		{name:'fecha_mod', type: 'date',dateFormat:'Y-m-d H:i:s.u'},
		{name:'usr_reg', type: 'string'},
		{name:'usr_mod', type: 'string'},
		{name:'desc_categoria', type: 'string'},
		/*este*/
		{name:'stock', type: 'numeric'}
		
	],

4.-luego en /modelo/"archivo seleccionado" y aumentamos el campo 
aumentado en la tabla

function listarProducto(){
		//Definicion de variables para ejecucion del procedimientp
		$this->procedimiento='sal.ft_producto_sel';
		$this->transaccion='SAL_PRO_SEL';
		$this->tipo_procedimiento='SEL';//tipo de transaccion
				
		//Definicion de la lista del resultado del query
		$this->captura('id_producto','int4');
		$this->captura('id_marca','int4');
		$this->captura('descripcion','varchar');
		$this->captura('id_categoria','int4');
		$this->captura('estado_reg','varchar');
		$this->captura('nombre','varchar');
		$this->captura('id_usuario_ai','int4');
		$this->captura('id_usuario_reg','int4');
		$this->captura('fecha_reg','timestamp');
		$this->captura('usuario_ai','varchar');
		$this->captura('id_usuario_mod','int4');
		$this->captura('fecha_mod','timestamp');
		$this->captura('usr_reg','varchar');
		$this->captura('usr_mod','varchar');
		/*aumentado video2*/
		$this->captura('desc_categoria','varchar');
		/*aumentado de la tabla*/
		$this->captura('stock','int4');
		
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();
		
		//Devuelve la respuesta
		return $this->respuesta;
	}

tambien agregar en las funciones insertarProducto y modificarProducto

function insertarProducto(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='sal.ft_producto_ime';
		$this->transaccion='SAL_PRO_INS';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_marca','id_marca','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_categoria','id_categoria','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('nombre','nombre','varchar');
		/*aumentado video3*/
		$this->setParametro('stock','stock','int4');
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}
			
	function modificarProducto(){
		//Definicion de variables para ejecucion del procedimiento
		$this->procedimiento='sal.ft_producto_ime';
		$this->transaccion='SAL_PRO_MOD';
		$this->tipo_procedimiento='IME';
				
		//Define los parametros para la funcion
		$this->setParametro('id_producto','id_producto','int4');
		$this->setParametro('id_marca','id_marca','int4');
		$this->setParametro('descripcion','descripcion','varchar');
		$this->setParametro('id_categoria','id_categoria','int4');
		$this->setParametro('estado_reg','estado_reg','varchar');
		$this->setParametro('nombre','nombre','varchar');
		/*aumentado video3*/
		$this->setParametro('stock','stock','int4');
		//Ejecuta la instruccion
		$this->armarConsulta();
		$this->ejecutarConsulta();

		//Devuelve la respuesta
		return $this->respuesta;
	}

	5.- luego nos vamos al la funcion de la tabla 
	"ft_producto_ime()" ir al archivode esta cartepa
	luego de agregar guardamos y nos vamos al archivo
	"ft_producto_sel()" y guardamos una ves agregado y listo

si deseamos hacer operaciones con los datos de la tablas estas se realizan
en el archivo
"ft_movimiento.ime"