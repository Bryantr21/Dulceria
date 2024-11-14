console.log("goo");
$(document).ready(function () {
    obtenerUbicacion();
});
function obtenerUbicacion() {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(mostrarUbicacion, mostrarError);
    } else {
        alert("No soprtada por el navegador");
    }
}
function mostrarUbicacion(position) {
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    console.log("lati: " + lat + "lon" + lon);

    obtenerDireccion(lat, lon);
    initMapComponents(lat, lon);

}
function mostrarError(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            alert("El usuario nego el permiso de ubicacion");
            break;
        case error.POSITION_UNAVAILABLE:
            alert("La ubicacion no esta disponible");
            break;
        case error.TIMEOUT:
            alert("se agoto el tiempo de espera");
            break;
        default:
            alert("error desconocido: "+ error.message);
            break;
    }

}
function obtenerDireccion(lat, lon) {
    const latLng = { lat: lat, lng: lon };
    const geocoder = new google.maps.Geocoder();

    geocoder.geocode({ location: latLng }, function (results, status) {
        if (status == 'OK') {
            if (results[0]) {
                const direccion = results[0].formatted_address;
                document.getElementById('direccion').innerText = "Direcion: " + direccion;
            } else {
                alert("No se encontraron resultados de direccion");

            }
        } else {
            alert("Geocodificacion fallida: " + status);
        }
    })
}
function initMapComponents(lat, lon) {
    const ubicacion = { lat: lat, lng: lon };
    const mapa = new google.maps.Map(document.getElementById("map"), {
        zoom: 15,
        center: ubicacion
    });
    new google.maps.Marker({
        position: ubicacion,
        map: mapa,
        title: "Ubicacion Actual"
    });
    const panorama = new google.maps.StreetViewPanorama(
        document.getElementById("street"), {
        position: ubicacion,
        pov: { heading: 90, pitch: 5 }
    });
    mapa.setstreetView(panorama);
}