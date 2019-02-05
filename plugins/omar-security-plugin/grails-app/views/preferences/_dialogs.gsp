<div class = "modal" id = "saveLinkDialog" role = "dialog" tabindex = "-1">
	<div class = "modal-dialog">
		<div class = "modal-content">
			<div class = "modal-header"><h4>Save Link</h4></div>
			<div class = "modal-body">
				<div class = "row">
					<label>Link Name</label>
					<input class = "form-control" id = "saveLinkNameInput" type = "text">

					<label>URL</label>
                    <input class = "form-control" id = "saveLinkInput" type = "text">

                    <labe>URL Parameters</label>
                    <div class = "row">
						<div class = "col-md-12"></div>
					</div>
                </div>
			</div>
			<div class = "modal-footer">
                <button type = "button" class = "btn btn-primary" data-dismiss = "modal" onclick = saveLink()>Save</button>
				<button type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button>
			</div>
		</div>
	</div>
</div>

<asset:script type = "text/javascript">
	if ( "${ saveLink }" != "" ) {
		$( "#saveLinkDialog" ).modal( "show" );
		$( "#saveLinkInput" ).val( decodeURIComponent( "${ raw( saveLink ) }" ) );
		updateSaveLinkLabels();
	}

    $( "#saveLinkInput" ).on( "input", function( event ) {
        updateSaveLinkLabels();
    });
</asset:script>

<div class = "modal" id = "savedLinksDialog" role = "dialog" tabindex = "-1">
	<div class = "modal-dialog modal-lg">
		<div class = "modal-content">
			<div class = "modal-header"><h4>Saved Links</h4></div>
			<div class = "modal-body">
				<div class = "row">
					<table class = "table table-striped" id = "savedLinksTable"></table>
                </div>
			</div>
			<div class = "modal-footer">
				<button type = "button" class = "btn btn-default" data-dismiss = "modal">Close</button>
			</div>
		</div>
	</div>
</div>

<asset:script type = "text/javascript">
	$( "#savedLinksDialog" ).on( "shown.bs.modal", function ( event ) {
		listSavedLinks();
	});

	if ( "${ listSavedLinks }" == "true" ) {
		$( "#savedLinksDialog" ).modal( "show" );
	}

</asset:script>
