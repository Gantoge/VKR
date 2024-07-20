$(function () {
    // Показать модальное окно для входа
    $('#btn-nav-logo').click(function () {
        $('#loginModal').addClass('modal_active');
    });

    // Показать модальное окно для обратной связи
    $('#callback-button').click(function () {
        $('#callbackModal').addClass('modal_active');
    });

    // Показать модальное окно для регистрации из окна входа
    $('#register-link').click(function (e) {
        e.preventDefault();
        $('#loginModal').removeClass('modal_active');
        $('#registerModal').addClass('modal_active');
    });

    // Скрыть модальное окно при клике на кнопку закрытия
    $('.modal__close-button').click(function () {
        const modal = $(this).closest('.modal');
        modal.removeClass('modal_active');

        // Если закрывается окно регистрации, открыть окно входа
        if (modal.attr('id') === 'registerModal') {
            $('#loginModal').addClass('modal_active');
        }
    });

    // Скрыть модальное окно при клике вне его контента
    $('.modal').mouseup(function (e) {
        let modalContent = $(this).find(".modal__content");
        if (!modalContent.is(e.target) && modalContent.has(e.target).length === 0) {
            $(this).removeClass('modal_active');

            // Если закрывается окно регистрации, открыть окно входа
            if ($(this).attr('id') === 'registerModal') {
                $('#loginModal').addClass('modal_active');
            }
        }
    });
});




  
 //Поиск
function myFunction() {
    let input, filter, containers, a, span, li, i, txtValue;
    input = document.getElementById('myInput');
    filter = input.value.toLowerCase();
    containers = document.getElementsByClassName('cards-container');

    if (filter === "") {
        for (i = 0; i < containers.length; i++) {
            containers[i].style.display = "";
        }
        return;
    }

    let matchedBlocks = []; 

    for (i = 0; i < containers.length; i++) {
        span = containers[i].getElementsByClassName('cards-container-db')[0];
        li = span.getElementsByTagName('li');
        let found = false;

        for (let j = 0; j < li.length; j++) {
            if (li[j].id === 'metro') {
                txtValue = li[j].textContent || li[j].innerText;
                if (txtValue.toLowerCase().indexOf(filter) > -1) {
                    found = true;
                    break;
                }
            }
        }

        if (found) {
            matchedBlocks.push(containers[i]); 
        } else {
            containers[i].style.display = "none";
        }
    }

   
    for (let k = 0; k < matchedBlocks.length; k++) {
        matchedBlocks[k].style.display = "";
    }
}

