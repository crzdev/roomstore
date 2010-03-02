function add_street(){
 document.getElementById('multi_street').style.display='';
 num_s = document.getElementById('found_streets').options.selectedIndex;
 p_id = document.getElementById('found_streets').options[num_s].value;
 if (document.getElementById('found_streets').options.selectedIndex!=-1){
 if(!document.getElementById("street[" + p_id + "]"))
   {
  				var SPAN = document.createElement("SPAN");
				SPAN.id = "street[" + document.getElementById('found_streets').options[num_s].value + "]";

  				var objHTML = document.createElement("INPUT");
  				objHTML.type = 'checkbox';
				objHTML.name = "street[" + document.getElementById('found_streets').options[num_s].value + "]";
				objHTML.id = "chck_" + objHTML.name;
				var id_checkbox = objHTML.id;
				eventAdd(objHTML,"onclick", "del_street('" + objHTML.name + "');");
  				objHTML.value = document.getElementById('found_streets').options[num_s].value;
   				SPAN.appendChild(objHTML);

   				var text = document.createTextNode(document.getElementById('found_streets').options[num_s].text);
   				SPAN.appendChild(text);
   				var objHTML = document.createElement("BR");
        		SPAN.appendChild(objHTML);
   				document.getElementById('multi_street').appendChild(SPAN);

                document.getElementById(id_checkbox).checked=true;

	           	document.getElementById('street').value='';
  				document.getElementById('Streets').removeChild(document.getElementById('Streets').lastChild);
  				document.getElementById('Streets').removeChild(document.getElementById('Streets').lastChild);
  		   }
  		   else alert(document.getElementById('found_streets').options[num_s].text + ' óæå åñòü');
 }
}

function eventAdd(objAttrib,handler,addFunction){

   if ((!document.all)&&(document.getElementById)){
       objAttrib.setAttribute(handler,addFunction);
   }
   if ((document.all)&&(document.getElementById)){
       objAttrib[handler]=new Function(addFunction);
   }
}

function del_street(id_street){
document.getElementById('multi_street').removeChild(document.getElementById(id_street));
}

function del_metro(id_metro){
document.getElementById('selected_metro').removeChild(document.getElementById(id_metro));
}

function add_metro(){
 num_s = document.getElementById('metros').options.selectedIndex;
 p_id = document.getElementById('metros').options[num_s].value;
 if (document.getElementById('metros').options.selectedIndex!=-1){
 if(!document.getElementById("sp_metro[" + p_id + "]"))
   {
  				var SPAN = document.createElement("SPAN");
				SPAN.id = "sp_metro[" + p_id + "]";

  				var objHTML = document.createElement("INPUT");
  				objHTML.type = 'checkbox';
				objHTML.name = "metro[" + document.getElementById('metros').options[num_s].value + "]";
				objHTML.id = "chck_" + objHTML.name;
				var id_checkbox = objHTML.id;
				eventAdd(objHTML,"onclick", "del_metro('" + SPAN.id + "');");
  				objHTML.value = document.getElementById('metros').options[num_s].value;
   				SPAN.appendChild(objHTML);

   				var text = document.createTextNode(document.getElementById('metros').options[num_s].text + ' ');
   				SPAN.appendChild(text);
// 				var objHTML = document.createElement("br");
//        		SPAN.appendChild(objHTML);
   				document.getElementById('selected_metro').appendChild(SPAN);
                document.getElementById(id_checkbox).checked=true;
                document.getElementById('metros').selectedIndex = -1;

  		   }
  		   else alert(document.getElementById('metros').options[num_s].text + ' óæå åñòü');
 }
}
