
Waves.attach('.menu_btn');
Waves.attach('#ham_wrap');
Waves.init();

(function(){
 
    var menu = document.getElementById('menu'),
        menuTrigger = document.getElementById('ham_wrap'),
        overlay = document.getElementById('overlay'),
        x = document.getElementById('x_wrap');

    function menuToggle(e) {
        e.preventDefault();
        menu.classList.toggle('menu_open');
        overlay.classList.toggle('overlay_visible');
    }

    menuTrigger.addEventListener('click', menuToggle);

    x.addEventListener('click', menuToggle);

})()
