
Waves.attach('.menu_btn');
Waves.attach('#ham_wrap');
Waves.init();

(function(){
 
    var menu = document.getElementById('menu'),
        menuTrigger = document.getElementById('ham_wrap'),
        overlay = document.getElementById('overlay'),
        x = document.getElementById('x_wrap'),
        sideMenu = document.querySelector('#menu .side_menu');
    
    var isOpen = false;

    function menuToggle(e) {
        e.preventDefault();
        e.stopPropagation();
        menu.classList.toggle('menu_open');
        overlay.classList.toggle('overlay_visible');
        isOpen = !isOpen;
    }

    menuTrigger.addEventListener('click', menuToggle);

    x.addEventListener('click', menuToggle);

    document.body.addEventListener('click', function(e) {
        if (isOpen) {
            menuToggle(e);
        }
    });

    sideMenu.addEventListener('click', function(e) {
        e.stopPropagation();
    });

})()
