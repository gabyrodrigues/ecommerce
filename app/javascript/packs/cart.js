//document ready function
function ready(fn) {
    if (document.readyState != 'loading') {
        fn();
    } else {
        document.addEventListener('DOMContentLoaded', fn);
    }
}

//add product items to cookie json
function addToCart(produto, img_url, qtd) {
    let tocart_alert = document.querySelector(".tocart-alert");

    for (let i = 0; i < qtd; i++) {
        let carrinho = [];
        let carrinho_log = JSON.parse(getCookieValue('carrinho'));

        if (carrinho_log != null) {
            carrinho = carrinho_log;
        }

        let produto_values = JSON.parse(produto);

        produto_values["img_url"] = img_url;

        carrinho.push(produto_values);
        document.cookie = `carrinho = ${JSON.stringify(carrinho)}; max-age=` + 30 * 24 * 60 * 60;

        console.log(carrinho);
    }

    tocart_alert.classList.add("-visible");
    setTimeout(() => { tocart_alert.classList.remove("-visible"); }, 2000);


    updateQtd();
}

//remove product from cart (-1 qty)
function removeFromCart(produto) {
    var carrinho = []
    var carrinho_log = JSON.parse(getCookieValue('carrinho'));

    if (carrinho_log != null) carrinho = carrinho_log

    produtos = carrinho.filter(prod => prod.id == produto);
    produtos.pop();
    carrinho = carrinho.filter(prod => prod.id != produto).concat(produtos);
    document.cookie = `carrinho = ${JSON.stringify(carrinho)}; max-age=` + 30 * 24 * 60 * 60;

    setCart();
}

//add +1 qty to cart
function increaseCartValue(id) {
    let carrinho_log = JSON.parse(getCookieValue('carrinho'));

    let produto = carrinho_log.filter(el => el.id == id)[0];

    addToCart(JSON.stringify(produto), produto.img_url, 1);

    setCart();
}

//update cart qty counter
function updateQtd() {
    var carrinho_log = JSON.parse(getCookieValue('carrinho'));

    let counter = document.querySelector('#cart_button .counter');
    counter.innerHTML = carrinho_log !== null ? carrinho_log.length : '0';
}

//get cookie value
function getCookieValue(name) {
    var cookie = document.cookie.match('(^|;)\\s*' + name + '\\s*=\\s*([^;]+)');

    if (cookie != null) {
        return cookie ? cookie.pop() : '';
    } else {
        return null;
    }
}

//cart setup
function setCart() {
    $(".added-products .list").empty();
    $(".finish-shopping").empty();
    $(".cart-options").empty();

    let carrinho_log = JSON.parse(getCookieValue('carrinho'));
    console.log(carrinho_log);

    if (carrinho_log !== null) {
        $(".finish-shopping").append(`
            <div class="finish">
                <button type="button" class="action" id="finalizar_compra">Finalizar compra</button>
            </div>
        `);

        $(".cart-options").append(`
            <button type="button" class="action" id="limpar_carrinho">Limpar carrinho</button>
       `);
    } else {
        $(".added-products .list").append(`
            <p class="note">Seu carrinho de compras está vazio</p>
       `);
    }

    let preco_total = 0;

    if (carrinho_log !== null) {
        let carrinho_filter = carrinho_log.reduce((x, y) => x.findIndex(e => e.id == y.id) < 0 ? [...x, y] : x, [])

        carrinho_filter.forEach(produto => {
            let qtd = carrinho_log.filter(prod => prod.id == produto.id).length;

            let produto_html = `
                <li class="product">
                    <div class="minimal-details">
                        <div class="image">
                            <span class="qty">${qtd}</span>

                            <a href="/produtos/view?produto_id=${produto.id}" class="link">
                                <img alt="Imagem do produto" class="img" src="${produto.img_url}">
                            </a>
                        </div>

                        <div class="attributes">
                            <a href="/produtos/view?produto_id=${produto.id}" class="name -underlined">${produto.nome}</a>
                        </div>

                        <div class="price">
                            <span class="subtotal">R$ ${formatCurrency(produto.preco)}</span>
                        </div>
                    </div>
                    <div class="actions">
                        <a onclick="increaseCartValue(${produto.id})" class="action -add"></a>
                        <a onclick="removeFromCart(${produto.id})" id="remover-do-carrinho" class="action -remove"></a>
                    </div>
                </li>
            `;

            preco_total += parseFloat(produto.preco) * qtd;
            $(".added-products .list").append(produto_html);
        });

        $(".finish-shopping").append(`
            <div class="prices">
                <span class="label">Subtotal</span>
                <span class="price">R$ ` + formatCurrency(preco_total) + `</span>
            </div>
        `);
    }

    /*$("#finalizar-compra").click(function () {
        carrinho_log = JSON.parse(localStorage.getItem('carrinho'));
        var carrinho_filter = carrinho_log.reduce((x, y) => x.findIndex(e => e.id == y.id) < 0 ? [...x, y] : x, [])
        var compra_final = [];
        carrinho_filter.forEach(element => {
            qtd = carrinho_log.filter(el => el.id == element.id).length;
            compra_final.push({ produto: element.id, qtde: qtd });
        });
        send_compra(compra_final);
    });*/

    $("#limpar_carrinho").click(function () {
        document.cookie = 'carrinho=; Max-Age=0';
        setCart();
    });

    updateQtd();
}

//format currency BR
function formatCurrency(value) {
    return parseInt(value).toLocaleString('pt-BR') + ',00';
}

//counter qty when page load is ready
ready(() => {
    updateQtd();

    $("#cart_button").click(function () {
        setCart();
    });
});

window.addToCart = addToCart;
window.increaseCartValue = increaseCartValue;
window.removeFromCart = removeFromCart;
