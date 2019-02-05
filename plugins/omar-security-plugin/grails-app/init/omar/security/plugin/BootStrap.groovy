package omar.security.plugin

class BootStrap {

    def grailsApplication
    def securityService


    def init = { servletContext ->
        def defaultUsername = grailsApplication.config.defaultUsername
        def defaultUser = User.findByUsername( defaultUsername )
        if ( !defaultUser ) {
            securityService.addNewUser( defaultUsername )
        }
    }
    def destroy = {
    }
}
