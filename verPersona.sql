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
$this->captura('desc_person','text');




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




	si te sale este error por ramas 
	! [rejected]        master -> master (non-fast-forward)
error: failed to push some refs to 'git@github.com:asantoya/projectnewbies.git'
To prevent you from losing history, non-fast-forward updates were rejected
Merge the remote changes (e.g. 'git pull') before pushing again.  See the
'Note about fast-forwards' section of 'git push --help' for details.
 

 cambiarce primero a la rama master
 luego hacer un git pull  