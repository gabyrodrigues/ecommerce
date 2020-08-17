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

//checkout wizard form
let currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

let tab_wizard = document.getElementsByClassName("tab");

let next_button = document.getElementById("next_button");
let prev_button = document.getElementById("prev_button");

function showTab(n) {
    let tab_wizard = document.getElementsByClassName("tab");

    // This function will display the specified tab of the form...
    tab_wizard[n].classList.add("-active");

    let next_button = document.getElementById("next_button");
    let prev_button = document.getElementById("prev_button");

    //... and fix the Previous/Next buttons:
    if (n == 0) {
        prev_button.classList.remove("-visible");
    } else {
        prev_button.classList.add("-visible");
    }

    if (n == (tab_wizard.length - 1)) {
        next_button.innerHTML = "Concluir compra";
    } else {
        next_button.innerHTML = "Próximo";
    }
    //... and run a function that will display the correct step indicator:
    fixStepIndicator(n);
}

function nextPrev(n) {
    // This function will figure out which tab to display

    // Hide the current tab:
    tab_wizard[currentTab].classList.remove("-active");
    // Increase or decrease the current tab by 1:
    currentTab = currentTab + n;
    // if you have reached the end of the form...
    if (currentTab >= tab_wizard.length) {
        // ... the form gets submitted:
        // document.getElementById("regForm").submit();
        return false;
    }
    // Otherwise, display the correct tab:
    showTab(currentTab);
}

function fixStepIndicator(n) {
    // This function removes the "active" class of all steps...
    let item_progress = document.querySelectorAll(".checkout-progress .item");

    for (let i = 0; i < item_progress.length; i++) {
        item_progress[i].classList.remove("-active");
    }

    //... and adds the "active" class on the current step:
    item_progress[n].classList.add("-active");
}

prev_button.addEventListener('click', function () { nextPrev(-1) });
next_button.addEventListener('click', function () { nextPrev(1) });

//hide/show payment forms checkout
let checkmark = document.querySelectorAll(".payment-forms .checkmark");

let payment_form = document.querySelectorAll(".payment-forms .radio");
let boleto_payment = document.querySelector(".payment-forms .radio#boleto");
let credit_payment = document.querySelector(".payment-forms .radio#credit");

let card_container = document.querySelector(".payment-container .card-container");
let boleto_container = document.querySelector(".payment-container .boleto-container");

for(let i = 0; i < payment_form.length; i++) {
    payment_form[i].checked = true;

    payment_form[i].onchange = function () {
        if(credit_payment.checked) {
            boleto_container.classList.remove("-visible");
            card_container.classList.add("-visible");
        } else {
            boleto_container.classList.add("-visible");
            card_container.classList.remove("-visible");
            limpar_campos();
        }
    }
}

function limpar_campos() {
    document.getElementById("numero_cartao").value = "";
    document.getElementById("nome_titular").value = "";
    document.getElementById("data_validade").value = "";
    document.getElementById("cvv").value = "";
}
