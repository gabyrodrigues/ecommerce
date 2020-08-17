let body = document.querySelector("body");

//funciona apenas no checkout para prevenir de exibir erros nas outras telas
if(body.classList.contains("compras-checkout") || body.classList.contains("compras-edit")) {
    function mascaraCartao(data) {
        if (mascaraInteiro(data) == false) {
            event.returnValue = false;
        }

        return formataCampo(data, '0000 0000 0000 0000', event);
    }

    function mascaraData(data) {
        if (mascaraInteiro(data) == false) {
            event.returnValue = false;
        }

        return formataCampo(data, '00/00', event);
    }

    function mascaraCvv(value) {
        if (mascaraInteiro(value) == false) {
            event.returnValue = false;
        }

        return formataCampo(value, '000', event);
    }

    function mascaraCep(value) {
        if (mascaraInteiro(value) == false) {
            event.returnValue = false;
        }

        return formataCampo(value, '00000-000', event);
    }

    //valida numero inteiro com mascara
    function mascaraInteiro() {
        if (event.keyCode < 48 || event.keyCode > 57) {
            event.returnValue = false;
            return false;
        }

        return true;
    }

    //formata de forma generica os campos
    function formataCampo(campo, Mascara, evento) {
        let boleanoMascara;

        let digitado = evento.keyCode;
        exp = /\-|\.|\/|\(|\)| /g
        campoSoNumeros = campo.value.toString().replace(exp, "");

        let posicaoCampo = 0;
        let NovoValorCampo = "";
        let TamanhoMascara = campoSoNumeros.length;;

        if (digitado != 8) { // backspace
            for (i = 0; i <= TamanhoMascara; i++) {
                boleanoMascara = ((Mascara.charAt(i) == "-") || (Mascara.charAt(i) == ".")
                    || (Mascara.charAt(i) == "/"))
                boleanoMascara = boleanoMascara || ((Mascara.charAt(i) == "(")
                    || (Mascara.charAt(i) == ")") || (Mascara.charAt(i) == " "))
                if (boleanoMascara) {
                    NovoValorCampo += Mascara.charAt(i);
                    TamanhoMascara++;
                } else {
                    NovoValorCampo += campoSoNumeros.charAt(posicaoCampo);
                    posicaoCampo++;
                }
            }
            campo.value = NovoValorCampo;
            return true;
        } else {
            return true;
        }
    }

    function id(el) {
        return document.getElementById(el);
    }

    window.onload = function () {
        id('cep').onkeypress = function () {
            mascaraCep(this);
        }

        id('cvv').onkeypress = function () {
            mascaraCvv(this);
        }

        id('data_validade').onkeypress = function () {
            mascaraData(this);
        }

        id('numero_cartao').onkeypress = function () {
            mascaraCartao(this);
        }
    }
}
