<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
form[name="writeForm"] div {
	color : red;
	font-size : 8pt;
	font-weight : bold;
}
</style>
</head>
<body>
<form name="writeForm" id="writeForm" method="post" action="">
<h2>회원가입</h2>
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th>이름</th>
		<td>
			<input type="text" name="name" id="name" style="width : 100px;" placeholder="이름 입력">
			<div id="nameDiv"></div>
		</td>
	</tr>
	<tr>
		<th>아이디</th>
		<td>
		<input type="text" name="id" id="id" size="30" placeholder="아이디 입력">
		
		<!-- <input type="button" name="checkIdBtn" id="checkIdBtn" value="중복체크"> -->
		<input type="hidden" name="check" id="check" value="">
		
		<div id="idDiv"></div>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>
		<input type="password" name="pwd" id="pwd" size="40">
		<div id="pwdDiv"></div>
		</td>
	</tr>
	<tr>
		<th>재확인</th>
		<td>
		<input type="password" name="repwd" id="repwd" size="40">
		</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>
			<input type="radio" name="gender" id="gender_m" value="0" checked>
			<label for="gender_m">남자</label>
			<input type="radio" name="gender" id="gender_f" value="1">
			<label for="gender_f">여자</label>
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type="email" name="email1" style="width:120px">
		@
		<input type="email" name="email2" id="email2" style="width:120px">
		<select name="email3" id="email3" style="width:120px" onchange="select()">	
			<option value="">직접입력</option>
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
			<option value="nate.com">nate.com</option>
		</select>
		</td>
	</tr>
	<tr>
		<th>휴대폰</th>
		<td>
			<select name="tel1" style="width:70px">
				<option>010</option>
				<option>011</option>
				<option>019</option>
				<option>070</option>
			</select>
			- <input type="text" name="tel2">
			- <input type="text" name="tel3">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
			<input type="text" name="zipcode" id="zipcode" size="8" placeholder="우편번호" readonly>
			<input type="button" value="우편번호검색" onclick="execDaumPostcode()"><br>
			<input type="text" name="addr1" id="addr1" style ="width:400px;" placeholder="주소" readonly><br>
			<input type="text" name="addr2" id="addr2" style ="width:400px;" placeholder="상세주소">
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center;">
			<input type="button" id="writeBtn" value="회원가입" >
			<input type="button" name="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
/*
$('#checkIdBtn').click(function(){
	
	// 수업 풀이 
	$('#idDiv').empty();
	var id  = $('#id').val();
	
	if(id == '') {//document.getElementById("id").value == ""
		$('#idDiv').html('<font color="magenta")>먼저 아이디를 입력하세요</font>');
		$('#id').focus();
	}else{
		window.open('/miniProject_jQuery/member/checkId.do?id='+id, 'checkId', 'width=500 height=150 left=400 top=310');
		
		
		
		
		//혼자 작성한 것 
			$.ajax({
			type: 'post',
			url: '/miniProject_jQuery/member/checkId.do',
			data:'id=' + $('#id').val() ,
			dataType: 'text',
			success: function(data){
				data = data.trim();
				if(data == 'true'){
				    $('#idDiv').text('사용 불가능').css('color','red'); //사용불가, checkIdFail
				}else {
				    $('#idDiv').text('사용 가능').css('color','blue'); //사용가능, checkIdOk
				    $('#check').val($('#id').val());
				}
			},
			error: function(err){
				console.log(err);
			}
			
		}); 
	}
});
*/

//중복 아이디 체크 
$('#id').focusout(function(){
	var id  = $('#id').val();
	if($('#id').val() == ''){
		$('#idDiv').text('먼저 아이디를 입력').css('color','magenta');
	} else{
		//서버 요청	
		$.ajax({
			type: 'post',
			url: '/miniProject_jQuery/member/checkId.do',
			data:'id=' + id , //서버로 보내는 데이터
			dataType: 'text', //서버로부터 받은 데이터형, "text", "html", "xml", "json"
			success: function(data){
				data = data.trim();
				if(data == 'exist'){
				    $('#idDiv').text('사용 불가능').css('color','red'); //사용불가, checkIdFail
				}else {
				    $('#idDiv').text('사용 가능').css('color','blue'); //사용가능, checkIdOk
				    
				    //중복체크 확인용
				    $('#check').val(id);
				}
			},
			error: function(err){
				console.log(err);
			}
		});
	}
});
</script>
</body>
</html>