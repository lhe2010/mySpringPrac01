<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${bdto.num }의 답글쓰는중</title>
<link href="resources/css/styles.css" rel="stylesheet" />
</head>
<body>
	<div align="center" style="padding-top: 100px" class="bs-docs-section">
		<div align="center" class="page-header">
			<h2>Board Reply Write</h2>
		</div>
		<form action="boardReplyWrite"  method="post" >
			<table class="table table-hover" style="width: 700px">
				<colgroup>
					<col width="20%"> 
					<col width="80%">
				</colgroup>
				<tr class="table-default">
					<td align="center">원글</td>
					<td>(${bdto.num }) ${bdto.subject }</td>
				<tr class="table-default">
					<td align="center"><span style="color: red">*</span>Writer</td>
					<td><input type="text" class="form-control" id="writer" name="writer"></td>
				</tr>
				<tr class="table-default">
					<td align="center"><span style="color: red">*</span>Subject</td>
					<td><input type="text" class="form-control" id="subject" name="subject"></td>
				</tr>
				<tr class="table-default">
					<td align="center"><span style="color: red">*</span>E-mail</td>
					<td><input type="email" class="form-control" id="email" name="email"></td>
				</tr>
				<tr class="table-default">
					<td align="center"><span style="color: red">*</span>Password</td>
					<td><input type="password" class="form-control" id="password" name="password"></td>
				</tr>
				<tr class="table-default">
					<td align="center">Content</td>
					<td><textarea class="form-control" rows="10" cols="50" id="content" name="content"></textarea></td>
				</tr>
				<tr align="center" class="table-default">
					<td colspan="2">
						<input type="hidden" name="ref" value="${bdto.ref }">
						<input type="hidden" name="reStep" value="${bdto.reStep }">
						<input type="hidden" name="reLevel" value="${bdto.reLevel }">
						<input type="submit" class="btn btn-primary btn-sm" value="Write">
						<input type="reset" class="btn btn-primary btn-sm" value="Reset">
						<input type="button" class="btn btn-primary btn-sm" value="Main" onclick="location.href='boardList'">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>