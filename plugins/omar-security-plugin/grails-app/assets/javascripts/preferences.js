$.ajaxSetup({
    cache: false
});

function checkboxClick( element ) {
    var checkbox = $( element ).children()[ 0 ];
    var currentState = $( checkbox ).is( ":checked" );
    $( checkbox ).prop( "checked", !currentState );
    $( checkbox ).trigger( "change" );
}

function deleteSaveLinkLabel( keyValue ) {
    var currentValue = $( "#saveLinkInput" ).val();
    var newValue;
    if ( currentValue.indexOf( "&" + keyValue ) > -1 ) {
        newValue = currentValue.replace( "&" + keyValue, "" );
    }
    else if ( currentValue.indexOf( keyValue + "&" ) > -1 ) {
        newValue = currentValue.replace( keyValue + "&", "" );
    }
    else {
        newValue = currentValue.replace( keyValue, "" );
    }
    $( "#saveLinkInput" ).val( newValue );
    updateSaveLinkLabels();
}

function deleteSavedLink( id ) {
    return $.ajax({
        url: preferences.contextPath + "/savedLink?id=" + id
    });
}

function displayInfoDialog( message ) {
    var div = document.createElement(  'div' );
    var id = new Date().getTime();
    $( div ).attr( 'id', id );
    $( div ).html( message );

    var infoDialog = $( "#infoDialog" );
    infoDialog.prepend( div );
	infoDialog.fadeIn();
    setTimeout( function() {
        if ( infoDialog.children().length == 1 ) {
            infoDialog.fadeOut();
            setTimeout( function() { $( '#' + id ).remove(); }, 1000 );
        }
        else {
            $( '#' + id ).remove();
        }
    }, 5000 );
}

function editSavedLink( data ) {
    return $.ajax({
        contentType: "application/json",
        data: JSON.stringify( data ),
        dataType: "json",
        type: "post",
        url: preferences.contextPath + "/savedLink"
    });
}

function listSavedLinks() {
    $( "#savedLinksTable" ).empty();
    var table = $( "#savedLinksTable" )[ 0 ];

    $.ajax({
        url: preferences.contextPath + "/savedLink/getSavedLinks"
    })
    .done( function( data ) {
        var row = table.insertRow( table.rows.length );
        $.each( [ "Name", "Shortened URL", "Hits", "Created", "Original URL", "" ], function( index, value ) {
            var cell = row.insertCell( row.cells.length );
            $( cell ).append( value );
        });

        $.each( data, function( index, savedLink ) {
            var row = table.insertRow( table.rows.length );
            var cell;

            cell = row.insertCell( row.cells.length );
            var nameSpan = document.createElement( "span" );
            $( nameSpan ).append( savedLink.name );
            $( cell ).append( nameSpan );
            var nameInput = document.createElement( "input" );
            $( nameInput ).addClass( "form-control" );
            $( nameInput ).css( "display", "none" );
            $( nameInput ).val( savedLink.name );
            $( cell ).append( nameInput );;

            cell = row.insertCell( row.cells.length );
            var a = document.createElement( "a" );
            $( a ).attr( "href", savedLink.shortenedUrl );
            $( a ).attr( "target", "_blank" );
            $( a ).html( savedLink.shortenedUrl );
            $( cell ).append( a );

            cell = row.insertCell( row.cells.length );
            $( cell ).append( savedLink.hits );

            cell = row.insertCell( row.cells.length );
            $( cell ).append( savedLink.date )

            cell = row.insertCell( row.cells.length );
            var urlExpandA = document.createElement( "a" );
            $( urlExpandA ).html( "Click to expand..." );
            $( cell ).append( urlExpandA );
            var urlA = document.createElement( "a" );
            $( urlA ).css( "display", "none" );
            $( urlA ).html( savedLink.url );
            $( cell ).append( urlA );

            $( urlExpandA ).on( "click", function() {
                $( this ).hide();
                $( urlA ).show();
            });
            $( urlA ).on( "click", function() {
                $( this ).hide();
                $( urlExpandA ).show();
            });

            cell = row.insertCell( row.cells.length );
            // edit button
            var editButton = document.createElement( "button" );
            $( editButton ).addClass( "btn btn-info btn-xs form-control" );
            var editSpan = document.createElement( "span" );
            $( editSpan ).addClass( "glyphicon glyphicon-pencil" );
            $( editButton ).append( editSpan );
            $( editButton ).append( "&nbsp;Edit" );
            $( cell ).append( editButton );
            // ok button
            var okButton = document.createElement( "button" );
            $( okButton ).addClass( "btn btn-success btn-xs form-control" );
            $( okButton ).css( "display", "none" );
            var okSpan = document.createElement( "span" );
            $( okSpan ).addClass( "glyphicon glyphicon-ok" );
            $( okButton ).append( okSpan );
            $( okButton ).append( "&nbsp;OK" );
            $( cell ).append( okButton );
            // delete button
            var deleteButton = document.createElement( "button" );
            $( deleteButton ).addClass( "btn btn-danger btn-xs form-control" );
            var deleteSpan = document.createElement( "span" );
            $( deleteSpan ).addClass( "glyphicon glyphicon-trash" );
            $( deleteButton ).append( deleteSpan );
            $( deleteButton ).append( "&nbsp;Delete" );
            $( cell ).append( deleteButton );


            $( deleteButton ).on( "click", function() {
                deleteSavedLink( savedLink.id )
                .always( function() {
                    listSavedLinks();
                });
            });

            $( editButton ).on( "click", function() {
                $( this ).hide();
                $( okButton ).show();
                $( deleteButton ).hide();

                $( nameSpan ).hide();
                $( nameInput ).show();
            });

            $( okButton ).on( "click", function() {
                var data = {
                    hash: savedLink.hash,
                    name: $( nameInput ).val()
                };
                editSavedLink( data )
                .always( function() {
                    listSavedLinks();
                });
            });
        });
    });
}

function saveLink() {
    var data = {
        name: $( "#saveLinkNameInput" ).val(),
        url: $( "#saveLinkInput" ).val()
    };
    $.ajax({
        contentType: "application/json",
        data: JSON.stringify( data ),
        dataType: "json",
        type: "post",
        url: preferences.contextPath + "/savedLink"
    })
    .always( function() {
        $( "#savedLinksDialog" ).modal( "show" );
    });
}

function updatePageTheme( theme ) {
    var currentTheme = userPreferences.pageTheme;
    var link = $( "link[href*='" + currentTheme + "']" );
    var href = $( link ).attr( "href" )
        .replace( currentTheme, theme )
        .replace( /min-.*css/, "min.css" );
    $( link ).attr( "href", href );
    userPreferences.pageTheme = theme;
}

function updatePreferences( key, value, type ) {
    var data = {
        key: key,
        type: type,
        value: value
    };

    if ( !isNaN( value ) && value != "" ) { data.value = parseFloat( value ); }
    else if ( value == "false" ) { data.value = false; }
    else if ( value == "true" ) { data.value = true; }


    $.ajax({
        contentType: 'application/json',
        data: JSON.stringify( data ),
        method: "POST",
        url: preferences.contextPath + '/preferences/updatePreferences'
    })
    .done( function() {
        key = key.replace( /([A-Z])/g, ' $1' )
            .replace( /^./, function( str ) { return str.toUpperCase(); } );

        if ( typeof data.value == "boolean" ) {
            key = key.replace( 'Enabled', '' );
            value = data.value ? 'enabled' : 'disabled';
            displayInfoDialog( 'The ' + key + ' has been successfully ' + value + '!' );
        }
        else {
            displayInfoDialog( 'The ' + key + ' has been successfully updated to "' + value + '"!' );
        }
    } );
}

function updateSaveLinkLabels() {
    var paramDiv = $( "#saveLinkDialog" ).find( ".col-md-12" );
    $( paramDiv ).html( "" );

    var input = $( "#saveLinkInput" ).val();
    var a = document.createElement( "a" );
    $( a ).attr( "href", input );
    var queryString = a.href.replace( /^.*[?]/, "" )
    var values = queryString.split( "&" );
    $.each( values, function( index, param ) {
        var key = param.split( "=" )[ 0 ];
        var value = param.split( "=" )[ 1 ];

        // split any values that are multiples or ranges
        var displayValue = value;
        switch ( key ) {
            case "azimuth":
            case "elevation":
            case "niirs":
            case "sunAzimuth":
            case "sunElevation":
                displayValue = value.split( ":" ).join( " up to " );
                break;
            case "countryCodes":
            case "missions":
            case "sensors":
                displayValue = value.split( "," ).join( " or " );
                break;
        }

        // convert any camel case keys
        var displayKey = key.replace( /([A-Z])/g, " $1" );
        displayKey = displayKey.charAt( 0 ).toUpperCase() + displayKey.slice( 1 );

        if ( key && value ) {
            var row = document.createElement( "div" );
            $( row ).addClass( "row" );

            var col = document.createElement( "div" );
            $( col ).addClass( "col-md-6" );
            var button = document.createElement( "button" );
            $( button ).addClass( "btn btn-primary btn-xs" );
            $( button ).append( displayKey + ": " + displayValue + "&nbsp;");
            $( button ).on( "click", function( event ) {
                deleteSaveLinkLabel( key + "=" + value );
            });
            var badge = document.createElement( "span" );
            $( badge ).addClass( "badge" );
            $( badge ).html( "&times;" );
            $( button ).append( badge );
            $( col ).html( button );
            $( row ).append( col );

            $( paramDiv ).append( row );
            if ( $( button ).width() >= $( paramDiv ).width() ) {
                $( "#saveLinkDialog .modal-body " ).css( "overflow-x", "auto" );
            }
        }
    });
}

function updateSliderValue( element ) {
    var value = $( element ).val();
    var span = $( element ).prev().children()[ 0 ];
    $( span ).html( value );
}
