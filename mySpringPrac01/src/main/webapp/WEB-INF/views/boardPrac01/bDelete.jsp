<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bdto.subject }</title>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div align="center" style="padding-top: 100px" class="bs-docs-section">
		<div align="center" class="page-header">
			<h2>Board Delete</h2>
		</div>
		<form action="boardDelete" method="post">
			<table class="table table-hover" style="width: 700px">
				<colgroup>
					<col width="20%"> 
					<col width="80%">
				</colgroup>
				<tr class="table-default">
					<td align="center">Num</td>
					<td>${bdto.num }</td>
				</tr>
				<tr class="table-default">
					<td align="center">Subject</td>
					<td>${bdto.subject }</td>
				</tr>
				<tr class="table-default">
					<td align="center">ReadCount</td>
					<td>${bdto.readCount }</td>
				</tr>
				<tr class="table-default">
					<td align="center">RegDate</td>
					<td><fmt:formatDate value="${bdto.regDate }" pattern="yyyy-MM-dd"/> </td>
				</tr>
				<tr class="table-default">
					<td align="center">Writer</td>
					<td>${bdto.writer }</td>
				</tr>
				<tr class="table-default">
					<td align="center">E-mail</td>
					<td>${bdto.email }</td>
				</tr>
				<tr class="table-default">
					<td align="center">Password</td>
					<td><input type="password" class="form-control" id="password" name="password"></td>
				</tr>
				<tr class="table-default">
					<td align="center">Content</td>
					<td>${bdto.content }</td>
				</tr>
				<tr align="center" class="table-default">
					<td colspan="2">
						<input type="hidden" name="num" value="${bdto.num }" >
						<input type="submit" class="btn btn-primary btn-sm" value="Delete">
						<input type="button" class="btn btn-primary btn-sm" value="Main" onclick="location.href='boardList'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>