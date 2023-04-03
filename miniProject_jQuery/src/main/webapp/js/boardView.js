//$(function(){
$(document).ready(function(){
	$.ajax({
		type: 'post',
		url: '/miniProject_jQuery/board/getBoard.do',
		data: '&seq='+$('#seq').val(), //{'seq': $('#seq).val() , ~~}
		dataType: 'json',
		success: function(data){
			//console.log(JSON.stringify(data));
			//console.log(data.seq);
			//console.log(data.subject);
			
			$('#subjectSpan').text(data.subject);
			
			//$('tr > td:eq(1)').text('글번호: '+ data.seq);
			//$('tr > td:eq(2)').text('작성자: '+ data.id);
			//$('tr > td:eq(3)').text('조회수: '+ data.hit);
			
			$('#seqSpan').text('글번호: '+ data.seq);
			$('#idSpan').text('작성자: '+ data.id);
			$('#hitSpan').text('조회수: '+ data.hit);
			$('#contentSpan').text(data.content);
			
			//본인의 작성한 글인지 확인 
			//console.log($('#memId').val())
			//if($('#memId').val() != data.id){
			//	$('.edit').prop('type', 'hidden');
			//}	
			if($('#memId').val() == data.id)
				$('#boardViewSpan').show();
			else
				$('#boardViewSpan').hide();
			
		},
		error: function(err){
			console.log(err);
		}
	});
});


//글수정 폼
$('#boardUpdateFormBtn').click(function(){
	// 동적으로 들어오는 값(실행 후 결정되는 값)은 데이터로 가져올 수 없음
	// 가져올 수 있는 데이터는 페이지가 로드되자마자 결정되는 값
	//submit은 name 속성만 가져갈 수 있다.
	$('#boardViewForm').attr('action', '/miniProject_jQuery/board/boardUpdateForm.do');
	$('#boardViewForm').submit();  //seq, pg 
});

//글삭제 폼 -> 비밀번호 입력 후 -> 글삭제 
//글삭제 - 삭제 완료 후 1페이지로 보여준다.
$('#boardDeleteBtn').click(function(){
	$('#boardViewForm').attr('action', '/miniProject_jQuery/board/boardDeleteForm.do');
	$('#boardViewForm').submit(); 
});


//답글 작성 폼
$('#boardReplyFormBtn').click(function(){
	$('#boardViewForm').attr('action', '/miniProject_jQuery/board/boardReplyForm.do')
	// action이 채워져 있지 않으므로 동적으로 채워줄 수 있음
	$('#boardViewForm').submit();
	//submit: id 속성은 가져갈 수 없고 name 속성만 form을 통해 데이터 이동 가능 
	// seq, pg 전달
});


