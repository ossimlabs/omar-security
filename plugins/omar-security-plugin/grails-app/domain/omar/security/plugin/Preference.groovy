package omar.security.plugin


import grails.util.Holders


class Preference {

	def defaultPreferences = Holders.grailsApplication.config.defaultPreferences


	String pageTheme = defaultPreferences.pageTheme ?: "slate"
	String bands = defaultPreferences.bands ?: "default"
	Integer bandsBlue = defaultPreferences.bandsBlue ?: 3
	Integer bandsGreen = defaultPreferences.bandsGreen ?: 2
	Integer bandsRed = defaultPreferences.bandsRed ?: 1
	Double brightness = defaultPreferences.brightness ?: 0
	Double contrast = defaultPreferences.contrast ?: 1
	String coordinateFormat = defaultPreferences.coordinateFormat ?: "dd"
	String dynamicRangeAdjustment = defaultPreferences.dynamicRangeAdjustment ?: "auto-minmax"
	String dynamicRangeAdjustmentRegion = defaultPreferences.dynamicRangeAdjustmentRegion ?: "global"
	String interpolation = defaultPreferences.interpolation ?: "bilinear"
	Boolean nullPixelFlip = defaultPreferences.nullPixelFlip ?: true
	Double sharpenPercent = defaultPreferences.sharpenPercent ?: 0.0


	static belongsTo = [ user: User ]
	static hasOne = [
		o2SearchPreference: O2SearchPreference,
		tlvPreference: TlvPreference
	]
}
