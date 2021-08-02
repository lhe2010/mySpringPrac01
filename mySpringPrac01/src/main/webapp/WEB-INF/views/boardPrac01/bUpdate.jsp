<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bUpdate</title>
</head>
<body>
	<div align="center" style="padding-top: 100px">
		<div align="center">
			<h2>Board Update</h2>
		</div>
		<form action="boardUpdate" method="post">
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
					<td><input type="text" name="subject" value="${bdto.subject }"></td>
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
					<td align="center">Password</td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td align="center">Content</td>
					<td><textarea rows="10" cols="50" id="content" name="content">${bdto.content }</textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="hidden" name="num" value="${bdto.num }" >
						<input type="submit" value="Modify">
						<input type="button" value="Main" onclick="location.href='simpleBoardList'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>