{% extends '../layouts/main.swig' %}

{% block page_title %} JS {% endblock %}

			{% block page_content %}
				<div id="container" class="container">
					<ul id="scene" class="scene">
						<li class="layer" data-depth="0.05"><img class="sun" src="images/layer1.png"></li>
						<li class="layer" data-depth="0.10"><img class="back_clouds" src="images/layer2.png"></li>
						<li class="layer" data-depth="0.40"><img class="middle_clouds" src="images/layer3.png"></li>
						<li class="layer" data-depth="0.30"><img class="hill" src="images/layer4.png"></li>
						<!-- <li class="layer" data-depth="0.90"><img class="front_clouds" src="images/layer5.png"></li> -->
					</ul>
				</div>
				<div class="empty_div">
				</div>
			{% endblock %}

	{% block scripts %}
		<script src="../js/parallax.js"></script>
		<script src="../js/home.js"></script>
	{% endblock %}