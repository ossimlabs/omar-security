package omar.security.plugin


import groovy.sql.Sql


class O2SearchPreference {

	Boolean azimuthEnabled = false
	Double azimuthMax = 360
	Double azimuthMin = 0
	String be = ""
	Boolean beEnabled = false
	Boolean cloudCoverEnabled = false
	Double cloudCoverMax = 100
	Double cloudCoverMin = 0
	Boolean copyWmsButton = true
	String countryCode = ""
	Boolean countryCodeEnabled = false
	String customEndDateTime = new Date().format( "yyyy-MM-dd HH:mm:ss" )
	String customStartDateTime = "1970-01-01 00:00:00"
	String dateType = "acquisition_date"
	Boolean downloadImageButton = true
	Boolean downloadKmlButton = true
	String duration = "none"
	Boolean elevationEnabled = false
	Double elevationMax = 90
	Double elevationMin = 0
	String filename = ""
	Boolean filenameEnabled = false
	String imageId = ""
	Boolean imageryEnabled = true
	Boolean imageIdEnabled = false
	Boolean jpipImageButton = true
	Boolean jpipOrthoButton = true
	Double mapCenterX = 0
	Double mapCenterY = 0
	Double mapRotation = 0
	Boolean mapVisibility = false
	Integer mapZoom = 3
	String missionId = ""
	Boolean missionIdEnabled = false
	Boolean niirsEnabled = false
	Double niirsMax = 9
	Double niirsMin = 0
	String productType = ""
	Boolean productTypeEnabled = false
	String resultsSort = "acquisition_date,+D,Acquired"
	String sensorId = ""
	Boolean sensorIdEnabled = false
	Boolean shareLinkButton = true
	String spatial = "none"
	Boolean sunAzimuthEnabled = false
	Double sunAzimuthMax = 360
	Double sunAzimuthMin = 0
	Boolean sunElevationEnabled = false
	Double sunElevationMax = 90
	Double sunElevationMin = -90
	String targetId = ""
	Boolean targetIdEnabled = false
	Boolean videoEnabled = false
	Boolean viewMetadataButton = true
	Boolean viewOrthoImageButton = true
	String wac = ""
	Boolean wacEnabled = false
	Boolean zoomToImageExtentButton = true


	static belongsTo = [ preference: Preference ]
}
