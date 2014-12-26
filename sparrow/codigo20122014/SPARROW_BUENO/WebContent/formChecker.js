/**
 * 
 */
function checkForm(){
	var username = document.getElementById("usernameField").value;
	var pwd = document.getElementById("pwdField").value;
	var email = document.getElementById("mailField").value;
	var firstName = document.getElementById("nameField").value;
	var surname = document.getElementById("surnameField").value;
	var genderV = document.getElementById("genderV").checked;
	var genderM = document.getElementById("genderM").checked;
	
	//Username
	if(username.length < 4){
		alert("El nombre de usuario es demasiado corto");
		return false;
	}
	//Password
	if(pwd.length < 4){
		alert("La contraseña debe tener almenos 4 caracteres");	
		return false;
	}
	//Email
	if(!validateEmail(email)){
		alert("El Email introducido no es una dirección de correo válida");
		return false;
	}
	//Name
	if(firstName.length < 2){
		alert("El nombre debe tener almenos 2 caracteres");
		return false;
	}
	else if(!testOnlyLetters(firstName)){ 
		alert("El nombre puede contener únicamente letras");
		return false;
	}	
	//Surname
	if(surname.length < 2){
		alert("El nombre debe tener almenos 2 caracteres");
		return false;
	}
	else if(!testOnlyLetters(surname)){ 
		alert("El apellido puede contener únicamente letras");
		return false;
	}
	//Gender
	if(!genderV && !genderM){
		alert("Debe seleccionar un sexo");
		return false;
	}
	return true;
}

function validateEmail(email) { 
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}

function testOnlyLetters(str)  
{  
 var regexp = /^[A-Za-z ]+$/;    
 var result = str.match(regexp);
 if(result == null) return false;
 return true;
}