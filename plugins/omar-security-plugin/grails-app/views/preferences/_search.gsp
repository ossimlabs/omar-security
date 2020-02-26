<hr>
<h2 align = "center" id = "search">Search</h2>


<div id = "searchDataTypeFilters">
    <h3>Default Data Types</h3>
    <div class = "row">
        <g:each in = "${[
            [ key: "imageryEnabled", value: "Imagery" ],
            [ key: "videoEnabled", value: "Video" ]
        ]}">
            <div class = "col-md-4">
                <%
                    def selectedDataType = userPreferences.o2SearchPreference[ it.key ]
                %>
                <select class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val(), 'o2Search' );">
                    <option ${ selectedDataType ? "selected" : "" } value = true>${ it.value }: Yes</option>
                    <option ${ !selectedDataType ? "selected" : "" } value = false>${ it.value }: No</option>
                </select>
            </div>
        </g:each>
    </div>
</div>

<div id = "searchKeywordFilters">
    <h3>Default Keywords</h3>
    <div class = "row">
        <g:each in = "${[
            [ key: "be", label: "BE" ],
            [ key: "countryCode", label: "Country Code" ],
            [ key: "filename", label: "Filename" ],
            [ key: "imageId", label: "Image ID" ],
            [ key: "missionId", label: "Mission ID" ],
            [ key: "productType", label: "Product Type" ],
            [ key: "sensorId", label: "Sensor ID" ],
            [ key: "targetId", label: "Target ID" ],
            [ key: "wac", label: "WAC" ]
        ]}">
            <div class = "col-md-4">
                <div align = "center">${ it.label }</div>
                <div class = "input-group">
                    <div class = "input-group-addon" onclick = "checkboxClick( this )" style = "cursor: pointer">
                        <%
                            def checkedKeyword = userPreferences.o2SearchPreference[ "${ it.key }Enabled" ] ? "checked" : ""
                        %>
                        <input ${ checkedKeyword } onchange = "updatePreferences( '${ it.key }Enabled', $( this ).is( ':checked' ).toString(), 'o2Search' )" type = "checkbox">
                    </div>
                    <%
                        def valueKeyword = userPreferences.o2SearchPreference[ it.key ]
                    %>
                    <input class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val(), 'o2Search' )" placeholder = "${ it.label }" type = "text" value = "${ valueKeyword }">
                </div>
            </div>
        </g:each>
    </div>
</div>

<div id = "searchRangeFilters">
    <h3>Default Ranges</h3>
    <div class = "row">
        <g:each in = "${[
            [ key: "azimuth", label: "Azimuth (deg)", max: 360, min: 0, step: 1 ],
            [ key: "cloudCover", label: "Cloud Cover (%)", max: 100, min: 0, step: 1 ],
            [ key: "elevation", label: "Elevation/Graze (deg)", max: 90, min: 0, step: 1 ],
            [ key: "niirs", label: "NIIRS", max: 9, min: 0, step: 0.1 ],
            [ key: "sunAzimuth", label: "Sun Azimuth (deg)", max: 360, min: 0, step: 1 ],
            [ key: "sunElevation", label: "Sun Elevation (deg)", max: 90, min: -90 ],            
            [ key: "gsd", label: "Ground Sample Distance (m)", max: 50, min: 0 ],                                           
        ]}">
            <div class = "col-md-2">
                <div align = "center">${ it.label }</div>
                <div class = "input-group">
                    <div class = "input-group-addon" onclick = "checkboxClick( this )" style = "cursor: pointer">
                        <%
                            def checkedRange = userPreferences.o2SearchPreference[ "${ it.key }Enabled" ] ? "checked" : ""
                        %>
                        <input ${ checkedRange } onchange = "updatePreferences( '${ it.key }Enabled', $( this ).is( ':checked' ).toString(), 'o2Search' )" type = "checkbox">
                    </div>
                    <div class = "input-group">
                        <%
                            def valueRangeMin = userPreferences.o2SearchPreference[ "${ it.key }Min" ]
                        %>
                        <input class = "form-control" min = "${ it.min }" onchange = "updatePreferences( '${ it.key }Min', $( this ).val(), 'o2Search' )" step = "${ it.step }" type = "number" value = "${ valueRangeMin }">
                        <div class = "input-group-addon">
                            <span style = "font-family: monospace;">Min</span>
                        </div>
                    </div>
                    <div class = "input-group">
                        <%
                            def valueRangeMax = userPreferences.o2SearchPreference[ "${ it.key }Max" ]
                        %>
                        <input class = "form-control" max = "${ it.max }" onchange = "updatePreferences( '${ it.key }Max', $( this ).val(), 'o2Search' )" step = "${ it.step }" type = "number" value = "${ valueRangeMax }">
                        <div class = "input-group-addon">
                            <span style = "font-family: monospace;">Max</span>
                        </div>
                    </div>
                </div>
            </div>
        </g:each>
    </div>
</div>

<div id = "searchTemporalFilters">
    <h3>Default Temporal Filter</h3>
    <div class = "row">
        <div class = "col-md-3">
            <div>&nbsp;</div>
            <select class = "form-control" onchange = "updatePreferences( 'dateType', $( this ).val(), 'o2Search' )">
                <g:each in = "${[
                    [ label: "Acquisition Date", value: "acquisition_date" ],
                    [ label: "Ingest Date", value: "ingest_date" ]
                ]}">
                    <%
                        def selectedDateType = userPreferences.o2SearchPreference.dateType == it.value ? "selected" : ""
                    %>
                    <option ${ selectedDateType } value = "${ it.value }">Date Type: ${ it.label }</option>
                </g:each>
            </select>
        </div>
        <div class = "col-md-3">
            <div>&nbsp;</div>
            <select class = "form-control" onchange = "updatePreferences( 'duration', $( this ).val(), 'o2Search' )">
                <g:each in = "${[
                    [ label: "None", value: "none" ],
                    [ label: "Today", value: "lastDay" ],
                    [ label: "Yesterday", value: "yesterday" ],
                    [ label: "Last 3 Days", value: "last3Days" ],
                    [ label: "Last Week", value: "last7Days" ],
                    [ label: "Last Month", value: "lastMonth" ],
                    [ label: "Last 3 Months", value: "last3Months" ],
                    [ label: "Last 6 Months", value: "last6Months" ],
                    [ label: "Custom Date Range", value: "customDateRange" ]
                ]}">
                    <%
                        def selectedDuration = userPreferences.o2SearchPreference.duration == it.value ? "selected" : ""
                    %>
                    <option ${ selectedDuration } value = "${ it.value }">Duration: ${ it.label }</option>
                </g:each>
            </select>
            <asset:script type = "text/javascript">
                $( "select:contains('Duration')" ).on( "change", function( event ) {
                    if ( $(this).val() != "customDateRange" ) {
                        $( "#o2SearchCustomEndDateTime" ).find( "input" ).prop( "disabled", true );
                        $( "#o2SearchCustomStartDateTime" ).find( "input" ).prop( "disabled", true );
                    }
                    else {
                        $( "#o2SearchCustomEndDateTime" ).find( "input" ).prop( "disabled", false );
                        $( "#o2SearchCustomStartDateTime" ).find( "input" ).prop( "disabled", false );
                    }
                });
            </asset:script>
        </div>
        <div class = "col-md-6">
            <g:each in = "${[
                [ label: "Start", dateTime: userPreferences.o2SearchPreference.customStartDateTime ],
                [ label: "End", dateTime: userPreferences.o2SearchPreference.customEndDateTime ]
            ]}">
                <div class = "col-md-6">
                    <div align = "center">${ it.label }</div>
                    <div class = "input-group date" id = "o2SearchCustom${ it.label }DateTime">
                        <%
                            def dateDisabled = userPreferences.o2SearchPreference.duration != "customDateRange" ? "disabled" : ""
                        %>
                        <input  ${ dateDisabled } class = "form-control" type = "text">
                        <span class="input-group-addon">
                            <span class = "glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                    <asset:script type = "text/javascript">
                        $( "#o2SearchCustom${ it.label }DateTime" ).datetimepicker({
                            defaultDate: "${ it.dateTime }",
                            format: "YYYY-MM-DD HH:mm:ss"
                        });

                        $( "#o2SearchCustom${ it.label }DateTime" ).on( "dp.change", function() {
                            var date = $( this ).data( "DateTimePicker" ).date().toISOString();
                            updatePreferences( "custom${ it.label }DateTime", date, 'o2Search' );
                        });
                    </asset:script>
                </div>
            </g:each>
        </div>
    </div>
</div>

<div id = "searchSpatialFilters">
    <h3>Default Spatial Filter</h3>
    <div class = "row">
        <div class = "col-md-12">
            <select class = "form-control"  onchange = "updateSpatialFilter( this )">
                <g:each in = "${[
                    [ label: "None", value: "none" ],
                    [ label: "Map View", value: "mapView" ],
                    [ label: "Point", value: "point" ],
                    [ label: "Polygon", value: "polygon" ]
                ]}">
                    <%
                        def spatialFilter = userPreferences.o2SearchPreference.spatial
                        def selectedSpatial = spatialFilter.toLowerCase().contains( it.value.toLowerCase() ) ? "selected" : ""
                    %>
                    <option ${ selectedSpatial } value = "${ it.value }">Filter By: ${ it.label }</option>
                </g:each>
            </select>
        </div>
        <%
            def spatialFilter = userPreferences.o2SearchPreference.spatial
            def spatialDivDisplay = spatialFilter.toLowerCase().contains( "point" ) || spatialFilter.toLowerCase().contains( "polygon" )
        %>
        <div class = "col-md-10"  style = "display:${ spatialDivDisplay ? 'block' : 'none' }">
            <%
                def pointPlaceholder = "e.g. POINT( lon, lat )"
                def polygonPlaceholder = "e.g. POLYGON(( lon1, lat1 lon2, lat2 ... lonN, latN ))"
                def spatialPlaceholder = ""
                switch ( selectedSpatial ) {
                    case "point": spatialPlaceholder = pointPlaceholder; break
                    case "polygon": spatialPlaceholder = polygonPlaceholder; break
                }
                def spatialValue = spatialDivDisplay ? spatialFilter : ""
            %>
            <input class = "form-control" oninput = "updatePreferences( 'spatial', $( this ).val(), 'o2Search' )" placeholder = "${ spatialPlaceholder }" type = "text" value = "${ spatialValue }">
        </div>
    </div>
    <asset:script type = "text/javascript">
        function updateSpatialFilter( element ) {
            var div = $( element ).parent().next();
            var input = div.find( "input" );
            var value = $( element ).val();

            if ( value == "none" || value == "mapView" ) {
                updatePreferences( "spatial", value, "o2Search" );
                $( div ).hide();
            }
            else if ( value == "point" ) {
                updatePreferences( "spatial", $( input ).val(), "o2Search" );
                $( div ).show();
                $( input ).attr( "placeholder", "${ pointPlaceholder }" );
            }
            else if ( value == "polygon" ) {
                updatePreferences( "spatial", $( input ).val(), "o2Search" );
                $( div ).show();
                $( input ).attr( "placeholder", "${ polygonPlaceholder }" );
            }
        }
    </asset:script>
</div>

<div id = "searchMapSettings">
    <h3>Map Settings</h3>
    <div class = "row">
        <g:each in = "${[
            [ key: "mapCenterY", label: "Center Latitude (deg)", max: 90, min: -90, step: 1, type: "number" ],
            [ key: "mapCenterX", label: "Center Longitude (deg)", max: 180, min: -180, step: 1, type: "number" ],
            [ key: "mapRotation", label: "Rotation (deg)", max: 360, min: 0, step: 1, type: "number" ],
            [ key: "mapVisibility", label: "Map Visibility", type: "select", options: [
                    [ label: "Hidden", value: false ],
                    [ label: "Visible", value: true ]
                ]
            ],
            [ key: "mapZoom", label: "Zoom", max: 20, min: 0, step: 1, type: "number" ]
        ]}">
            <div class = "col-md-2">
                <div align = "center">${ it.label }</div>
                <%
                    def valueMap = userPreferences.o2SearchPreference[ "${ it.key }" ]
                %>
                <g:if test = "${ it.type == 'number' }">
                    <input class = "form-control" min = "${ it.min }" onchange = "updatePreferences( '${ it.key }', $( this ).val(), 'o2Search' )" step = "${ it.step }" type = "number" value = "${ valueMap }">
                </g:if>
                <g:elseif test  = "${ it.type == 'select' }">
                    <select class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val(), 'o2Search' )">
                        <g:each in = "${ it.options }">
                            <%
                                def selectedMapVisibility = userPreferences.o2SearchPreference.mapVisibility == it.value ? "selected" : ""
                            %>
                            <option ${ selectedMapVisibility } value = "${ it.value }">${ it.label }</option>
                        </g:each>
                    </select>
                </g:elseif>
            </div>
        </g:each>
    </div>
</div>

<div id = "searchResultsSettings">
    <h3>Default Results Sort</h3>
    <div class = "row">
        <div class = "col-md-12">
            <select class = "form-control" onchange = "updatePreferences( 'resultsSort', $( this ).val(), 'o2Search' )" >
                <g:each in = "${[
                    [ label: "Acquired (Des.)", value: "acquisition_date,+D,Acquired" ],
                    [ label: "Acquired (Asc.)", value: "acquisition_date,+A,Acquired" ],
                    [ label: "Image ID (Des.)", value: "title,+D,Image ID" ],
                    [ label: "Image ID (Asc.)", value: "title,+A,Image ID" ],
                    [ label: "Ingested (Des.)", value: "ingest_date,+D,Ingest" ],
                    [ label: "Ingested (Asc.)", value: "ingest_date,+A,Ingest" ],
                    [ label: "Misson (Des.)", value: "mission_id,+D,Mission" ],
                    [ label: "Misson (Asc.)", value: "mission_id,+A,Mission" ],
                    [ label: "NIIRS (Des.)", value: "niirs,+D,NIIRS" ],
                    [ label: "NIIRS (Asc.)", value: "niirs,+A,NIIRS" ],
                    [ label: "Sensor (Des.)", value: "sensor_id,+D,Sensor" ],
                    [ label: "Sensor (Asc.)", value: "sensor_id,+A,Sensor" ]
                ]}">
                    <%
                        def selectedResultsSort = userPreferences.o2SearchPreference.resultsSort == it.value ? "selected" : ""
                    %>
                    <option ${ selectedResultsSort } value = "${ it.value }">${ it.label }</option>
                </g:each>
            </select>
        </div>
    </div>
</div>
