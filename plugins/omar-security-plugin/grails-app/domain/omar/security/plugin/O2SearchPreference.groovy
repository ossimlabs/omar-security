package omar.security.plugin

import java.text.SimpleDateFormat
import grails.util.Holders


class O2SearchPreference {

	def defaultPreferences = Holders.grailsApplication.config.defaultPreferences


	Boolean azimuthEnabled = defaultPreferences.azimuthEnabled ?: false
	Double azimuthMax = defaultPreferences.azimuthMax ?: 360
	Double azimuthMin = defaultPreferences.azimuthMin ?: 0
	String be = defaultPreferences.be ?: ""
	Boolean beEnabled = defaultPreferences.beEnabled ?: false
	Boolean cloudCoverEnabled = defaultPreferences.cloudCoverEnabled ?: false
	Double cloudCoverMax = defaultPreferences.cloudCoverMax ?: 100
	Double cloudCoverMin = defaultPreferences.cloudCoverMin ?: 0
	String countryCode = defaultPreferences.countryCode ?: ""
	Boolean countryCodeEnabled = defaultPreferences.countryCodeEnabled ?: false
	String customEndDateTime = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss" ).format(new Date())
	String customStartDateTime = defaultPreferences.customStartDateTime ?: "1970-01-01 00:00:00"
	String dateType = defaultPreferences.dateType ?: "acquisition_date"
	String duration = defaultPreferences.duration ?: "none"
	Boolean elevationEnabled = defaultPreferences.elevationEnabled ?: false
	Double elevationMax = defaultPreferences.elevationMax ?: 90
	Double elevationMin = defaultPreferences.elevationMin ?: 0
	String filename = defaultPreferences.filename ?: ""
	Boolean filenameEnabled = defaultPreferences.filenameEnabled ?: false
	Double gsdMax = defaultPreferences.gsdMax ?: 50
	Double gsdMin = defaultPreferences.gsdMin ?: 0
	Boolean gsdEnabled = defaultPreferences.gsdEnabled ?: false
	String imageId = defaultPreferences.imageId ?: ""
	Boolean imageryEnabled = defaultPreferences.imageryEnabled ?: true
	Boolean imageIdEnabled = defaultPreferences.imageIdEnabled ?: false
	Double mapCenterX = defaultPreferences.mapCenterX ?: 0
	Double mapCenterY = defaultPreferences.mapCenterY ?: 0
	Double mapRotation = defaultPreferences.mapRotation ?: 0
	Boolean mapVisibility = defaultPreferences.mapVisibility ?: false
	Integer mapZoom = defaultPreferences.mapZoom ?: 3
	String missionId = defaultPreferences.missionId ?: ""
	Boolean missionIdEnabled = defaultPreferences.missionIdEnabled ?: false
	Boolean niirsEnabled = defaultPreferences.niirsEnabled ?: false
	Double niirsMax = defaultPreferences.niirsMax ?: 9
	Double niirsMin = defaultPreferences.niirsMin ?: 0
	String productType = defaultPreferences.productType ?: ""
	Boolean productTypeEnabled = defaultPreferences.productTypeEnabled ?: false
	String resultsSort = defaultPreferences.resultsSort ?: "acquisition_date,+D,Acquired"
	String sensorId = defaultPreferences.sensorId ?: ""
	Boolean sensorIdEnabled = defaultPreferences.sensorIdEnabled ?: false
	String spatial = defaultPreferences.spatial ?: "none"
	Boolean sunAzimuthEnabled = defaultPreferences.sunAzimuthEnabled ?: false
	Double sunAzimuthMax = defaultPreferences.sunAzimuthMax ?: 360
	Double sunAzimuthMin = defaultPreferences.sunAzimuthMin ?: 0
	Boolean sunElevationEnabled = defaultPreferences.sunElevationEnabled ?: false
	Double sunElevationMax = defaultPreferences.sunElevationMax ?: 90
	Double sunElevationMin = defaultPreferences.sunElevationMin ?: -90
	String targetId = defaultPreferences.targetId ?: ""
	Boolean targetIdEnabled = defaultPreferences.targetIdEnabled ?: false
	Boolean videoEnabled = defaultPreferences.videoEnabled ?: false
	String wac = defaultPreferences.wac ?: ""
	Boolean wacEnabled = defaultPreferences.wacEnabled ?: false


	static belongsTo = [ preference: Preference ]
}
