package omar.security.plugin


import grails.util.Holders


class TlvPreference {

	def defaultPreferences = Holders.grailsApplication.config.defaultPreferences


	Boolean crossHairLayer = defaultPreferences.crossHairLayer ?: false
	Integer dimensions = defaultPreferences.dimensions ?: 2
	String endDate = defaultPreferences.endDate ?: ""
	String location = defaultPreferences.location ?: ""
	Double maxCloudCover = defaultPreferences.maxCloudCover ?: 100
	Integer maxResults = defaultPreferences.maxResults ?: 25
	Double minNiirs = defaultPreferences.minNiirs ?: 0
	Boolean overviewMap = defaultPreferences.overviewMap ?: false
	Boolean searchOriginLayer = defaultPreferences.searchOriginLayer ?: false
	String sensor = defaultPreferences.sensor ?: ""
	String startDate = defaultPreferences.startDate ?: ""
	Boolean swipe = defaultPreferences.swipe ?: false
	Boolean terrainWireframe = defaultPreferences.terrainWireframe ?: false
	String viewSpace = defaultPreferences.viewSpace ?: "ortho"
	String wmsTileSchema = defaultPreferences.wmsTileSchema ?: "multiple"


	static belongsTo = [ preference: Preference ]
}
