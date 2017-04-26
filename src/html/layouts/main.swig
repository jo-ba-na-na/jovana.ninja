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
        <link href="/css/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="menu_wrapper">
            <nav>
                <ul>
                    {% set active_page = BASE_URI | replace('^([^/]+)/.+$', '$1') %}
                    <li class="menu_items"><a {% if active_page == "about" %} class="active" {% endif %} title="about"  href="about/index.html">about</a></li>
                    <li class="menu_items"><a {% if active_page == "showcase" %} class="active" {% endif %} title="showcase" href="showcase/index.html">showcase</a></li>
                    <li class="menu_items"><a {% if active_page == "contact" %} class="active" {% endif %} title="contact" href="contact/index.html">contact</a></li>
                    <li id="ham_wrap"><a><span class="hamburger"></span></a></li>
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
                    <li><a {% if active_page == "showcase" %} class="active" {% endif %} title="showcase" href="showcase/index.html">showcase</a></li>
                    <li><a {% if active_page == "contact" %} class="active" {% endif %} title="contact" href="contact/index.html">contact</a></li>
                </ul>
            </nav>
            <p>in development...</p>
            <div class="copyright">
                <p>2017 &copy; www.jovana.ninja</p>
            </div>
            
        </footer>
        
        {% block scripts %}{% endblock %}
    </body>
</html>
