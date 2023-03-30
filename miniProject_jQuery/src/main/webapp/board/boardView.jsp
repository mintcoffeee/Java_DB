<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
pre {
	/* white-space: pre-wrap; */  /* 형식 유지하면서 자동 개행 */
	white-space: pre-line;
	word-break: break-all;
}
</style>
</head>
<body>

<form id="boardViewForm">
<input type="hidden" id="pg" value="${pg }" />
<input type="hidden" id="seq" value="${seq }" />
<input type="hidden" id="memId" value="${memId }" />

<table id="boardViewTable" width="770px" border="2" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
	<tr>
		<td colspan="3">
			<h2><span id="subjectSpan"></span></h2>
		</td>
	</tr>
	<tr>
		<td width="150" align="center"><span id="seqSpan"></span></td>
		<td width="150" align="center"><span id="idSpan"></span></td>
		<td width="150" align="center"><span id="hitSpan"></span></td>
	</tr>
	
	<tr>
		<td colspan="3" height="250" valign="top">
			<div style="width: 100%; height: 100%; overflow: auto;"> <!-- 밑으로 긴 글일 때 스크롤바가 뜨게 한다. -->
				<pre>
					<span id="contentSpan"></span>
				</pre>
			</div>
		</td>
	</tr>
</table>
<input type="button" name="" value="목록" 
onclick="location.href='/miniProject_jQuery/board/boardList.do?pg=${pg}'"><!-- El : java 에서 값 얻어온다.  -->
<span>
	<input class="edit" type="button" value="글수정">
	<input class="edit" type="button" value="글삭제">
</span>
</form>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
</body>
</html>