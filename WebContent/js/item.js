$( document ).ready(function() {
	$("#auto-bid-selector").change(function() {
	    if ($(this).prop("checked")) {
	    	$("#auto-bid-amount").prop("disabled", false);
	    } else {
	    	$("#auto-bid-amount").prop("disabled", true);
	    }
	});
});
