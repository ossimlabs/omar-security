<%
	def background = grailsApplication.config.securityClassification.backgroundColor
	def color = grailsApplication.config.securityClassification.textColor
%>
<div class = "row security-classification" id = "securityBanner" style = "background-color: ${ background }; color: ${ color };">
	<div class = "col-md-12">
		${ grailsApplication.config.securityClassification.classification }
	</div>
</div>
