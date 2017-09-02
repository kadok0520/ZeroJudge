jQuery(document).ready(function() {
	jQuery(document).on("click", "#modal_setUserPassword_submit", function(event) {
		event.preventDefault();
		var userid = $(this).data("userid");
		var modal = $(this).closest(".modal");
		var form = modal.find("form");
		jQuery.ajax({
			type : "GET",
			url : "./UnbindGoogle",
			data : form.serialize(),
			//dataType : 'json',
			cache : false,
			timeout : 5000,
			success : function(data) {
				console.log("success:"+data);
				modal.modal('hide');
				location.reload();
			},
			error : function(jqXHR, textStatus, errorThrown) {
				console.log("jqXHR.responseText=" + jqXHR.responseText);
				console.log("errorThrown=" + errorThrown);
				console.log("textStatus=" + textStatus);
				try {
					alert = jQuery.parseJSON(jqXHR.responseText);
					//console.log("alert=" + alert);
					BootstrapDialog.show({
						title : alert.type,
						message : alert.title,
						buttons : [ {
							id : 'btn-ok',
							icon : 'glyphicon glyphicon-check',
							label : 'OK',
							cssClass : 'btn-primary',
							autospin : false,
							action : function(dialogRef) {
								dialogRef.close();
							}
						} ]
					});
				} catch (err) {
					BootstrapDialog.alert(errorThrown);
				}
			}
		});
	});
});

