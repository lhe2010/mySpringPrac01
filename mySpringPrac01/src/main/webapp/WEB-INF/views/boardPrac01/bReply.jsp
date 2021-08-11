<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bdto.num }의 답글쓰는중</title>
</head>
<body>
	<div align="center" style="padding-top: 100px">
		<div align="center">
			<h2>Board Reply Write</h2>
		</div>
		<form action="boardReplyWrite"  method="post" >
			<table border="1" style="width: 700px">
				<colgroup>
					<col width="20%"> 
					<col width="80%">
				</colgroup>
				<tr>
					<td align="center">원글</td>
					<td>(${bdto.num }) ${bdto.subject }</td>
				<tr>
					<td align="center">Writer</td>
					<td><input type="text" id="writer" name="writer"></td>
				</tr>
				<tr>
					<td align="center">Subject</td>
					<td><input type="text" id="subject" name="subject"></td>
				</tr>
				<tr>
					<td align="center">E-mail</td>
					<td><input type="email" id="email" name="email"></td>
				</tr>
				<tr>
					<td align="center">Password</td>
					<td><input type="password" id="password" name="password"></td>
				</tr>
				<tr>
					<td align="center">Content</td>
					<td><textarea rows="10" cols="50" id="content" name="content"></textarea></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<input type="hidden" name="ref" value="${bdto.ref }">
						<input type="hidden" name="reStep" value="${bdto.reStep }">
						<input type="hidden" name="reLevel" value="${bdto.reLevel }">
						<input type="submit" value="Write">
						<input type="reset" value="Reset">
						<input type="button" value="Main" onclick="location.href='boardList'">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>