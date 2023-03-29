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
<input type="hidden" id="pg" value="${pg }" />
<input type="hidden" id="seq" value="${seq }" />

<table id="boardViewTable" width="70%" border="2" cellpadding="5" cellspacing="0" frame="hsides" rules="rows">
	<tr>
		<td colspan="3">
			<h2 id="subjectTitle"></h2>
		</td>
	</tr>
	<tr>
		<td width="150" align="center"></td>
		<td width="150" align="center"></td>
		<td width="150" align="center"></td>
	</tr>
	
	<tr>
		<td colspan="3" height="250" valign="top">
			<div style="width: 100%; height: 100%; overflow: auto;"  >
				<pre id="content"></pre>
				<!-- white-space 를 잡으면 반드시 table에 너비가 있어야 한다. 그래야 영어 입력시 자동 개행 가능 -->
			</div>
		</td>
	</tr>
	<tr>
		<td colspan="3" style="text-align: left">
		<input type="button" name="" value="목록" onclick="history.go(-1)">
		</td>
	</tr>
</table>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript" src="../js/boardView.js"></script>
</body>
</html>