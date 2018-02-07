PARA AGREGAR O LLAMAR A LA TABLA PERSONA SE TIENE QUE AUMENTAR EL "id_persona"
PARA PODDER USARLO, SE PUEDE AGREGAR AL CREAR LA TABLA
O SE TIENE QUE AUMENTAR EL CAMPO EN LA TABLA YA CREADA
Y AUMENTAREN LAS FUNCIONES SEL,IME PARA PODER SER USADA
EL ORDEN DE LA FUNCION "IME", TIENE QUE CONCORDAR CON EL DE "SEL",
como el archivo 
agregado en el archivo orga.ft_tipo_parentesco_sel

cat.nombre as desc_tipo_parentesco,
PERSON.nombre_completo2 AS desc_person   ---CAMPO AGREADO PARA VER PERSONA Y AGREGAR
	from orga.tparentesco par
                        
    INNER JOIN SEGU.vpersona PERSON ON PERSON.id_persona= par.id_persona  ---CAMPO AGREADO PARA VER PERSONA Y AGREGAR
	inner join segu.tusuario usu1 on usu1.id_usuario = par.id_usuario_reg
	left join segu.tusuario usu2 on usu2.id_usuario = par.id_usuario_mod
    left join orga.ttipo_parentesco cat on cat.id_tipo_parentesco = par.id_tipo_parentesco

AGREGADO EN LA VISTA PARA VER AGREGAR PERSONA
		{
	   			config:{
	       		    name:'id_persona',
	   				origen:'PERSONA',
	   				tinit:true,
	   				fieldLabel:'Persona',
	   				gdisplayField:'desc_person',//mapea al store del grid
	   				anchor: '100%',
	   			    gwidth:200,
		   			 renderer:function (value, p, record){return String.format('{0}', record.data['desc_person']);}
	       	     },
	   			type:'ComboRec',
	   			id_grupo:0,
	   			bottom_filter : true,
	   			filters:{	
			        pfiltro:'PERSON.nombre_completo2',
					type:'string'
				},
	   		   
	   			grid:true,
	   			form:true
		},

AUMENTADO DE IGUAL MANERA

{name:'desc_person',type:'string'}

AUMENTADO EN EL ARCHIVO DEL MODELO
EN LA FUNCIION "listarParentesco" O "lista'nombre'"

$this->captura('id_persona','int4');  /*aumentar si no la tubiera*/

$this->captura('desc_person','text');

/*se aumenta tambien si no huboiera en las funciones 
insertar y modificar*/
$this->setParametro('id_persona','id_persona','int4');




para filtrar datos se aumenta en 
sel archivo  orga.ft_tipo_parentesco_sel
/*********************************    
 	#TRANSACCION:  'OR_PAR_CONT'
 	#DESCRIPCION:	Conteo de registros
 	#AUTOR:		admin	
 	#FECHA:		27-12-2017 14:15:25
	***********************************/

	elsif(p_transaccion='OR_PAR_CONT')then

		begin
			--Sentencia de la consulta de conteo de registros
			v_consulta:='select count(id_parentesco)
					    from orga.tparentesco par
                        INNER JOIN SEGU.vpersona PERSON ON PERSON.id_persona= par.id_persona  ---aumentado para filtrar
					    inner join segu.tusuario usu1 on usu1.id_usuario = par.id_usuario_reg
						left join segu.tusuario usu2 on usu2.id_usuario = par.id_usuario_mod
                        left join orga.ttipo_parentesco cat on cat.id_tipo_parentesco = par.id_tipo_parentesco   ---aumentado para filtrar
					    where ';
			
			--Definicion de la respuesta		    
			v_consulta:=v_consulta||v_parametros.filtro;

			--Devuelve la respuesta
			return v_consulta;

		end;
					
	else




