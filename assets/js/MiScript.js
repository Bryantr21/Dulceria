let form = document.forms.formu;

form.nombre.onchange = validarCampos;
form.asunto.onchange = validarCampos;
form.email.onchange = calcularemail;
form.mensaje.onchange = validarCampos;
function calcularemail() {
    var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    let emailform = form.contac_email.value;

    if (!emailRegex.test(emailform)) {
        sweetA("error", "Ingresa un email valido.");
    }
}
function enviar_formulario() {
    let nombreform = form.nombre.value;
    let asuntoform = form.asunto.value;
    let mesajeform = form.mensaje.value;

    if (nombreform != '' && asuntoform != '' && mesajeform != '') {
        sweetA("success", "Formulario Enviado", "Gracias");
    } else {
        sweetA("warning", "Todos los Campos son Obligatorios", "Gracias");

    }
    
}


