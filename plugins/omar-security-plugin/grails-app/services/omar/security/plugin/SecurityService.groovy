package omar.security.plugin


import grails.transaction.Transactional
import org.grails.web.util.WebUtils


@Transactional
class SecurityService {

    def grailsApplication
    def springSecurityService


    def addNewUser( username ) {
        def user = new User(
            enabled: true,
            password: springSecurityService.encodePassword( "" ),
            preference: new Preference(
                o2SearchPreference: new O2SearchPreference(),
                tlvPreference: new TlvPreference()
            ),
            username: username,
        )
        user.save( flush: true )

        if (user.hasErrors()) {
            user.errors.allErrors.each{ println it }
        }


        return user
    }

    def getUsername() {
        def request = WebUtils.retrieveGrailsWebRequest().getCurrentRequest()
        def headerUsername = grailsApplication.config.requestHeaderUsername
        def username = request.getHeader( headerUsername )


        return ( ! ( username in [ "(null)", null ]  ) ) ? username : grailsApplication.config.defaultUsername
    }
}
