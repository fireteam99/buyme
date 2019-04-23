$( document ).ready(function() {
	$("#auto-bid-selector").change(function() {
	    if ($(this).prop("checked")) {
//	    	$("#auto-bid-amount").prop("disabled", false);
	    	$("#auto-bid-limit").prop("disabled", false);
//	    	$("#auto-bid-amount").removeClass("disabled");
//	    	$("#auto-bid-amount-label").removeClass("disabled");
	    	$("#auto-bid-limit").removeClass("disabled");
	    	$("#auto-bid-limit-label").removeClass("disabled");
	    	$("#auto-bid-incr").removeClass("disabled");

	    } else {
//	    	$("#auto-bid-amount").prop("disabled", true);
	    	$("#auto-bid-limit").prop("disabled", true);
//	    	$("#auto-bid-amount").addClass("disabled");
//	    	$("#auto-bid-amount-label").addClass("disabled");
	    	$("#auto-bid-limit").addClass("disabled");
	    	$("#auto-bid-limit-label").addClass("disabled");
	    	$("#auto-bid-incr").addClass("disabled");
	    }
	});
});
