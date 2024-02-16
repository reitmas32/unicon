// Función para actualizar el countdown
function actualizarCountdown() {
    // Fecha objetivo para el countdown (año, mes (0-11), día, hora, minuto, segundo)
    const fechaObjetivo = new Date("2024-04-20T00:00:00").getTime();

    // Obtiene la fecha y hora actuales
    const ahora = new Date().getTime();

    // Calcula la diferencia entre la fecha objetivo y la fecha actual
    const diferencia = fechaObjetivo - ahora;

    // Si la diferencia es menor o igual a 0, muestra un mensaje de tiempo terminado
    if (diferencia <= 0) {
        document.getElementById("countdown").innerHTML =
            "¡Tiempo terminado!";
        return; // Detiene la función aquí si el tiempo ha terminado
    }

    // Calcula días, horas, minutos y segundos
    const days = Math.floor(diferencia / (1000 * 60 * 60 * 24));
    const hours = Math.floor(
        (diferencia % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60),
    );
    const minutes = Math.floor(
        (diferencia % (1000 * 60 * 60)) / (1000 * 60),
    );
    const seconds = Math.floor((diferencia % (1000 * 60)) / 1000);

    const days_str = convertToStr(days)
    const hours_str = convertToStr(hours)
    const minutes_str = convertToStr(minutes)
    const seconds_str = convertToStr(seconds)


    // Muestra el resultado en el elemento con id "countdown"
    document.getElementById("countdown").innerHTML =
        `${days_str} : ${hours_str} : ${minutes_str} : ${seconds_str}`;
}

function convertToStr(num){
    if (num < 10){
        return `0${num}` 
    }
    return `${num}` 
}

// Llama a la función actualizarCountdown una vez al cargar la página
actualizarCountdown();

// Actualiza el countdown cada segundo
setInterval(actualizarCountdown, 1000); // Actualiza cada segundo