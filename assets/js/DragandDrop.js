var contador = 0;
var elemArrastrable = "";
var contadorA = "";

function start(e) {
    console.log("start");
    e.dataTransfer.effectAllowed = "move";
    e.dataTransfer.setData("Data", e.target.id);
    $("#" + e.target.id).css("opacity", "0.4");
    console.log(e.target.id);
    elemArrastrable = e.target.id;
}
function end(e) {
    console.log("end");
    e.target.style.opacity = "";
    e.dataTransfer.clearData("Data");
    elemArrastrable = "";
    console.log(e.target.id);
}
function enter(e) {
    console.log("enter");
    e.target.style.border = "12px dotted #555";
}
function leave(e) {
    console.log("leave");
    $('#'+e.target.id).css("border","");
}
function over(e) {
    console.log("Over");
    var id = e.target.id;
    if ((id == "cuadro1") || (id == "cuadro3") || (id == "papelera")) {
        return false;
    } else {
        return true;
    }
}
function drop(e) {
    console.log("drop");
    var elementoArrastrado = e.dataTransfer.getData("Data");
    e.target.appendChild(document.getElementById(elementoArrastrado));
    e.target.style.border = "";
}
function remove(e) {
    console.log("delete");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
    elementoArrastrado.parentNode.removeChild(elementoArrastrado);
    e.target.style.border = "";
    contadorA--;
}
function clone(e) {
    console.log("clone");
    var elementoArrastrado = document.getElementById(e.dataTransfer.getData("Data"));
    elementoArrastrado.style.opacity = "";
    if (contadorA<3) {
        var elemntoClonado = elementoArrastrado.cloneNode(true);
        elemntoClonado.id = "ClonedNode" + contador;
        contador++;
        contadorA++;
        elemntoClonado.style.position = "static";
        e.target.appendChild(elementoClonado);
    } 
    e.target.style.border = "";
}