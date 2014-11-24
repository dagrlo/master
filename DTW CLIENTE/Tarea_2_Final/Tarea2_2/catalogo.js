var listaDepartamentos=new Array();
var listaEmpleados=new Array();
var tipoProceso="D";
var xmlHttp;
var totalEmpleados=0;
var empleadoActual=0;
var listaFotos=new Array();
var loop=0;


function getXML(url) {
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp===null) {
            alert ("Browser does not support HTTP Request");
            return;
    } 
    if (url==="departamentos.xml") {
        tipoProceso="D";
    } else {
        tipoProceso="E";
    }
    xmlHttp.onreadystatechange=stateChanged;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
} 



function stateChanged()  { 
    if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete") { 			
        if (tipoProceso==="D"){
            procesaDepartamentos();
        }
        if (tipoProceso==="E"){
            procesaEmpleados();
        }
        if (tipoProceso==="F"){
            ponFotos();
        }
    }                                                 
} 

function dameDepartamento(id){
    resultado="";

    for (var i=0;i<listaDepartamentos.length;i++){
        if (id===listaDepartamentos[i].id){
            resultado=listaDepartamentos[i].nombre;
        }
    }
    return resultado;
}

function cargaFoto(url){
    xmlHttp=GetXmlHttpObject();
    if (xmlHttp===null) {
        alert ("Browser does not support HTTP Request");
        return;
    }                       
    xmlHttp.onreadystatechange=stateChanged2;
    xmlHttp.open("GET",url,true);
    xmlHttp.send(null);
}

function stateChanged2()  { 
    if (xmlHttp.readyState===4 || xmlHttp.readyState==="complete") { 			
        ponFotos();
        if (loop<listaEmpleados.length-1){
            loop++;
            procesaFotos();
        } else {
            actualizaDatos();            
        }
    }
}

function ponFotos(){            
    srcFoto=xmlHttp.responseXML.documentElement.getElementsByTagName("imagen")[0].childNodes[0].nodeValue;
    idFoto=xmlHttp.responseXML.documentElement.getAttribute("id");
    listaFotos[idFoto]=srcFoto;
}

function procesaFotos(){                 
    cargaFoto("./imagenes/"+listaEmpleados[loop].id+".xml");                                        
}


function procesaEmpleados(){            
    iterator=document.evaluate("/plantilla/empleado[@departamento=\'"+document.getElementById("Select1").value+"\']",xmlHttp.responseXML.documentElement , null, XPathResult.UNORDERED_NODE_ITERATOR_TYPE, null );
    totalEmpleados=0;
    listaEmpleados=[];
    listaFotos=[];
    while (thisNode = iterator.iterateNext()) {
        id=thisNode.attributes.getNamedItem("id").value;
        departamento=dameDepartamento(thisNode.attributes.getNamedItem("departamento").value);
        nombre=thisNode.getElementsByTagName("nombre")[0].childNodes[0].nodeValue;
        apellidos=thisNode.getElementsByTagName("apellidos")[0].childNodes[0].nodeValue;
        fecha=thisNode.getElementsByTagName("fechacontrato")[0].childNodes[0].nodeValue;
        puesto=thisNode.getElementsByTagName("puesto")[0].childNodes[0].nodeValue;
        educacion=thisNode.getElementsByTagName("niveleducacion")[0].childNodes[0].nodeValue;
        base=thisNode.getElementsByTagName("sueldo")[0].attributes.getNamedItem("base").value;
        complemento=thisNode.getElementsByTagName("sueldo")[0].attributes.getNamedItem("complemento").value;                                
        listaEmpleados.push(new ElemEmpleado(id, departamento, nombre, apellidos, fecha, puesto,educacion,base,complemento));
        totalEmpleados++;
    }	           
    loop=0;
    procesaFotos();
    empleadoActual=0;
}

function actualizaDatos(){
    document.getElementById("pos").innerHTML=empleadoActual+1;
    document.getElementById("total").innerHTML=totalEmpleados;
    document.getElementById("codigo").innerHTML=listaEmpleados[empleadoActual].id;
    document.getElementById("nombre").innerHTML=listaEmpleados[empleadoActual].nombre+" "+listaEmpleados[empleadoActual].apellidos;
    document.getElementById("departamento").innerHTML=listaEmpleados[empleadoActual].departamento;
    document.getElementById("puesto").innerHTML=listaEmpleados[empleadoActual].puesto;
    document.getElementById("nivel").innerHTML=listaEmpleados[empleadoActual].educacion;
    document.getElementById("base").innerHTML=listaEmpleados[empleadoActual].base+" €";
    document.getElementById("complemento").innerHTML=listaEmpleados[empleadoActual].complemento+ " €";
    document.getElementById("celdaFoto").innerHTML="<img width='200' src='./imagenes/"+listaFotos[parseInt(listaEmpleados[empleadoActual].id)]+"'/>";
}

function procesaDepartamentos(){
    datos=xmlHttp.responseXML.documentElement.getElementsByTagName("departamento");                                
    for (var i=0;i<datos.length;i++){
        nombre=datos[i].getElementsByTagName("nombre")[0].childNodes[0].nodeValue;                
        manager=datos[i].getElementsByTagName("manager")[0].childNodes[0].nodeValue;
        id=datos[i].attributes.getNamedItem("id").value;

        listaDepartamentos.push(new ElemDepartamento(id,nombre,manager));
        opt=document.createElement("option");
        opt.text=nombre;
        opt.value=id;
        document.getElementById("Select1").options.add(opt);
    }                    
}

function GetXmlHttpObject() { 
    var objXMLHttp=null;
    if (window.XMLHttpRequest) {
        objXMLHttp=new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        objXMLHttp=new ActiveXObject("Microsoft.XMLHTTP");
    }
    return objXMLHttp;
} 


function ElemDepartamento(id, nombre, manager){
    this.id=id;
    this.nombre=nombre;
    this.manager=manager;
}                

function ElemEmpleado(id,departamento, nombre, apellidos, fecha, puesto, educacion, base, complemento){
    this.id=id;
    this.departamento=departamento;
    this.nombre=nombre;
    this.apellidos=apellidos;
    this.fecha=fecha;
    this.puesto=puesto;
    this.educacion=educacion;
    this.base=base;
    this.complemento=complemento;
}

function cargaEmpleados(){
    getXML("empleados.xml");
}

function ultimo(){
    if (listaEmpleados.length>0){
        empleadoActual=totalEmpleados-1;
        actualizaDatos();
    }            
}

function primero(){
    if (listaEmpleados.length>0){
        empleadoActual=0;
        actualizaDatos();
    }            
}

function siguiente(){            
    if ((listaEmpleados.length>0)&&(empleadoActual+1<totalEmpleados)){
        empleadoActual++;
        actualizaDatos();
    }            
}

function anterior(){            
    if ((listaEmpleados.length>0)&&(empleadoActual>0)){
        empleadoActual--;
        actualizaDatos();
    }            
}

function existeId(id){                        
    for (var i=0;i<listaEmpleados.length;i++){                
        if (parseInt(id)===parseInt(listaEmpleados[i].id)){                    
            return i;
        }
    }            
    return -1;
}

function btnIr(){
    var donde=parseInt(document.getElementById("emp_id").value);

    if ((existeId(donde)!==-1)){
        empleadoActual=existeId(donde);
        actualizaDatos();
    } else {                
        alert("El id del empleado no existe. Debe ser un numero.");                
    }
}

window.onload=function(){          
   getXML("departamentos.xml");    
};
