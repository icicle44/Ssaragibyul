$(function() {
	$("#sendBtn").on("click", function() {
		var sendNumber = $("#sendNumber").val();
		var price = $("#price").val();
		
		var result = sendNumber*price;
		
		$("#test").text(sendNumber);
		
		$(".getNumber").val(sendNumber);
		$(".getResult").val(result);
	});
});