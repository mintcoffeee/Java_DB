//$(function(){});
$(document).ready(function(){ // 위 아래 같은 의미이다.
	$.ajax({
		type: 'post',
		url: '/miniProject_jQuery/board/getBoardList.do',
		data: 'pg=' + $('#pg').val(), //json형식: {'pg':$('#pg').val()}
		dataType: 'json',//서버로부터 받는 데이터 자료형 'text', 'html', 'xml', 'json' =>객체는 받을 자료형이 없다.	
						 //객체를 json 으로 변환시켜서 가져와야 한다. 
		success: function(data){
			//console.log(JSON.stringify(data));
			//console.log(data.list[0].seq);
			//console.log(data.list[1].name);
			
			//for(BoardDTO boardDTO : list)
			$.each(data.list, function(index, items){ // items = boardDTO
				console.log(index + ', seq=' + items.seq + ', name=' + items.name);
				
				$('<tr/>').append($('<td/>',{
					align: 'center',
					text: items.seq
				})) .append($('<td/>').append($('<a/>',{
					//href: '#',
					class: 'subjectA',					
					text: items.subject
				}))).append($('<td/>',{//작성자
					align: 'center',
					text: items.id
				})) .append($('<td/>',{//조회수
					align: 'center',
					text: items.hit
				})) .append($('<td/>',{//작성일
					align: 'center',
					text: items.logtime
				})).appendTo('#boardListTable')
						//appendTo() : tr(자식)태그를 boardListTable(부모)에 붙여라 
			}); // for문 
			
			//페이징 처리 	
			$('#boardPagingDiv').html(data.pagingHTML);
			
			//로그인 여부
			$('.subjectA').click(function(){
				if($('#memId').val() == ''){ //javascript: null값으로 나타나는것이 아닌 공백으로 표현한다.
					alert('먼저 로그인하세요');	
					
					location.herf = '/miniProject_jQuery/member/loginForm.do'
				}else {
					//$(this).parent() : <td> 태그 'subject'
					//$(this).parent().prev() : <td> 태그 'seq'
					var seq = $(this).parent().prev().text(); //'seq'의 값 가져오기 
					//console.log(seq.prop('tagName'));
					console.log(seq);
					var pg = $('#pg').val();
					
					location.href='/miniProject_jQuery/board/boardView.do?seq='+seq+'&pg='+pg;
				}
			});
		},
		error: function(err){
			console.log(err);
		}
	});
}); 


