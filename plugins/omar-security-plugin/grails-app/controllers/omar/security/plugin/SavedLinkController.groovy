package omar.security.plugin


import grails.converters.JSON


class SavedLinkController {

	def preferencesService
	def savedLinkService


	def getSavedLinks() {
		render savedLinkService.getSavedLinks() as JSON
	}

	def index() {
		if ( request.JSON.hash ) {
			render savedLinkService.editSavedLink( request )
		}
		else if ( params.id ) {
			render savedLinkService.deleteSavedLink( params.id )
		}
		else if ( request.JSON.url ) {
			render savedLinkService.saveLink( request )
		}
		else {
			render(
				model: [
					saveLink: params.saveLink,
					userPreferences: preferencesService.getPreferences()
				],
				view: "/preferences/index.gsp"
			)
		}
	}

	def list() {
		render(
			model: [
				listSavedLinks: true,
				userPreferences: preferencesService.getPreferences()
			],
			view: "/preferences/index.gsp"
		)
	}
}
