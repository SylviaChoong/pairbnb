$(document).ready(function(){
	var checkout;
	$("#myModal").on('shown.bs.modal', function () {
		braintree.setup(gon.client_token, "dropin", {
		  	container: "payment-form",
			onReady: function (integration) {
			  checkout = integration;
			}
		});
    });

	$("#myModal").on('hidden.bs.modal', function(){
		checkout.teardown(function () {
		  checkout = null;
		});
	});

	// $(".close").on('click', function(){
	// 	// When you are ready to tear down your integration
	// 	checkout.teardown(function () {
	// 	  checkout = null;
	// 	  // braintree.setup can safely be run again!
	// 	});
	// });
});