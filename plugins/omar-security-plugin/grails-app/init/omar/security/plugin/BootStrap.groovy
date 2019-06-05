package omar.security.plugin

class BootStrap {

    def grailsApplication
    def securityService


    def init = { servletContext ->
        def defaultUsername = grailsApplication.config.defaultPreferences.defaultUsername
        def defaultUser = User.findByUsername( defaultUsername )
        // Todo: Add code to look up the config and init defaultUser to those preferences
        // additionally if defaultUser exist change the preferences to resemble the current
        // state of the config if things had changed.
        if ( defaultUser ) {
            defaultUser.delete( flush: true )
        }
        securityService.addNewUser( defaultUsername )
    }
    def destroy = {
    }
}
