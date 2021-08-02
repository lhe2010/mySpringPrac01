<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bdto.subject }</title>
</head>
<body>
	<div align="center" style="padding-top: 100px">
		<div align="center">
			<h2>Board Info</h2>
		</div>
		<table border="1" style="width: 700px">
			<colgroup>
				<col width="20%"> 
				<col width="80%">
			</colgroup>
			<tr>
				<td align="center">Num</td>
				<td>${bdto.num }</td>
			</tr>
			<tr>
				<td align="center">Subject</td>
				<td>${bdto.subject }</td>
			</tr>
			<tr>
				<td align="center">ReadCount</td>
				<td>${bdto.readCount }</td>
			</tr>
			<tr>
				<td align="center">RegDate</td>
				<td><fmt:formatDate value="${bdto.regDate }" pattern="yyyy-MM-dd"/> </td>
			</tr>
			<tr>
				<td align="center">Writer</td>
				<td>${bdto.writer }</td>
			</tr>
			<tr>
				<td align="center">E-mail</td>
				<td>${bdto.email }</td>
			</tr>
			<tr>
				<td align="center">Content</td>
				<td>${bdto.content }</td>
			</tr>
			<tr align="center">
				<td colspan="2">
					<input type="button" value="Reply" onclick="location.href='boardReplyWrite?num=${bdto.num}'">
					<input type="button" value="Modify" onclick="location.href='boardUpdate?num=${bdto.num}'">
					<input type="button" value="Delete" onclick="location.href='boardDelete?num=${bdto.num}'">
					<input type="button" value="Main" onclick="location.href='simpleBoardList'">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>