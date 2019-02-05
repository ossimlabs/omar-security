package omar.security.plugin

class User extends SecUser {


	static hasOne = [ preference: Preference ]
	static hasMany = [ savedLink: SavedLink ]
}
