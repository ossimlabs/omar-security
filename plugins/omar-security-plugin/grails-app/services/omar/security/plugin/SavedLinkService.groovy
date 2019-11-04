package omar.security.plugin


import grails.gorm.transactions.Transactional


@Transactional
class SavedLinkService {

    def securityService


    def deleteSavedLink( id ) {
        def username = securityService.getUsername()
        def user = User.findByUsername( username )
        if ( user ) {
            def savedLink = user.savedLink.find({ it.id == id as BigInteger })
            if ( savedLink ) {
                user.removeFromSavedLink( savedLink )
                savedLink.delete( flush: true )


                return "Done"
            }
            else {
                return "Couldn't find URL. :("
            }
        }
        else {
            return "You are not the user associated with this URL!"
        }
    }

    def editSavedLink( request ) {
        def username = securityService.getUsername()
        def user = User.findByUsername( username )
        if ( user ) {
            def json = request.JSON
            def savedLink = user.savedLink.find({ it.hash == json.hash })
            if ( savedLink ) {
                savedLink.name = json.name
                savedLink.save( flush: true )


                return savedLink.shortenedUrl
            }
            else {
                return "Couldn't find URL. :("
            }
        }
        else {
            return "You are not the user associated with this URL!"
        }
    }

    def getSavedLink( hash ) {
        def savedLink = SavedLink.findByHash( hash )
        if ( savedLink ) {
            savedLink.hits++
            savedLink.save()
        }

        return savedLink?.url
    }


    def getSavedLinks() {
        def username = securityService.getUsername()
        def user = User.findByUsername( username )
        if ( user ) {
            return user.savedLink.sort({ it.id }).reverse()
        }
        else {
            return []
        }
    }

    def saveLink( request ) {
        def username = securityService.getUsername()
        def user = User.findByUsername( username )
        if ( user ) {
            try {
                def json = request.JSON

                // make sure it is a real URL
                def urlTest = new URL( json.url ).toURI()

                def savedLink = new SavedLink( json )
                user.addToSavedLink( savedLink )
                // need to get the record id
                user.save( flush: true )

                def context = request.getContextPath();
                def hash = savedLink.generateHash( savedLink.id )
                def uri = request.getRequestURI();
                def url = request.getRequestURL();
                def shortenedUrl = url.substring( 0, url.length() - uri.length() + context.length() ) + "/o2?h=${ hash }"
                savedLink.hash = hash
                savedLink.shortenedUrl = shortenedUrl
                savedLink.save( flush: true )

                if ( savedLink.hasErrors() ) {
                    savedLink.errors.allErrors.each{ println it }


                    return "There was an error when trying to save. :("
                }
                else {
                    return shortenedUrl
                }
            }
            catch ( Exception e ) {
                return "There was an error when trying to save. :("
            }
        }
    }
}
