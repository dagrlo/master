var casillas=[];
var pos=0;

window.onload=function(){          
    casillas=document.getElementsByClassName("casilla");                
    for (var i=0;i<casillas.length;i++){
        casillas[i].addEventListener("click",manejaClick);
        casillas[i].id=i;
    }                
    pintaFondo(pos);
};

function manejaClick(){
    borraTodas();
    pintaFondo(this.id);                
    pos=this.id;                
}

function dameX(){
    return pos%9;
}

function dameY(){
    return ((pos-(pos%9))/9);
}

function dameValor(px,py){
    return casillas[(9*py)+px].innerHTML;
}

function duplicadoEnFila(valor){
    fila=dameY();                
    duplicado=false;                
    for (var i=0;i<9;i++){
        if (dameValor(i,fila)===valor){
            duplicado=true;
        }
    }                                
    return duplicado;
}

function duplicadoEnColumna(valor){
    columna=dameX();                
    duplicado=false;                
    for (var i=0;i<9;i++){
        if (dameValor(columna,i)===valor){
            duplicado=true;
        }
    }                                
    return duplicado;
}

function duplicadoEnZona(valor){                
    duplicado=false;

    todos=document.getElementsByClassName(casillas[pos].parentNode.className);
    for (var i=0;i<todos.length;i++){                    
        if (todos[i].childNodes[0].innerHTML===valor){
            duplicado=true;
        }
    }
    return duplicado;
}

function manejaTeclado(e){                                
    if (isNaN(String.fromCharCode(e.keyCode))===false){
        if ((duplicadoEnZona(String.fromCharCode(e.keyCode))===true)
                || (duplicadoEnFila(String.fromCharCode(e.keyCode))===true)
                || (duplicadoEnColumna(String.fromCharCode(e.keyCode))===true)){
            casillas[pos].style.color='#f00';  
            casillas[pos].style.backgroundColor='#fcc';  
        } else {
            casillas[pos].style.color='';  
        }
        casillas[pos].innerHTML=String.fromCharCode(e.keyCode);               
    } else {
        if (String.fromCharCode(e.keyCode).toUpperCase()==="C") {
            borraTodas();
            borraTodasTexto();
        }
    }
}

function izquierda(){
    if (pos>0){
        if (pos%9===0){
            pos=pos+8;
        } else {
            pos=pos-1;
        }
    } else {
        pos=8;
    }                
}

function derecha(){
    if (pos<80){
        if (((pos+1)%9===0)&&(pos!==0)){
        pos=pos-8;
        } else {
            pos++;
        }
    } else {
        pos=72;
    }                
}

function arriba(){
    if (pos>8){                    
        pos=pos-9;
    } else {
        pos=pos+72;
    }
}

function abajo(){
    if (pos<72){
        pos=pos+9;
    } else {
        pos=pos-72;
    }
}

function manejaCursores(e){                                
    switch (e.keyCode){
        case 37:izquierda();break;
        case 39:derecha();break;
        case 38:arriba();break;
        case 40:abajo();break;
        case 46:borraEstaCasilla();break;
    }
    borraTodas();
    pintaFondo(pos);
}

function borraEstaCasilla(){
    casillas[pos].innerHTML="";
}

function borraTodas(){
    for (var i=0;i<casillas.length;i++){
      casillas[i].style.backgroundColor="";  
    }
}

function borraTodasTexto(){
    for (var i=0;i<casillas.length;i++){
      casillas[i].innerHTML="";
    }
}

function dame1D(x,y){
    return (y*9)+x;
}

function pintaFondo(pos){
    casillas[pos].style.backgroundColor='#afa';

}
