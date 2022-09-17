<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
	<%@ include file="../../common/common.jsp" %>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Montserrat&display=swap");
      * {
        margin: 0;
        padding: 1px;
        box-sizing: border-box;
      }
/*       body {
        background-color: #eee;
      } */
      nav,
      .wrapper {
        padding: 10px 50px;
      }
      nav .logo a {
        color: #000;
        font-size: 1.2rem;
        font-weight: bold;
        text-decoration: none;
      }
      nav div.ml-auto a {
        text-decoration: none;
        font-weight: 600;
        font-size: 0.8rem;
      }
      header {
        padding: 20px 0px;
      }
      header .active {
        font-weight: 700;
        position: relative;
      }
      header .active .fa-check {
        position: absolute;
        left: 50%;
        bottom: -27px;
        background-color: #fff;
        font-size: 0.7rem;
        padding: 5px;
        border: 1px solid #008000;
        border-radius: 50%;
        color: #008000;
      }
      .progress {
        height: 2px;
        background-color: #ccc;
      }
      .progress div {
        display: flex;
        align-items: center;
        justify-content: center;
      }
      .progress .progress-bar {
        width: 40%;
      }
      #details {
        padding: 30px 50px;
        min-height: 300px;
      }
      input {
        border: none;
        outline: none;
      }
      .form-group .d-flex {
        border: 1px solid #ddd;
      }
      .form-group .d-flex input {
        width: 95%;
      }
      .form-group .d-flex:hover {
        color: #000;
        cursor: pointer;
        border: 1px solid #008000;
      }
      select {
        width: 100%;
        padding: 8px 5px;
        border: 1px solid #ddd;
        border-radius: 5px;
      }
      input[type="checkbox"] + label {
        font-size: 0.85rem;
        font-weight: 600;
      }
      #cart,
      #summary {
        padding: 20px 50px;
      }
      #address .d-md-flex p.text-justify,
      #register p.text-muted {
        margin: 0;
      }
      #register {
        background-color: #d9ecf2;
      }
      #register a {
        text-decoration: none;
        color: #333;
      }
      #cart,
      #summary {
        max-width: 500px;
      }
      .h6 {
        font-size: 1.2rem;
        font-weight: 700;
      }
      .h6 a {
        text-decoration: none;
        font-size: 1rem;
      }
      .item img {
        object-fit: cover;
        border-radius: 5px;
      }
      .item {
        position: relative;
      }
      .number {
        position: absolute;
        font-weight: 800;
        color: #fff;
        background-color: #828282;
        padding-left: 7px;
        border-radius: 50%;
        border: 1px solid #fff;
        width: 25px;
        height: 25px;
        top: -5px;
        right: -5px;
      }
      .display-5 {
        font-size: 1.2rem;
      }
      #cart ~ p.text-muted {
        margin: 0;
        font-size: 0.9rem;
      }
      tr.text-muted td {
        border: none;
      }
      .fa-minus,
      .fa-plus {
        font-size: 0.7rem;
      }
      .table td {
        padding: 0.3rem;
      }
      .btn.text-uppercase {
        border: 1px solid #333;
        font-weight: 600;
        border-radius: 0px;
      }
      .btn.text-uppercase:hover {
        background-color: #333;
        color: #eee;
      }
      .btn.text-white {
        background-color: #66cdaa;
        border-radius: 0px;
      }
      .btn.text-white:hover {
        background-color: #3cb371;
      }
      .wrapper .row + div.text-muted {
        font-size: 0.9rem;
      }
      .mobile,
      #mobile {
        display: none;
      }
      .buttons {
        vertical-align: text-bottom;
      }
      #register {
        width: 50%;
      }
      @media (min-width: 768px) and (max-width: 991px) {
        .progress .progress-bar {
          width: 33%;
        }
        #cart,
        #summary {
          max-width: 100%;
        }
        .wrapper div.h5.large,
        .wrapper .row + div.text-muted {
          display: none;
        }
        .mobile.h5,
        #mobile {
          display: block;
        }
      }
      @media (min-width: 576px) and (max-width: 767px) {
        .progress .progress-bar {
          width: 29%;
        }
        #cart,
        #summary {
          max-width: 100%;
        }
        .wrapper div.h5.large,
        .wrapper .row + div.text-muted {
          display: none;
        }
        .mobile.h5,
        #mobile {
          display: block;
        }
        .buttons {
          width: 100%;
        }
      }
      @media (max-width: 575px) {
        .progress .progress-bar {
          width: 38%;
        }
        #cart,
        #summary {
          max-width: 100%;
        }
        nav,
        .wrapper {
          padding: 10px 30px;
        }
        #register {
          width: 100%;
        }
      }
      @media (max-width: 424px) {
        body {
          width: fit-content;
        }
      }
      @media (max-width: 375px) {
        .progress .progress-bar {
          width: 35%;
        }
        body {
          width: fit-content;
        }
      }
    </style>
  </head>
  <body>
    <!-- nav start -->
	<%@ include file="../../component/nav.jsp" %>
    <!-- nav end -->
   <header>
      <div class="d-flex justify-content-center align-items-center pb-3">
        <div class="px-sm-5 px-2 active">
          장바구니
          <span class="fas fa-check"></span>
        </div>
        <div class="px-sm-5 px-2">결제</div>
        <div class="px-sm-5 px-2">결제완료</div>
      </div>
      <div class="progress">
        <div
          class="progress-bar bg-success"
          role="progressbar"
          aria-valuenow="25"
          aria-valuemin="0"
          aria-valuemax="100"
        ></div>
      </div>
    </header>
    <!-- 회원 주문 페이지 -->
    <c:set var ="total_price" value = "0" />
     <form class="wrapper" name="paymentForm" action="./orderInsert.do" method="GET" >
      <div class="h5 large">주문 결제</div>
      <div class="row">
        <div class="col-lg-8 col-md-8 col-sm-10 offset-lg-0 offset-md-2 offset-sm-1">
          <div class="mobile h5">Billing Address</div>
          <div id="details" class="bg-white rounded pb-5">
            <section>
              <div class="form-group">
                <label class="text-muted" for="name">이름</label>
                <input type="text"  name="name" class="form-control" id="order_name" name="order_name" value="${member.getMember_name()}"/>
              </div>
              <div class="form-group">
                <label class="text-muted" for="phone">핸드폰 번호</label>
                <div
                  class="d-flex jusify-content-start align-items-center rounded p-2"
                >
                  <input type="text"  name="phone" id="order_phone" name="order_phone" value="${member.getMember_phone()}"/>
                  </input>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-9">
                  <div class="form-group">
                    <label class="text-muted" for="zipcode">우편번호</label>
                    <div class="d-flex jusify-content-start align-items-center rounded p-2">
                      <input type="text" id="zipcode" name="zipcode" value="${member.getMember_zipcode()}"/>
                      </input>
                    </div>
                  </div>
                </div>
                <div class="col-lg-3">
                  <div class="form-group">
                    <label> </label>
                    <div class="d-flex jusify-content-start align-items-center rounded p-2">
                      <input type="button" value="우편번호 찾기" onClick="changeSelectAddress()"/>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                  <div class="form-group">
                    <label class="text-muted" for="address">주소</label>
                    <div class="d-flex jusify-content-start align-items-center rounded p-2">
                      <input type="text" id="address" name="address" value="${member.getMember_address()}"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="text-muted" for="address2">상세주소</label>
                    <div class="d-flex jusify-content-start align-items-center rounded p-2">
                      <input type="text" id="address2" name="address2" value="${member.getMember_address2()}"/>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="text-muted" for="requirement">배송시 요청사항</label>
                    <div class="d-flex jusify-content-start align-items-center rounded p-2">
                      <input type="text" name="requirement"/>
                    </div>
                  </div>
              </div>
              <br><hr>
              <label class="text-muted">쿠폰 적용</label>
              <select name="coupon" id="coupon_select" onChange="changeSelectCoupon(this.value);">
              	<option selected value="0">쿠폰적용 안함</option>
              	<c:if test="${couponList != null}">
	              	<c:forEach var="coupon" items="${couponList}">
	              	<option value="${coupon.getCoupon_price()}">${coupon.getCoupon_text()}(-${coupon.getCoupon_price()}원)</option>              	
	              	</c:forEach>
              </c:if>
              </select>
              <div class="row col-12">
              	<div class="col-7 d-flex">
	              <div class="form-group col-9">
    	            <label class="text-muted" for="point">적립금 사용</label>
        	        <input type="text" id="point" name="point" value="" class="form-control" placeholder="100원 단위로 입력해주세요."/>
            	  </div>
            	  <div class="mt-4 col-3">
              		<button class="btn fa-solid b btn-success" id="pointBtn">적용</button>
              	 </div>
              	</div>
              	<div class="col-5">
              		<div class="form-group d-flex" style="margin-top:30px">
              		<label class="text-muted"></label>
              		<p>사용가능 :</p><p id="member_point"> ${member.getMember_point()}</p>
            	  </div>
              	</div>
              </div>
            </section>
          </div>
        </div>
        <!-- 주문 상품 -->
        <section class="col-lg-4 col-md-8 col-sm-10 offset-lg-0 offset-md-2 offset-sm-1 pt-lg-0 pt-3">
          <div id="cart" class="bg-white rounded">
            <div class="d-flex justify-content-between align-items-center">
              <div class="h6">주문 상품</div>
            </div>
            <!-- 상품 정보 시작 -->
            <c:forEach var="cart" items="${cartList}">
	            <section>
		            <div class="d-flex jusitfy-content-between align-items-center pt-3 pb-2 border-bottom">
		              <div class="item pr-2">
		                <img
		                  src="${cart.getProduct_img()}"
		                  alt="product_img"
		                  width="80"
		                  height="80"
		                />
		                <div class="number product_count">${cart.getProduct_count()}</div>
		              </div>
		              <div class="d-flex flex-column px-3">
		              	<input type="hidden" name="product_no" value="${cart.getProduct_no()}"/>
		              	<input type="hidden" name="product_name" value="${cart.getProduct_name()}"/>
		              	<input type="hidden" name="product_price" value="${cart.getProduct_price()}"/>
		              	<input type="hidden" name="product_count" value="${cart.getProduct_count()}"/>
		                <b class="h4 product_name">${cart.getProduct_name()}</b>
		                <p class="h5 text-primary product_price">
		                <fmt:formatNumber value="${cart.getProduct_price()}" type="number"/>원
		                </p>
		              </div>
		            </div>
		            <c:set var= "total_price" value="${total_price + cart.getProduct_price()*cart.getProduct_count()}"/>
	            </section>
       		</c:forEach>
            <div>
            <div class="d-flex align-items-center mt-3">
              <div class="display-5 me-4">총 금액</div>
              <div class="ml-auto" style="font-weight:bold;">
              	<fmt:formatNumber value="${total_price}" type="number" />원
              </div>
            </div>
           <c:set var="discount" value="0"></c:set>
           <c:if test="${mem_id != null }">
            <div class="d-flex align-items-center mt-2">
              <div class="display-5 me-4">할인금액</div>
              <div class="ml-auto" id="discount" style="font-weight:bold;">
              	<fmt:formatNumber value="0" type="number" />원
              	<c:set var="discount" value="0"></c:set>
              </div>
            </div>
           </c:if>
           <c:set var="deliver" value="0"></c:set>
            <div class="d-flex align-items-center py-2 border-bottom">
              <div class="display-5 me-2">배송비</div>
            <c:choose>
	            <c:when test="${total_price ge 50000}">
	            <div class="ml-auto" style="margin-left:35px;font-weight:bold;">
	            	<fmt:formatNumber value="0" type="number" />원
	            	<c:set var="deliver" value="0"></c:set>
	            </div>
	            </c:when>
	            <c:when test="${total_price lt 50000}">
	            <div class="ml-auto" style="margin-left:35px;font-weight:bold;">
	            	<fmt:formatNumber value="2500" type="number" />원
	            	<c:set var="deliver" value="2500"></c:set>
	            </div>
	            </c:when>
            </c:choose>
            </div>
            <div class="d-flex align-items-center py-2">
              <p class="display-5 me-4">결제금액</p>
              <div class="ml-auto d-flex">
                <p class="font-weight-bold" style="font-weight:bold;" id="payment_price">
                	<fmt:formatNumber value="${total_price + deliver - discount}" type="number"/>원
                </p>
              </div>
            </div>
          </div>
          <div class="row pt-lg-3 pt-2 buttons mb-sm-0 mb-2">
              <button type="button" id="check_module" class="btn ml-3 mr-3 fas fa-solid fa-credit-card" style="background-color: #eee;">
                주문하기
              </button>
          </div>
        </section>
      </div>
    </form>
    <!-- footer start -->
	<%@ include file="../../component/footer.jsp" %>
    <!-- footer end -->
 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script type="text/javascript">
 	  document.paymentForm.addEventListener("keydown", event => {
		  if (event.code === "Enter") 
		  event.preventDefault();
		}); 
	  
	  let couponPrice = 0;   // 쿠폰할인금액
	  let usePoint = 0;		 // 적립급 사용금액
	  
	  // 쿠폰 적용
	  function changeSelectCoupon(value){
		  couponPrice = value;
		  let discountValue = (-couponPrice-usePoint);
		  let discountTotal = discountValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원"
		  $("#discount").text(discountTotal);
		  
		  let price  = ${total_price + deliver} + discountValue;
		  let total_price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
		  $("#payment_price").text(total_price);
		  //alert(${total_price + deliver}-Number(value));
	  }
	  
	  let clickNum = 1;
	  // 적립금 적용 시
	  $("#pointBtn").on('click',function(event){
		  clickNum++;
		  event.preventDefault();
		  
		  if(clickNum % 2 == 0){
			  alert("포인트를 적용하였습니다");
			  
			  let discountValue = (-couponPrice-usePoint);
			  let discountTotal = discountValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
			  $("#discount").text(discountTotal);
			  
			  let price  = ${total_price + deliver} + discountValue;	
			  let total_price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
			  $("#payment_price").text(total_price);
			  $('#pointBtn').addClass('btn-danger');
			  $('#point').attr('disabled','true');
			  $('#pointBtn').text('취소');
			  
		  }else{
		 	alert("적용을 취소하셨습니다");
		 	
			usePoint = 0;
		 	$("#member_point").text(${member.getMember_point()});
			let discountValue = (-couponPrice-usePoint);
			let discountTotal = discountValue.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
			$("#discount").text(discountTotal);
			  
			let price  = ${total_price + deliver} + discountValue;	
			let total_price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + "원";
			$("#payment_price").text(total_price);
		 	$('#pointBtn').removeClass('btn-danger');
		 	$('#point').attr('disabled','false');
		 	$('#point').removeAttr('disabled');
		 	$('#point').val(usePoint);
		 	$('#pointBtn').text('적용');
		 	
		  }
	})
	  // 
	  $("#point").on("propertychange change keyup paste input", function() {
		  usePoint = $('#point').val();
		  let memPoint = ${member.getMember_point()};
		  $("#member_point").text(memPoint-usePoint);
		  /* 
		  discount
		  payment_price
			할인금액, 결제금액도 변경	  
		  */
		  if(memPoint < usePoint){
			  alert('사용가능 금액을 초과합니다. 다시 입력하세요');
			  $('#point').val(0);
			  $("#member_point").text(memPoint);
		  }
	  });

	  
	  // 주소록 AIP
	  function changeSelectAddress(){
		   new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                $('#zipcode').val(data.zonecode);
	                $('#address').val(addr);
	                $('#address2').val('');
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("address2").focus();
	            }
	        }).open();
		  }
 	</script>
 	<!-- 카카오페이 -->
  </body>
</html>
