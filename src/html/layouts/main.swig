<!DOCTYPE html>
<html lang="">
    <head>
        <meta charset="utf-8">
        <title>{% block page_title %}{% endblock %}</title>
        <meta property="og:image" content="">
		<meta property="og:description" content="">
		<meta property="og:title" content="">
        <meta name="apple-mobile-web-app-capable" content="yes">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="google-site-verification" content="" />
        <meta name="msapplication-tap-highlight" content="no"/>
        <link href="/css/style.css" rel="stylesheet">
    </head>
    <body>
        

        <div class="menu_bar">
            <button class="menu_btn">Jovana Skoric</button>
        </div>
        
        <a id="ham_wrap"><span class="hamburger"></span></a>

        <div class="side_menu">
            <nav>
                <ul>
                    {% set active_page = BASE_URI | replace('^([^/]+)/.+$', '$1') %}
                    <li class="menu_items"><a {% if active_page == "about" %} class="active" {% endif %} title="about"  href="about/index.html">about</a></li>
                    <li class="menu_items">
                        <a {% if active_page == "projects" %} class="active" {% endif %} title="projects" href="#">projects</a>
                        <ul>
                            <li class="project"><a class="" title="Astal" href="www.astal.rs">Astal</a></li>
                            <li class="project"><a class="" title="Rujji Design" href="www.rujji.desing">Rujji Design</a></li>
                            <li class="project"><a class="" title="Spaceeey" href="spaceeey.jovana.ninja">Spaceeey</a></li>
                            <li class="project"><a class="" title="(No)name" href="noname.jovana.ninja">(No)name</a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
            
        </div>
        
        
        
        <div class="middle_content_wrapper">
            {% block page_content %}{% endblock %}
        </div>

        <footer>
            <div class="footer_img">
            </div>
            <nav>
                <ul>
                    {% set active_page = BASE_URI | replace('^([^/]+)/.+$', '$1') %}
                    <li><a {% if active_page == "about" %} class="active" {% endif %} title="about"  href="about/index.html">about</a></li>
                    <li><a {% if active_page == "projects" %} class="active" {% endif %} title="projects" href="#">projects</a></li>
                </ul>
            </nav>
            <p>in development...</p>
            <div class="copyright">
                <p>2017 &copy; www.jovana.ninja</p>
            </div>
            
        </footer>
        
        <script src="../js/waves.js"></script>
        <script src="../js/menu.js"></script>
        {% block scripts %}{% endblock %}
    </body>
</html>
