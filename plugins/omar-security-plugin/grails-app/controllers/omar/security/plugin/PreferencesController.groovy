package omar.security.plugin


import grails.converters.JSON


class PreferencesController {

	def preferencesService
	def securityService


	def getPreferences() {
		JSON.use( "deep" ) {
			render preferencesService.getPreferences() as JSON
		}
	}

	def index() {
		render(
			model: [ userPreferences: preferencesService.getPreferences() ],
			view: "/preferences/index.gsp"
		)
	}

	def updatePreferences() {
		preferencesService.updatePreferences( request.JSON )


		render "Preferences Updated..."
	}
}
