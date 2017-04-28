
Waves.attach('.menu_btn');
Waves.attach('#ham_wrap');
Waves.init();

(function(){
 
    var menu = document.getElementById('menu'),
        menuTrigger = document.getElementById('ham_wrap');

    menuTrigger.addEventListener('click', function(e) {
        e.preventDefault();
        menu.classList.toggle('menu_open');
    });
})()
