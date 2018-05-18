function diaSemana() {
  var x = document.getElementById("fecha");
  let date = new Date(x.value.replace(/-+/g, '/'));

  let options = {
    weekday: 'long',
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  };
  console.log(date.toLocaleDateString('es-MX', options));

}
------------------------------
<input type="date" name="fecha" id="fecha" required onchange="diaSemana();">
=======================================================
let dias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado","Domingo"];
let meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

		function diaSemana(){
			var x = document.getElementById("fecha");
			let date = new Date(x.value);

           var fechaNum = date.getDate() + 1;
           var mes_name = date.getMonth();

 
      alert(dias[date.getDay()] + " " + fechaNum + " de " + meses[mes_name] + " de " +         date.getFullYear());
      
      }
<input type="date" name="fecha" id="fecha" required onchange="diaSemana();">

===============================================================================
let dias = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"];
let meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

function diaSemana() {
  var x = document.getElementById("fecha");
  let date = new Date(x.value.replace(/-+/g, '/'));

  var fechaNum = date.getDate();
  var mes_name = date.getMonth();


  console.log(dias[date.getDay()-1] + " " + fechaNum + " de " + meses[mes_name] + " de " + date.getFullYear());

}
<input type="date" name="fecha" id="fecha" required onchange="diaSemana()
==========================
php

$fecha = "17-05-2018"; //5 agosto de 2004 por ejemplo  

$fechats = strtotime($fecha); //a timestamp 

//el parametro w en la funcion date indica que queremos el dia de la semana 
//lo devuelve en numero 0 domingo, 1 lunes,.... 
switch (date('w', $fechats)){ 
     case 0: echo "Domingo"; break;
    case 1: echo "Lunes"; break; 
    case 2: echo "Martes"; break; 
    case 3: echo "Miercoles"; break; 
    case 4: echo "Jueves"; break; 
    case 5: echo "Viernes"; break; 
    case 6: echo "Sabado"; break; 
}
