package omar.security.plugin


class SecurityInterceptor {

	SecurityInterceptor() {
		matchAll()
	}

	def securityService

	boolean after() { true }

	void afterView() { }

	boolean before() {
		//def username = securityService.getUsername()
		//def user = User.findByUsername( username )
		//if ( !user ) {
		//	securityService.addNewUser( username )
		//}


		return true
	}



}
