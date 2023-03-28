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
					text: items.subject,
					href: 'http://www.naver.com' // Replace with the appropriate URL
				}))).append($('<td/>',{//작성자
					align: 'center',
					text: items.id
				})) .append($('<td/>',{//조회수
					align: 'center',
					text: items.hit
				})) .append($('<td/>',{//작성일
					align: 'center',
					text: items.seq
				})).appendTo('#boardListTable')
						//appendTo() : tr(자식)태그를 boardListTable(부모)에 붙여라 
			}); // for문 
		},
		error: function(err){
			console.log(err);
		}
	});
}); 


