<hr>
<h2 align = "center" id = "tlv">Time Lapse Viewer</h2>


<div id = "tlvLayers">
    <h3>Layers</h3>
    <div class = "row">
        <g:each in = "${[
            [ key: "overviewMap", label: "Overview Map" ],
            [ key: "searchOriginLayer", label: "Search Origin" ],
            [ key: "crossHairLayer", label: "Cross Hair" ]
        ]}">
            <div class = "col-md-4">
                <select class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val(), 'tlv' )">
                    <%
                        def selectedLayer = userPreferences.tlvPreference[ it.key ] ? "selected" : ""
                    %>
                    <option ${ selectedLayer } value = "false">${ it.label }: Off</option>
                    <option ${ selectedLayer } value = "true">${ it.label }: On</option>
                </select>
            </div>
        </g:each>
    </div>
</div>

<div id = "tlvSearch">
    <h3>Search</h3>
    <div class = "row">
        <g:each in = "${[
            [ key: "location", label: "Location", type: "text" ],
            [ key: "maxCloudCover", label: "Max. Cloud Cover", max: 100, min: 0, step: 1, type: "number" ],
            [ key: "maxResults", label: "Max. Results", max: 100, min: 1, step: 1, type: "number" ],
            [ key: "minNiirs", label: "Min. NIIRS", max: 9, min: 0, step: 0.1, type: "number" ],
            [ key: "sensor", label: "Sensor", type: "text" ],
            [ key: "startDate", label: "Start Date", type: "date" ],
            [ key: "endDate", label: "End Date", type: "date" ]
        ]}">
            <div class = "col-md-3">
                <div align = "center">${ it.label }</div>
                <g:if test = "${ it.type == 'date' }">
                    <div class = "input-group date" id = "tlv${ it.key }Time">
                        <input  class = "form-control" placeholder = "e.g. 1970-12-31 23:59:59" type = "text">
                        <span class = "input-group-addon">
                            <span class = "glyphicon glyphicon-calendar"></span>
                        </span>
                    </div>
                    <asset:script type = "text/javascript">
                        var tlvDateTimePicker = $( "#tlv${ it.key }Time" );
                        if ( "${ userPreferences.tlvPreference[ it.key ] }" != "" ) {
                            tlvDateTimePicker.datetimepicker({
                                defaultDate: "${ userPreferences.tlvPreference[ it.key ] }",
                                format: "YYYY-MM-DD HH:mm:ss"
                            });
                        }
                        else {
                            tlvDateTimePicker.datetimepicker({
                                format: "YYYY-MM-DD HH:mm:ss"
                            });
                        }

                        tlvDateTimePicker.on( "dp.change", function() {
                            var date = $( this ).data( "DateTimePicker" ).date();
                            updatePreferences( "${ it.key }", date ? date.toISOString() : "", 'tlv' );
                        });
                    </asset:script>
                </g:if>
                <g:elseif test = "${ it.type == 'number' }">
                    <input class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val(), 'tlv' )" type = "number" value = "${ userPreferences.tlvPreference[ it.key ] }">
                </g:elseif>
                <g:elseif test = "${ it.type == 'text' }">
                    <input class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val(), 'tlv' )" placeholder = "${ it.label }" type = "text" value = "${ userPreferences.tlvPreference[ it.key ] }">
                </g:elseif>
                <g:else>
                    mozz
                </g:else>
            </div>
        </g:each>
    </div>
</div>

<div id = "tlvView">
    <h3>View</h3>
    <div class = "row">
        <g:each in = "${[
            [ key: "dimensions", options: [
                    [ label: "Dimensions: 2", value: 2 ],
                    [ label: "Dimensions: 3", value: 3 ]
                ]
            ],
            [ key: "swipe", options: [
                    [ label: "Swipe: Off", value: false ],
                    [ label: "Swipe: On", value: true ]
                ]
            ],
            [ key: "terrainWireframe", options: [
                    [ label: "Terrain Wireframe: Off", value: false ],
                    [ label: "Terrain Wireframe: On", value: true ]
                ]
            ],
            [ key: "wmsTileSchema", options: [
                    [ label: "WMS Tile Schema: Multiple Tiles", value: "multiple" ],
                    [ label: "WMS Tile Schema: Single Tile", value: "single" ]
                ]
            ]
        ]}">
            <div class = "col-md-3">
                <select class = "form-control" onchange = "updatePreferences( '${ it.key }', $( this ).val(), 'tlv' )">
                    <%
                        def selectedViewKey = it.key
                    %>
                    <g:each in = "${ it.options }">
                        <%
                            def selectedView = userPreferences.tlvPreference[ selectedViewKey ] == it.value ? "selected" : ""
                        %>
                        <option ${ selectedView } value = "${ it.value }">${ it.label }</option>
                    </g:each>
                </select>
            </div>
        </g:each>
    </div>
</div>
