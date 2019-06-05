package omar.security.plugin


import groovy.sql.Sql


class O2SearchPreference {

	def grailsApplication

	Boolean azimuthEnabled = grailsApplication.config.defaultPreferences.azimuthEnabled ?: false
	Double azimuthMax = grailsApplication.config.defaultPreferences.azimuthMax ?: 360
	Double azimuthMin = grailsApplication.config.defaultPreferences.azimuthMin ?: 0
	String be = grailsApplication.config.defaultPreferences.be ?: ""
	Boolean beEnabled = grailsApplication.config.defaultPreferences.beEnabled ?:false
	Boolean cloudCoverEnabled = grailsApplication.config.defaultPreferences.cloudCoverEnabled ?: false
	Double cloudCoverMax = grailsApplication.config.defaultPreferences.cloudCoverMax ?: 100
	Double cloudCoverMin = grailsApplication.config.defaultPreferences.cloudCoverMin ?: 0
	Boolean copyWmsButton = grailsApplication.config.defaultPreferences.copyWmsButton ?: true
	String countryCode = grailsApplication.config.defaultPreferences.countryCode ?: ""
	Boolean countryCodeEnabled = grailsApplication.config.defaultPreferences.countryCodeEnabled ?: false
	String customEndDateTime = grailsApplication.config.defaultPreferences.customEndDateTime ?: new Date().format( "yyyy-MM-dd HH:mm:ss" )
	String customStartDateTime = grailsApplication.config.defaultPreferences.customStartDateTime ?: "1970-01-01 00:00:00"
	String dateType = grailsApplication.config.defaultPreferences.dateType ?: "acquisition_date"
	Boolean downloadImageButton = grailsApplication.config.defaultPreferences.downloadImageButton ?: true
	Boolean downloadKmlButton = grailsApplication.config.defaultPreferences.downloadKmlButton ?: true
	String duration = grailsApplication.config.defaultPreferences.duration ?: "none"
	Boolean elevationEnabled = grailsApplication.config.defaultPreferences.elevationEnabled ?: false
	Double elevationMax = grailsApplication.config.defaultPreferences.elevationMax ?: 90
	Double elevationMin = grailsApplication.config.defaultPreferences.elevationMin ?: 0
	String filename = grailsApplication.config.defaultPreferences.filename ?: ""
	Boolean filenameEnabled = grailsApplication.config.defaultPreferences.filenameEnabled ?: false
	String imageId = grailsApplication.config.defaultPreferences.imageId ?: ""
	Boolean imageryEnabled = grailsApplication.config.defaultPreferences.imageryEnabled ?: true
	Boolean imageIdEnabled = grailsApplication.config.defaultPreferences.imageIdEnabled ?: false
	Boolean jpipImageButton = grailsApplication.config.defaultPreferences.jpipImageButton ?: true
	Boolean jpipOrthoButton = grailsApplication.config.defaultPreferences.jpipOrthoButton ?: true
	Double mapCenterX = grailsApplication.config.defaultPreferences.mapCenterX ?: 0
	Double mapCenterY = grailsApplication.config.defaultPreferences.mapCenterY ?: 0
	Double mapRotation = grailsApplication.config.defaultPreferences.mapRotation ?: 0
	Boolean mapVisibility = grailsApplication.config.defaultPreferences.mapVisibility ?: false
	Integer mapZoom = grailsApplication.config.defaultPreferences.mapZoom ?: 3
	String missionId = grailsApplication.config.defaultPreferences.missionId ?: ""
	Boolean missionIdEnabled = grailsApplication.config.defaultPreferences.missionIdEnabled ?: false
	Boolean niirsEnabled = grailsApplication.config.defaultPreferences.niirsEnabled ?: false
	Double niirsMax = grailsApplication.config.defaultPreferences.niirsMax ?: 9
	Double niirsMin = grailsApplication.config.defaultPreferences.niirsMin ?: 0
	String productType = grailsApplication.config.defaultPreferences.productType ?: ""
	Boolean productTypeEnabled = grailsApplication.config.defaultPreferences.productTypeEnabled ?: false
	String resultsSort = grailsApplication.config.defaultPreferences.resultsSort ?: "acquisition_date,+D,Acquired"
	String sensorId = grailsApplication.config.defaultPreferences.sensorId ?: ""
	Boolean sensorIdEnabled = grailsApplication.config.defaultPreferences.sensorIdEnabled ?: false
	Boolean shareLinkButton = grailsApplication.config.defaultPreferences.shareLinkButton ?: true
	String spatial = grailsApplication.config.defaultPreferences.spatial ?: "none"
	Boolean sunAzimuthEnabled = grailsApplication.config.defaultPreferences.sunAzimuthEnabled ?: false
	Double sunAzimuthMax = grailsApplication.config.defaultPreferences.sunAzimuthMax ?: 360
	Double sunAzimuthMin = grailsApplication.config.defaultPreferences.sunAzimuthMin ?: 0
	Boolean sunElevationEnabled = grailsApplication.config.defaultPreferences.sunElevationEnabled ?: false
	Double sunElevationMax = grailsApplication.config.defaultPreferences.sunElevationMax ?: 90
	Double sunElevationMin = grailsApplication.config.defaultPreferences.sunElevationMin ?: -90
	String targetId = grailsApplication.config.defaultPreferences.targetId ?: ""
	Boolean targetIdEnabled = grailsApplication.config.defaultPreferences.targetIdEnabled ?: false
	Boolean videoEnabled = grailsApplication.config.defaultPreferences.videoEnabled ?: false
	Boolean viewMetadataButton = grailsApplication.config.defaultPreferences.viewMetadataButton ?: true
	Boolean viewOrthoImageButton = grailsApplication.config.defaultPreferences.viewOrthoImageButton ?: true
	String wac = grailsApplication.config.defaultPreferences.wac ?: ""
	Boolean wacEnabled = grailsApplication.config.defaultPreferences.wacEnabled ?: false
	Boolean zoomToImageExtentButton = grailsApplication.config.defaultPreferences.zoomToImageExtentButton ?: true


	static belongsTo = [ preference: Preference ]
}
