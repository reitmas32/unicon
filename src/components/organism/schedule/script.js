let items = document.querySelectorAll('.slider .item');

let next_center = document.getElementById('next-at-the-center');
let prev_center = document.getElementById('prev-at-the-center');

var screenWidth = window.innerWidth;

console.log(screenWidth)

let active = 0;
function loadShow() {
    let stt = 0;
    items[active].style.transform = `translateX(-200px)`;
    items[active].style.zIndex = 1;
    items[active].style.filter = 'none';
    items[active].style.opacity = 1;
    for (var i = active + 1; i < items.length; i++) {
        stt++;
        if (screenWidth > 1200) {

            items[i].style.transform = `translateX(${500 * stt}px) scale(${1 - 0.2 * stt})`;
        } else {
            items[i].style.transform = `translateY(${500 * stt}px) scale(${1 - 0.2 * stt})`;

        }
        items[i].style.zIndex = -stt;
        items[i].style.filter = 'blur(1px)';
        items[i].style.opacity = stt > 2 ? 0 : 0.6;
    }
    stt = 0;
    for (var i = active - 1; i >= 0; i--) {
        stt++;
        if (screenWidth > 1200) {

            items[i].style.transform = `translateX(${-900 * stt}px) scale(${1 - 0.2 * stt})`;
        } else {
            items[i].style.transform = `translateY(${-900 * stt}px) scale(${1 - 0.2 * stt})`;

        }
        items[i].style.zIndex = -stt;
        items[i].style.filter = 'blur(1px)';
        items[i].style.opacity = stt > 2 ? 0 : 0.6;
    }
}
loadShow();


next_center.onclick = function () {
    active = active + 1 < items.length ? active + 1 : active;
    loadShow();
}
prev_center.onclick = function () {
    active = active - 1 >= 0 ? active - 1 : active;
    loadShow();
}