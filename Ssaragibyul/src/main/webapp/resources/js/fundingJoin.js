
$(function() {	
	$("#sendBtn1").on("click", function() {
		var sendNumber = $("#sendNumber").val();
		var price = $("#price").val();
		
		var result1 = sendNumber*price;
		
		$("#test").text(sendNumber);
		
		$(".getNumber").val(sendNumber);
		$(".getResult1").val(result1);
	});
});

$(function() {
	$("#sendBtn2").on("click", function() {
		var sendNumber = $("#sendNumber").val();
		var price = $("#price").val();
		var addPrice = $("#addPrice").val();
		
		var result = sendNumber * price ;
		
		var reuslt1 = Number(addPrice);
		
		var result2 = result + reuslt1 ;
		
		$(".getNumber").val(sendNumber);
		$(".getResult2").val(result2);
	});
});
