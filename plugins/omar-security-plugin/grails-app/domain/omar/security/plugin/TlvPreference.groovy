package omar.security.plugin

class TlvPreference {

	Boolean crossHairLayer = false
	Integer dimensions = 2
	String endDate = ""
	String location = ""
	Double maxCloudCover = 100
	Integer maxResults = 10
	Double minNiirs = 0
	Boolean overviewMap = false
	Boolean searchOriginLayer = false
	String sensor = ""
	String startDate = ""
	Boolean swipe = false
	Boolean terrainWireframe = false
	String wmsTileSchema = "multiple"


	static belongsTo = [ preference: Preference ]
}
