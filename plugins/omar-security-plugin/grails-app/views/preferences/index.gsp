<!DOCTYPE html>
<html>
	<head>
		<meta charset = "utf-8">
		<meta http-equiv = "X-UA-Compatible" content = "IE=edge">
		<meta name = "viewport" content = "width=device-width, initial-scale = 1">
		<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>O2 Preferences</title>

		<asset:stylesheet src = "preferences-bundle.css"/>
		<asset:stylesheet src = "webjars/bootswatch/3.3.5+4/${ userPreferences.pageTheme }/bootstrap.min.css"/>
		<asset:script type = "text/javascript">
			var preferences = {
				contextPath: "${ request.contextPath }"
			};
			var userPreferences = ${ raw( userPreferences.encodeAsJSON() as String ) };
		</asset:script>
	</head>
	<body data-spy = "scroll" data-target = "#affix">
		<div class = "container-fluid">
            <g:render template = "/security-classification-header"/>
			<div class = "row">
		    	<nav class = "col-md-2 bs-docs-sidebar" id = "affix">
			        <ul class="nav nav-stacked" data-spy = "affix">
						<%
							def config = grailsApplication.config
							def headerUsername = config.requestHeaderUsername
						%>
						${ request.getHeader( headerUsername ) ?: config.defaultUsername }
						<g:each in = "${[
							[ href: "general", label: "General", subHrefs: [
									[ href: "generalImageProperties", label: "Image Properties" ],
									[ href: "generalLinks", label: "Links" ],
									[ href: "generalMiscellaneous", label: "Miscellaneous" ]
								]
							],
							[ href: "search", label: "Search", subHrefs: [
									[ href: "searchDataTypeFilters", label: "Data Types" ],
									[ href: "searchKeywordFilters", label: "Keyword Filters" ],
									[ href: "searchRangeFilters", label: "Range FIlters" ],
									[ href: "searchTemporalFilters", label: "Temporal Filters" ],
									[ href: "searchSpatialFilters", label: "Spatial Filters" ],
									[ href: "searchMapSettings", label: "Map Settings" ],
									[ href: "searchResultsSettings", label: "Results Settings" ]
								]
							],
							[ href: "tlv", label: "Time Lapse Viewer", subHrefs: [
									[ href: "tlvLayers", label: "Layers" ],
									[ href: "tlvSearch", label: "Search" ],
									[ href: "tlvView", label: "View" ]
								]
							]
						]}">
							<li>
								<a href = "#${ it.href }">${ it.label }</a>
								<ul class = "nav nav-stacked">
									<g:each in = "${ it.subHrefs }">
										<li><a href = "#${ it.href }">${ it.label }</a></li>
									</g:each>
								</ul>
							</li>
						</g:each>
			        </ul>
			    </nav>
			    <div class = "col-md-10">
					<h1 align = "center">O2 Preferences</h1>
					<g:render template = "/preferences/general"/>
					<g:render template = "/preferences/search"/>
					<g:render template = "/preferences/time-lapse-viewer"/>
				</div>
			</div>
			<g:render template = "/preferences/dialogs"/>
		</div>
		<asset:javascript src = "preferences-bundle.js"/>
		<asset:deferredScripts/>
	</body>
</html>
