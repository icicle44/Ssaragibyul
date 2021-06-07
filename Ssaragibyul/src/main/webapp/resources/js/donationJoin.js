
$(function() {	
	$("#sendBtn1").on("click", function() {
		var myPoint = parseInt($("#myPoint-total1").text());
		//var sendNumber = $("#sendNumber").val();
		var price = parseInt($("#price").val());
		//var result1 = sendNumber*price;

		if(price > myPoint) {
			alert("사용 가능한 포인트를 확인해주세요");
			return false;
		}else {

			$(".getResult2").val(price);			
			$(".getResult3").val(price);	
		}
	});
});

$(function() {
	$("#sendBtn2").on("click", function() {
		//var sendNumber = $("#sendNumber").val();
		//var price = $("#price").val();
		//var addPrice = $("#addPrice").val();
		var totalPrice = $(".getResult2").val();
		var myPoint = parseInt($("#myPoint-total1").text());	
		//var result = sendNumber * price ;

		$(".getNumber").val(sendNumber);
		var reuslt1 = Number(addPrice);
		$(".addNumber").val(addPrice);
		var result2 = result + reuslt1 ;
		$(".getResult2").val(result2);
		$(".getResult3").val(result2);
		

	});
});
