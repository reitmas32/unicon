let items_expositors = document.querySelectorAll('.slider-expositors .item-expositor');
let items_schedule = document.querySelectorAll('.slider-schedule .item-schedule');

let next_expositors = document.getElementById('next-expositors');
let prev_expositors = document.getElementById('prev-expositors');

let next_schedule = document.getElementById('next-schedule');
let prev_schedule = document.getElementById('prev-schedule');

var screenWidth = window.innerWidth;

let active_expositor = 0;
let active_schedule = 0;
function loadShow(items, active_item) {
    let stt = 0;
    items[active_item].style.transform = `translateX(-200px)`;
    items[active_item].style.zIndex = 1;
    items[active_item].style.filter = 'none';
    items[active_item].style.opacity = 1;
    for (var i = active_item + 1; i < items.length; i++) {
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
    for (var i = active_item - 1; i >= 0; i--) {
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
loadShow(items_expositors, active_expositor);


next_expositors.onclick = function () {
    active_expositor = active_expositor + 1 < items_expositors.length ? active_expositor + 1 : active_expositor;
    loadShow(items_expositors, active_expositor);
}
prev_expositors.onclick = function () {
    active_expositor = active_expositor - 1 >= 0 ? active_expositor - 1 : active_expositor;
    loadShow(items_expositors, active_expositor);
}


loadShow(items_schedule, active_schedule);


next_schedule.onclick = function () {
    active_schedule = active_schedule + 1 < items_schedule.length ? active_schedule + 1 : active_schedule;
    loadShow(items_schedule, active_schedule);
}

prev_schedule.onclick = function () {
    active_schedule = active_schedule - 1 >= 0 ? active_schedule - 1 : active_schedule;
    loadShow(items_schedule, active_schedule);
}

function changeExpositors() {
    if(active_expositor + 1 == items_expositors.length){
        active_expositor = -1;
    }
    active_expositor = active_expositor + 1 < items_expositors.length ? active_expositor + 1 : active_expositor;
    loadShow(items_expositors, active_expositor);
}

setInterval(changeExpositors, 7000);

function changeSchedule() {
    if(active_schedule + 1 == items_schedule.length){
        active_schedule = -1;
    }
    active_schedule = active_schedule + 1 < items_schedule.length ? active_schedule + 1 : active_schedule;
    loadShow(items_schedule, active_schedule);
}

setInterval(changeSchedule, 5000);