<hr>
<h2 align = "center" id = "general">General</h2>


<div id = "generalImageProperties">
    <h3>Image Properties</h3>
    <div class = "row">
        <g:each in = "${[
            [ key: "brightness", label: "Brightness", max: 1, min: -1 ],
            [ key: "contrast", label: "Contrast", max: 20, min: 0.1 ]
        ]}">
            <div class = "col-md-6">
                <div align = "center">${ it.label }: <span>${ userPreferences[ "${ it.key }" ] }</span></div>
                <input class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val() )" oninput = "updateSliderValue( this )" max = "${ it.max }" min = "${ it.min }" step = "0.1" type = "range" value = "${ userPreferences[ "${ it.key }" ] }">
            </div>
        </g:each>
    </div>
    <div class = "row">
        <div class = "col-md-4">
            <div class = "row">
                <div class = "col-md-6">
                    <select class = "form-control" onchange = "updatePreferences( 'bands', $( this ).val() )">
                        <g:each in = "${[ "default", "manual" ]}">
                            <%
                                def bandsSelected = userPreferences.bands == it ? "selected" : ""
                            %>
                            <option ${ bandsSelected } value = "${ it }">Bands: ${ it.capitalize() }</option>
                        </g:each>
                    </select>
                </div>
                <%
                    def bandSelectDisabled = userPreferences.bands == "default" ? "disabled" : ""
                %>
                <g:each in = "${[
                    [ class: "btn-danger", key: "bandsRed" ],
                    [ class: "btn-success", key: "bandsGreen" ],
                    [ class: "btn-info", key: "bandsBlue" ]
                ]}">
                    <div class = "col-md-2">
                        <%
                            def bandColorSelectClass = bandSelectDisabled == "disabled" ? "" : it.class
                        %>
                        <select class = "form-control ${ bandColorSelectClass }" ${ bandSelectDisabled } onchange = "updatePreferences( '${ it.key }', $( this ).val() )">
                            <%
                                def imagePropertiesBandsKey = it.key
                            %>
                            <g:each in = "${[ 1, 2, 3, 4 ]}">
                                <%
                                    def bandsRGBSelected = userPreferences[ "${ imagePropertiesBandsKey }" ] == it ? "selected" : ""
                                %>
                                <option ${ bandsRGBSelected } value = "${ it }">${ it }</option>
                            </g:each>
                        </select>
                    </div>
                </g:each>
                <asset:script type = "text/javascript">
                    $( "select:contains('Bands')" ).on( "change", function( event ) {
                        var bandColors = $( "select:contains('Bands')" ).parent().siblings();
                        var red = $( bandColors[ 0 ] ).find( "select" );
                        $( red ).addClass( "btn-danger" );
                        var green = $( bandColors[ 1 ] ).find( "select" );
                        $( green ).addClass( "btn-success" );
                        var blue = $( bandColors[ 2 ] ).find( "select" );
                        $( blue ).addClass( "btn-info" );
                        var disabled = $( this ).val() == "default";
                        $.each( [ blue, green, red ], function( index, color ) {
                            $( color ).prop( "disabled", disabled );
                            if ( disabled ) {
                                $( color ).removeClass( "btn-danger btn-info btn-success" );
                            }
                        });
                    });
                </asset:script>
            </div>
        </div>
        <g:each in = "${[
            [
                key: "dynamicRangeAdjustment", options: [
                    [ label: "DRA: Auto", value: "auto_minmax" ],
                    [ label: "DRA: Auto Percentile", value: "auto-percentile" ],
                    [ label: "DRA: None", value: "none" ],
                    [ label: "DRA: STD 1", value: "std-stretch-1" ],
                    [ label: "DRA: STD 2", value: "std-stretch-2" ],
                    [ label: "DRA: STD 3", value: "std-stretch-3" ]
                ]
            ],
            [
                key: "dynamicRangeAdjustmentRegion", options: [
                    [ label: "DRA Region: Global", value: "global" ],
                    [ label: "DRA Region: Viewport", value: "viewport" ]
                ]
            ],
            [
                key: "interpolation", options: [
                    [ label: "Interpolation: Bessel", value: "bessel" ],
                    [ label: "Interpolation: Bilinear", value: "bilinear" ],
                    [ label: "Interpolation: Blackman", value: "blackman" ],
                    [ label: "Interpolation: Bspline", value: "bspline" ],
                    [ label: "Interpolation: Catrom", value: "catrom" ],
                    [ label: "Interpolation: Cubic", value: "cubic" ],
                    [ label: "Interpolation: Gaussian", value: "gaussian" ],
                    [ label: "Interpolation: Haming", value: "hamming" ],
                    [ label: "Interpolation: Hermite", value: "hermite" ],
                    [ label: "Interpolation: Lanczos", value: "lanczos" ],
                    [ label: "Interpolation: Magic", value: "magic" ],
                    [ label: "Interpolation: Mitchell", value: "mitchell" ],
                    [ label: "Interpolation: Nearest", value: "nearest" ],
                    [ label: "Interpolation: Quadratic", value: "quadratic" ],
                    [ label: "Interpolation: Sinc", value: "sinc" ]
                ]
            ],
            [
                key: "nullPixelFlip", options: [
                    [ label: "Null Pixel Flip: No", value: false ],
                    [ label: "Null Pixel Flip: Yes", value: true ]
                ]
            ],
            [
                key: "sharpenMode", options: [
                    [ label: "Sharpen Mode: Heavy", value: "heavy" ],
                    [ label: "Sharpen Mode: None", value: "none" ],
                    [ label: "Sharpen Mode: Light", value: "light" ]
                ]
            ]
        ]}">
            <div class = "col-md-4">
                <select class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val() )">
                    <%
                        def imagePropertiesKey = it.key
                    %>
                    <g:each in = "${ it.options }">
                        <%
                            def imagePropertiesSelected = userPreferences[ "${ imagePropertiesKey }" ] == it.value ? "selected" : ""
                        %>
                        <option ${ imagePropertiesSelected } value = "${ it.value }">${ it.label }</option>
                    </g:each>
                </select>
            </div>
        </g:each>
    </div>
</div>

<div id = "generalLinks">
    <h3>Links</h3>
    <div class = "row">
        <div class = "col-md-6">
            <button class = "btn btn-primary form-control" onclick = "$( '#saveLinkDialog' ).modal( 'show' )">Create New Link</button>
        </div>
        <div class = "col-md-6">
            <button class = "btn btn-primary form-control" onclick = "$( '#savedLinksDialog' ).modal( 'show' )">View Saved Links</button>
        </div>
    </div>
</div>

<div id = "generalMiscellaneous">
    <h3>Miscellaneous</h3>
    <div class = "row">
        <div class = "col-md-6">
            <select class = "form-control" onchange = "updatePreferences( 'coordinateFormat', $( this ).val() )">
                <g:each in = "${[
                    [ key: "dd", label: "Decimal Degrees (DD)" ],
                    [ key: "dms", label: "Degrees Minutes Seconds (DMS)" ],
                    [ key: "mgrs", label: "Military Grid Reference Systems (MGRS)" ]
                ]}" >
                    <%
                        def selectedCoordinateFormat = userPreferences.coordinateFormat == it.key ? "selected" : ""
                    %>
                    <option ${ selectedCoordinateFormat } value = "${ it.key }">Coordinate Format: ${ it.label }</option>
                </g:each>
            </select>
        </div>
        <div class = "col-md-6">
            <select class = "form-control" onchange = "updatePreferences( 'pageTheme', $( this ).val() ); updatePageTheme( $( this ).val() )">
                <g:each in = "${[
                    "cerulean", "cosmo", "cyborg", "darkly", "flatly", "journal", "lumen", "paper", "readable", "sandstone", "simplex", "slate", "spacelab", "superhero", "united", "yeti"
                ]}" >
                    <%
                        def selectedPageTheme = userPreferences.pageTheme == it ? "selected" : ""
                    %>
                    <option ${ selectedPageTheme } value = "${ it }">Page Theme: ${ it.capitalize() }</option>
                </g:each>
            </select>
        </div>
    </div>
</div>
