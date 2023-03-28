<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#boardWriteForm div {
	color : red;
	font-size : 8pt;
	font-weight : bold;
}
</style>
</head>
<body>
<h3>글쓰기</h3>
<form id="boardWriteForm">
<table border="1" cellpadding="5" cellspacing="0">
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="subject" id="subject" size="50" placeholder="제목 입력">
			<div id="subDiv" ></div>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" id="content" cols="50" rows="15"></textarea>
			<div id="contentDiv" ></div>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center">
		<input type="button" name="" value="글쓰기" id="boardWriteBtn">
		<input type="reset" name="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#boardWriteBtn').click(function(){
		$('#subDiv').empty();
		$('#contentDiv').empty();
		
		if($('#subject').val() == ''){
			$('#subDiv').text('제목 입력');
			$('#subDiv').focus();
		} else if($('#content').val() == ''){
			$('#contentDiv').text('내용 입력');
			$('#content').focus();
		} else {
			$.ajax({
				type: 'post',
				url: '/miniProject_jQuery/board/boardWrite.do',
		        data: $('#boardWriteForm').serialize(),
						//'subject='+$('#subject').val()+'&content='+$('#content').val()
						//{'subject': $('#subject').val(), 'content': $('#content').val()}
				success: function(){
					alert('글작성 완료!!');
					location.href='/miniProject_jQuery/board/boardList.do?pg=1';
				},
				error: function(err){
					console.log(err);
				}
					
			});
		}

	});
});
</script>
</body>
</html>