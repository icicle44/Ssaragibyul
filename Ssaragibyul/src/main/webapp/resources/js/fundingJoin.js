
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
		$(".getNumber").val(sendNumber);
		var reuslt1 = Number(addPrice);
		$(".addNumber").val(addPrice);
		var result2 = result + reuslt1 ;
		$(".getResult2").val(result2);
		$(".getResult3").val(result2);
		
	
		

	

	});
});
