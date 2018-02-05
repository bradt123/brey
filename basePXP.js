1.-/*umentado vista marca para que en la ventana marca
se vea tambien la vista producto*/
/*DESPUES DE */
},
bdel:true,
bsave:true,
/*****************/
	south:{
		url:'../../../sis_salee/vista/producto/Producto.php',
		title:'Producto',
		height:'50%',
		cls:'Producto'
	}

2.- /*luego para que al hacer click en alguna marca para agregar producto
se aumenta en /Control/ACTProducto.php, o de donde quieras que se agrege*/

/*aumetado en el controlador se agrega el siguiente codigo consus
respectivos cambios*/

		if($this->objParam->getParametro('id_marca')!= ''){
		$this->objParam->addFiltro("pro.id_marca = ".$this->objParam->getParametro('id_marca'));
/*en */
function listarProducto(){
		$this->objParam->defecto('ordenacion','id_producto');

		$this->objParam->defecto('dir_ordenacion','asc');
		
		/*aumetando video 2*/
		if($this->objParam->getParametro('id_marca')!= ''){
		$this->objParam->addFiltro("pro.id_marca = ".$this->objParam->getParametro('id_marca'));
		}
			/**/




3.-/* luego es aumentado para producto vista debajo de al final casi*/
	},
	bdel:true,
	bsave:true,

	/*aca ba aumentado cambiando los respectivos datos  esto es para llamar a la vista mestra osea la otra ventana*/
	onReloadPage:function(m){
		this.maestro=m,
		this.store.baseParams={id_marca:this.maestro.id_marca};
		this.load({params:{start:0,limit:50}});
	},
	loadValoresIniciales:function()
	{
		Phx.vista.Producto.superclass.loadValoresIniciales.call(this);
		this.getComponente('id_marca').setValue(this.maestro.id_marca);
	},

4.-/*dirijirce al sqlmanager e ir la funcion 
ft_producto_sel() alli modificamos para unir tablas 
como ejemplo llamar al nombre de marca y que se vea y agrege
en la tabla producto(ya que en la tabla producto aumentamos
el id_marca e id_categoria)*/

left join ti.tcategoria cat on cat.id_categoria = pro.id_categoria
left join "schema".t."tabla" "aliat" on "alias".id_"tabla" = "alias de la tabla actual(pro)".id_categoria

from sal.tproducto pro
						inner join segu.tusuario usu1 on usu1.id_usuario = pro.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = pro.id_usuario_mod
  --aca se aumenta      left join sal.tcategoria cat on cat.id_categoria = pro.id_categoria
				        where ;


/*luego se aumenta el campo que quisieramos traer de la tabla categoria*/

cat.nombre as desc_categoria

"alias"."campo a traer" as "alias nuevo"
 
 /*esto va despues de no olvidara la coma antes*/

select
						pro.id_producto,
						pro.id_marca,
						pro.descripcion,
						pro.id_categoria,
						pro.estado_reg,
						pro.nombre,
						pro.id_usuario_ai,
						pro.id_usuario_reg,
						pro.fecha_reg,
						pro.usuario_ai,
						pro.id_usuario_mod,
						pro.fecha_mod,
						usu1.cuenta as usr_reg,
						usu2.cuenta as usr_mod,
                        cat.nombre as desc_categoria
5.-/*luego nos vamos a /modelo/MODProducto.php y agregamos
el nuevo alias que agregamo en el anterior ejemplo
"desc_categoria"*/

/*agregado modelo*/
$this->captura('desc_categoria','varchar');

/*despues de */
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

/**/

6.-/*luego en /vista/Producto.php agregamos tambien el campo que aumentamos*/

{name:'desc_categoria', type: 'string'}


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
		/*{name:'stock', type: 'numeric'}*/
		
	],


7.-/*en el mismo campo cambiar los datos de la tabla que estamos llamando 
de la siguiente manera*/
		{
			config: {
				name: 'id_categoria',
				fieldLabel: 'id_categoria',
				allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_salee/control/Categoria/listarCategoria',
					id: 'id_categoria',
					root: 'datos',
					sortInfo: {
						field: 'nombre',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_categoria', 'nombre'],
					remoteSort: true,
					baseParams: {par_filtro: 'cat.nombre'}
				}),
				valueField: 'id_categoria',
				displayField: 'nombre',
				gdisplayField: 'desc_categoria',
				hiddenName: 'id_categoria',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_categoria']);
				}
			},
			type: 'ComboBox',
			id_grupo: 0,
			filters: {pfiltro: 'cat.nombre',type: 'string'},
			grid: true,
			form: true
		}
7.1.- /*para ocultar algun campo que no queramos podemos usar"*/


		{
			config: {
				inputType:'hidden',  //agregado
				name: 'id_marca',
				fieldLabel: 'id_marca',
				/*allowBlank: true,
				emptyText: 'Elija una opción...',
				store: new Ext.data.JsonStore({
					url: '../../sis_/control/Clase/Metodo',
					id: 'id_',
					root: 'datos',
					sortInfo: {
						field: 'nombre',
						direction: 'ASC'
					},
					totalProperty: 'total',
					fields: ['id_', 'nombre', 'codigo'],
					remoteSort: true,
					baseParams: {par_filtro: 'movtip.nombre#movtip.codigo'}
				}),
				valueField: 'id_',
				displayField: 'nombre',
				gdisplayField: 'desc_',
				hiddenName: 'id_marca',
				forceSelection: true,
				typeAhead: false,
				triggerAction: 'all',
				lazyRender: true,
				mode: 'remote',
				pageSize: 15,
				queryDelay: 1000,
				anchor: '100%',
				gwidth: 150,
				minChars: 2,
				renderer : function(value, p, record) {
					return String.format('{0}', record.data['desc_']);
				}*/
			},
			type:'field',  //agregado
			/*type: 'ComboBox',*/  //eliminado
			id_grupo: 0,
			//filters: {pfiltro: 'movtip.nombre',type: 'string'},
			//grid: true,
			form: true
		},