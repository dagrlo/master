addEventListener('message', recibido, false);

function recibido(e){
	var respuesta='Su nombre es '+e.data;
	postMessage(respuesta);
}
