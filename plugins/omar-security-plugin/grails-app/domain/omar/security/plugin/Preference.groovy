package omar.security.plugin

class Preference {

	String pageTheme = "slate"
	String bands = "default"
	Integer bandsBlue = 3
	Integer bandsGreen = 2
	Integer bandsRed = 1
	Double brightness = 0
	Double contrast = 1
	String coordinateFormat = "dd"
	String dynamicRangeAdjustment = "auto-minmax"
	String dynamicRangeAdjustmentRegion = "global"
	String interpolation = "bilinear"
	Boolean nullPixelFlip = true
	String sharpenMode = "none"


	static belongsTo = [ user: User ]
	static hasOne = [
		o2SearchPreference: O2SearchPreference,
		tlvPreference: TlvPreference
	]
}
