<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/point/chargePointView.css" type="text/css"/>
<title>포인트 충전하기</title>
</head>
<body>
	<jsp:include page="../../../header.jsp"/>
	<section class="blank"></section>
	<section class="card-body bg-white mt-0 shadow" >
		<p>충전 금액 선택</p>
		<br>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="100"><span> 5,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="10000"><span> 10,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="15000"><span> 15,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="20000"><span> 20,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="25000"><span> 25,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="30000"><span> 30,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="35000"><span> 35,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="40000"><span> 40,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="45000"><span> 45,000원</span></label>
		<label class="box-radio-input"><input type="radio" name="varAmount" value="50000"><span> 50,000원</span></label>
		<p>최소 충전금액은 5,000원이며 <br/>최대 충전금액은 50,000원 입니다.</p>
		<button type="button" class="btn btn-lg btn-block  btn-custom" id="charge-point">결제하기</button>
	</section>

	<jsp:include page="../../../footer.jsp"/>
		
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
    $('#charge-point').click(function () {
        // getter
        var IMP = window.IMP;
        IMP.init('imp79009769');
        var money = $('input[name="varAmount"]:checked').val();
        var userId = '${loginUser.userId}'
        var userName = '${loginUser.userName}';
        var userEmail = '${loginUser.userEmail}';
        var userPhone = '${loginUser.userPhone}';
        var addr = '${loginUser.userAddr}'.split(',');
        var buyerAddr = addr[1] + ', ' + addr[2];
        var postcode = addr[0];
        console.log(money);

        IMP.request_pay({
            pg: 'inicis',
            pay_method : 'card',
            merchant_uid: new Date().getTime(),
            name: '싸라기별 포인트 충전',
            amount: money,
            buyer_email: userEmail,
            buyer_name: userName,
            buyer_tel: userPhone,
            buyer_addr: buyerAddr,
            buyer_postcode: postcode
        }, function (rsp) {
            console.log(rsp);
            if (rsp.success) {
                var msg = '결제가 완료되었습니다.\n';
                /* msg += '고유ID : ' + rsp.imp_uid;
                msg += '상점 거래ID : ' + rsp.merchant_uid; */
                msg += '결제 금액 : ' + rsp.paid_amount + '\n';
                msg += '카드 승인번호 : ' + rsp.apply_num + '\n';
                msg += '결제 수단 : ' + rsp.pay_method + '\n';
                $.ajax({
                	url: "chargePoint.do",//충전 금액값을 보낼 url 설정
                    type: "post", 
                    data: {"eventNoCharge" : rsp.merchant_uid,
                    	"userId" : userId,
                    	"varAmount" : money,
                    	"buyerEmail" : rsp.buyer_email,
                    	"receiptUrl" : rsp.receipt_url,
                    },
                });
            } else {
                var msg = '결제에 실패하였습니다.\n';
                msg += '[ ' + rsp.error_msg + ' ]';
            }
            alert(msg);
            /* document.location.href="/user/mypage/home"; */ //alert창 확인 후 이동할 url 설정
            window.open(rsp.receipt_url);
            opener.location.reload(true);
            self.close();
            
        });
    });
</script>
</body>
</html>