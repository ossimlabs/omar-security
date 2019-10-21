package omar.security.plugin


import grails.gorm.transactions.Transactional


@Transactional
class PreferencesService {

    def grailsApplication
    def securityService


    def getPreferences() {
        def username = securityService.getUsername()
        def user = User.findByUsername( username )
        if ( !user ) {
        	user = securityService.addNewUser( username )
        }


        return user.preference
    }

    def updatePreferences( preference ) {
        def username = securityService.getUsername()
        if ( username != grailsApplication.config.defaultUsername ) {
            def user = User.findByUsername( username )
            if ( preference.type ) {
                user.preference[ "${ preference.type }Preference" ][ preference.key ] = preference.value
            }
            else {
                user.preference[ preference.key ] = preference.value
            }

            user.save( flush: true )
        }
    }
}
