package omar.security.plugin


class O2Controller {

	def savedLinkService


	def index() {
		def hash = params.h
		if ( hash ) {
			def url = savedLinkService.getSavedLink( hash )
			if ( url ) {
				redirect( url: "${ url }" )
			}
			else {
				render "No URL found. :("
			}
			println url
		}
		else {
			render "No hash parameter present. :("
		}


		return false
	}
}
