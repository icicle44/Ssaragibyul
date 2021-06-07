$(function() {   
   $("#sendBtn1").on("click", function() {
      var myPoint = parseInt($("#myPoint-total1").text());
      var sendNumber = $("#sendNumber").val();
      var compareNum = parseInt($("#sendNumber").val());
      var price = $("#price").val();
      var result1 = sendNumber*price;
      var optionLimit = parseInt($("#optionLimit").text())

      if(compareNum > optionLimit) {
         alert("펀딩 가능한 개수를 확인해주세요");
         return false;
      }else if(result1 > myPoint) {
         alert("사용 가능한 포인트를 확인해주세요");
         return false;
      } else {
         $("#sendBtn1").attr("href","#sectionSuggest2");
         $("#test").text(sendNumber);
         
         $(".getNumber").val(sendNumber);
         $(".getResult1").val(result1);      
      }
      
      
   });
});

$(function() {
   $("#sendBtn2").on("click", function() {
      var myPoint = parseInt($("#myPoint-total2").text());
      var sendNumber = $("#sendNumber").val();
      var price = $("#price").val();
      var addPrice = $("#addPrice").val();
      var result = sendNumber * price ;
      var reuslt1 = Number(addPrice);
      var result2 = result + reuslt1 ;

      if(result2 > myPoint) {
         alert("사용 가능한 포인트를 확인해주세요");
         return false;      
      }else {
         $("#sendBtn2").attr("href","#sectionSuggest3");
         $(".getNumber").val(sendNumber);
         $(".addNumber").val(addPrice);
         $(".getResult2").val(result2);
         $(".getResult3").val(result2);

      }
   });
});