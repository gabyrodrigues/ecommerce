let body = document.querySelector("body");

//funciona apenas no checkout para prevenir de exibir erros nas outras telas
if(body.classList.contains("checkout") || (body.classList.contains("compras") && body.classList.contains("edit"))) {
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
        // Exit the function if any field in the current tab is invalid:
        if (n == 1 && !validateForm()) return false;
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

    function validateForm() {
        let card_payment = document.querySelector(".payment-forms .radio#credit");
        let card_inputs = document.querySelectorAll(".card-container .fieldset .input");

        // This function deals with validation of the form fields
        let x, y, i, valid = true;

        x = document.getElementsByClassName("tab");
        y = x[currentTab].getElementsByTagName("input");

        // A loop that checks every input field in the current tab:
        for (i = 0; i < y.length; i++) {
            // If a field is empty...
            if (y[i].value == "") {

                //removes the invalid class if other option is selected
                if (!card_payment.checked) {
                    for (let j = 0; j <= card_inputs.length; j++) {
                        card_inputs[j].classList.remove("-invalid");
                    }

                    valid = true;
                }

                // add an "invalid" class to the field:
                if (!y[i].classList.contains("-invalid")) {
                    y[i].classList.add("-invalid");
                }

                // and set the current valid status to false
                valid = false;
            } else { //removing input invalid classes
                if (y[i].classList.contains("-invalid")) {
                    y[i].classList.remove("-invalid");
                }
            }
        }

        return valid; // return the valid status
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

    //checkout hide/show payment forms
    let payment_form = document.querySelectorAll(".payment-forms .radio");
    let credit_payment = document.querySelector(".payment-forms .radio#credit");

    let card_container = document.querySelector(".payment-container .card-container");
    let boleto_container = document.querySelector(".payment-container .boleto-container");

    for (let i = 0; i < payment_form.length; i++) {
        payment_form[i].checked = true;

        payment_form[i].onchange = function () {
            if (credit_payment.checked) {
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
}
