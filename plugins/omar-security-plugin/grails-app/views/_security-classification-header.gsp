<%
	def background = grailsApplication.config.securityClassification.backgroundColor
	def color = grailsApplication.config.securityClassification.textColor
	def classification = grailsApplication.config.securityClassification.classification
%>
<div class = "row security-classification" style = "background-color: ${ background }; color: ${ color };">
	<div class = "col-md-12">
		<span id = "defaultClassification">
			${ grailsApplication.config.securityClassification.classification }
		</span>
		<span id = "currentClassification" hidden>
			${ grailsApplication.config.securityClassification.classification }
		</span>
	</div>
</div>
