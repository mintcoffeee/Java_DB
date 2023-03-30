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
	$('#boardViewForm').attr('action', '/miniProject_jQuery/board/boardUpdateForm.do');
	$('#boardViewForm').submit(); //submit은 name 속성만 가져갈 수 있다. 
});





