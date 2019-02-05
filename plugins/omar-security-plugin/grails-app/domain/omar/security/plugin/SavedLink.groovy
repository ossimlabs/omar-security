package omar.security.plugin

class SavedLink {

	Date date = new Date()
	String hash = ""
	Integer hits = 0
	String name = ""
	String shortenedUrl = ""
	String url = ""


	static belongsTo = [ user: User ]

	static mapping = {
        hash index: "saved_link_hash_idx"
		url type: "text"
    }

	def generateHash( id ) {
		def hashDigits = []
		def dividend = id + 62
		def remainder = 0

		while ( dividend > 0 ) {
	        remainder = dividend % 62
	        dividend = dividend.intdiv( 62 )
	        hashDigits.push( remainder )
		}

		def base62Alphabet = [
			"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z",
			"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
			0, 1, 2, 3, 4, 5, 6, 7, 8, 9
		]

		def hash = ""
		def index = 0
		while ( hashDigits.size() > index )  {
	        hash += base62Alphabet[ hashDigits[ index ] as Integer ]
	        index++
		}


		return hash
	}
}
