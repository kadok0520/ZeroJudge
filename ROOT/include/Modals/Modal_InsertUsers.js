jQuery(document).ready(function() {
	$('button#modal_insertUsers_change').on('click', function() {
		var modal = $(this).closest('.modal');
		var text = modal.find('textarea').val();
		console.log("text=" + text);
	});
});
