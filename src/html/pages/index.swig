{% extends '../layouts/main.swig' %}

{% block page_title %} Jovana Skoric {% endblock %}

			{% block page_content %}
				<div id="container" class="container">
					<ul id="scene" class="scene">
						<li class="layer" data-depth="0.05"><img class="sun" src="images/sun.png"/></li>
						<li class="layer" data-depth="0.10"><img class="back_cloud" src="images/back_cloud.png"/></li>
						<li class="layer" data-depth="0.40"><img class="middle_cloud" src="images/middle_cloud.png"/></li>
						<li class="layer" data-depth="0.30">
							
							
								<img class="windmill" src="images/windmill.png"/>
								<img class="sails" src="images/sails.png"/>
						

						</li>
					</ul>
				</div>
				<div class="empty_div"></div>
			{% endblock %}

	{% block scripts %}
		<script src="../js/parallax.js"></script>
		<script src="../js/home.js"></script>
	{% endblock %}