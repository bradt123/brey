/**************************************************************************
 SISTEMA:		Parqueo
 FUNCION: 		pa.ft_movil_ime
 DESCRIPCION:   Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'pa.tmovil'
 AUTOR: 		 (admin)
 FECHA:	        07-02-2018 15:22:27
 COMENTARIOS:	
***************************************************************************
 HISTORIAL DE MODIFICACIONES:
#ISSUE				FECHA				AUTOR				DESCRIPCION
 #0				07-02-2018 15:22:27								Funcion que gestiona las operaciones basicas (inserciones, modificaciones, eliminaciones de la tabla 'pa.tmovil'	
 #
 ***************************************************************************/

DECLARE

	v_nro_requerimiento    	integer;
	v_parametros           	record;
	v_id_requerimiento     	integer;
	v_resp		            varchar;
	v_nombre_funcion        text;
	v_mensaje_error         text;
	v_id_vehiculo	integer;
			    
BEGIN

    v_nombre_funcion = 'pa.ft_movil_ime';
    v_parametros = pxp.f_get_record(p_tabla);

	/*********************************    
 	#TRANSACCION:  'PA_MOVL_INS'
 	#DESCRIPCION:	Insercion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-02-2018 15:22:27
	***********************************/

	if(p_transaccion='PA_MOVL_INS')then
					
        begin
        	--Sentencia de la insercion
        	insert into pa.tmovil(
            id_persona,
			placa,
			horallegada,
			horasalida,
			tipo,
			estado_reg,
			id_usuario_ai,
			usuario_ai,
			fecha_reg,
			id_usuario_reg,
			fecha_mod,
			id_usuario_mod
          	) values(
            v_parametros.id_persona,
			v_parametros.placa,
			v_parametros.horallegada,
			v_parametros.horasalida,
			v_parametros.tipo,
			'activo',
			v_parametros._id_usuario_ai,
			v_parametros._nombre_usuario_ai,
			now(),
			p_id_usuario,
			null,
			null
							
			
			
			)RETURNING id_vehiculo into v_id_vehiculo;
			
			--Definicion de la respuesta
			v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Movil almacenado(a) con exito (id_vehiculo'||v_id_vehiculo||')'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_vehiculo',v_id_vehiculo::varchar);

            --Devuelve la respuesta
            return v_resp;

		end;

	/*********************************    
 	#TRANSACCION:  'PA_MOVL_MOD'
 	#DESCRIPCION:	Modificacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-02-2018 15:22:27
	***********************************/

	elsif(p_transaccion='PA_MOVL_MOD')then

		begin
			--Sentencia de la modificacion
			update pa.tmovil set
            id_persona = v_parametros.id_persona,
			placa = v_parametros.placa,
			horallegada = v_parametros.horallegada,
			horasalida = v_parametros.horasalida,
			tipo = v_parametros.tipo,
			fecha_mod = now(),
			id_usuario_mod = p_id_usuario,
			id_usuario_ai = v_parametros._id_usuario_ai,
			usuario_ai = v_parametros._nombre_usuario_ai
			where id_vehiculo=v_parametros.id_vehiculo;
               
			--Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Movil modificado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_vehiculo',v_parametros.id_vehiculo::varchar);
               
            --Devuelve la respuesta
            return v_resp;
            
		end;

	/*********************************    
 	#TRANSACCION:  'PA_MOVL_ELI'
 	#DESCRIPCION:	Eliminacion de registros
 	#AUTOR:		admin	
 	#FECHA:		07-02-2018 15:22:27
	***********************************/

	elsif(p_transaccion='PA_MOVL_ELI')then

		begin
			--Sentencia de la eliminacion
			delete from pa.tmovil
            where id_vehiculo=v_parametros.id_vehiculo;
               
            --Definicion de la respuesta
            v_resp = pxp.f_agrega_clave(v_resp,'mensaje','Movil eliminado(a)'); 
            v_resp = pxp.f_agrega_clave(v_resp,'id_vehiculo',v_parametros.id_vehiculo::varchar);
              
            --Devuelve la respuesta
            return v_resp;

		end;
         
	else
     
    	raise exception 'Transaccion inexistente: %',p_transaccion;

	end if;

EXCEPTION
				
	WHEN OTHERS THEN
		v_resp='';
		v_resp = pxp.f_agrega_clave(v_resp,'mensaje',SQLERRM);
		v_resp = pxp.f_agrega_clave(v_resp,'codigo_error',SQLSTATE);
		v_resp = pxp.f_agrega_clave(v_resp,'procedimientos',v_nombre_funcion);
		raise exception '%',v_resp;
				        
END;