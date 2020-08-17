// hide/show user options on header
let user_button = document.querySelector('#user_button');
let cart_button = document.querySelector('#cart_button');

function toggleUserOptions() {
    let user_options = document.querySelector('.user-space.-logged .options');

    user_options.classList.toggle('-active');
}

user_button.addEventListener('click', function () { toggleUserOptions() });

// hide/show cart on header

function toggleCart() {
    let minicartContent = document.querySelector('.cart-container .content');

    minicartContent.classList.toggle('-active');
}

cart_button.addEventListener('click', function () { toggleCart() });

//hide/show menu mobile
let navigation = document.querySelector(".menu-navigation");
let button_nav = document.querySelector(".page-header .-toggle");
let body = document.querySelector("body");

button_nav.onclick = function () {
    navigation.classList.toggle("-visible");
    body.classList.toggle("-open");
}

let submenu_link = document.querySelectorAll(".menu-item.-parent .content");

for (let i = 0; i < submenu_link.length; i++) {
    submenu_link[i].onclick = function (e) {
        e.preventDefault();
        submenu_link[i].parentElement.classList.toggle("-active");
    }
}


//control qty on product view page
let control_qty = document.querySelectorAll(".control-qty");

let decrement_qty = document.querySelectorAll(".control-qty .-minus");
let increment_qty = document.querySelectorAll(".control-qty .-plus");

let qty_input = document.querySelectorAll(".control-qty .qty");


for (let i = 0; i < qty_input.length; i++) {
    increment_qty[i].onclick = function (e) {
        e.preventDefault();
        qty_input[i].stepUp();
    }

    decrement_qty[i].onclick = function (e) {
        e.preventDefault();
        qty_input[i].stepDown();
    }
}
