let people = document.querySelectorAll('.people-image');
let occupiedPositions = [];

let cursor = 0;

for (var i = 0; i < people.length; i++) {
    let item = people[i];

    randomPos(item);
}

function estaPosicionLibre(posicion, arrayPosiciones, variacion) {
    // Convertir la posición de cadena a números
    const [x, y] = posicion.split(',').map(Number);
  
    // Verificar si la posición está cerca de alguna posición en el array
    for (const pos of arrayPosiciones) {
        const [posX, posY] = pos.split(',').map(Number);
        if (Math.abs(posX - x) <= variacion && Math.abs(posY - y) <= variacion) {
            return false; // La posición está cerca de una posición del array
        }
    }
  
    return true; // La posición no está cerca de ninguna posición del array
}


// Array para almacenar las posiciones ocupadas
// Array para almacenar las posiciones ocupadas

async function randomPos(img) {

    const imgPosition = (img.style.left + "," + img.style.top).replace(/px/g, "");
    img.style.opacity = 0;
    await new Promise(resolve => setTimeout(resolve, 2000));
    const index = occupiedPositions.indexOf(imgPosition);
    if (index !== -1) {
        console.log("en tro")
        occupiedPositions.splice(index, 1);
    }

    const screenWidth = window.innerWidth - 500; // Ancho de la pantalla
    const screenHeight = window.innerHeight - 300; // Alto de la pantalla

    // Definir las posibles posiciones en el eje X (horizontal)
    const possibleXPositions = [];
    for (let i = 1; i <= 5; i++) {
        possibleXPositions.push(Math.floor(i * (screenWidth / 5)));
    }

    // Definir las posibles posiciones en el eje Y (vertical)
    const possibleYPositions = [];
    for (let i = 1; i <= 3; i++) {
        possibleYPositions.push(Math.floor(i * (screenHeight / 3)));
    }


    // Filtrar las posiciones disponibles
    const availablePositions = [];
    for (let x of possibleXPositions) {
        for (let y of possibleYPositions) {
            const position = x + "," + y;
            if (estaPosicionLibre(position, occupiedPositions, 100)) {
                availablePositions.push(position);
            }
        }
    }


    // Verificar si hay posiciones disponibles
    if (availablePositions.length === 0) {
        console.log("No hay posiciones disponibles.");
        return;
    }

    // Seleccionar aleatoriamente una posición disponible
    const randomIndex = Math.floor(Math.random() * availablePositions.length);
    let [randomX_str, randomY_str] = availablePositions[randomIndex].split(",");

    console.log(occupiedPositions);

    // Almacenar la posición ocupada

    let randomX_num = parseFloat(randomX_str)
    let randomY_num = parseFloat(randomY_str)

    randomX_num = randomWithVariation(randomX_num, 70)
    randomY_num = randomWithVariation(randomY_num, 70)

    randomX_str = randomX_num.toString();
    randomY_str = randomY_num.toString();

    occupiedPositions.push(randomX_str + "," + randomY_str);

    const scale = Math.random() * (1.1 - 0.7) + 0.5;

    // Aplicar las posiciones aleatorias a la imagen
    img.style.left = randomX_str + "px";
    img.style.top = randomY_str + "px";

    img.style.transform = `scale(${scale})`
    img.style.opacity = 1;
}


function randomWithVariation(baseNumber, variation) {
    // Calculate the minimum and maximum range
    const min = baseNumber - variation;
    const max = baseNumber + variation;
    
    // Generate a random number within the specified range
    return Math.floor(Math.random() * (max - min) + min);
}

function nextImg() {
    let item = people[cursor];

    

    if(cursor + 1 == people.length ){
        cursor = 0;
    }

    cursor += 1;

    randomPos(item);

    console.log(occupiedPositions.length);
}

setInterval(nextImg, 2000);