<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
</head>
<body>
	<div>
		<h1>게시판 전체보기</h1><br>
		<a href="makeDummyData">더미데이터생성</a>
	</div>
	<div>
		<div>
			Total <span style="color: red; font-weight: bold">0000</span> entries
		</div>
		<div>Show 
			<select id="onePageViewCount">
				<option value="5">5</option>
				<option value="7">7</option>
				<option value="10">10</option>
			</select> entries
		</div>
		<div>
			<input type="button" value="Write" onclick="location.href='boardWrite'" >
		</div>
		<table border="1">
			<colgroup>
				<col width="5%">
				<col width="60%">
				<col width="20%">
				<col width="10%">
				<col width="5%">
			</colgroup>
			<thead>
				<tr>
					<th>Order</th>
					<th>Subject</th>
					<th>Writer</th>
					<th>RegDate</th>
					<th>View</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bdto" items="${boardList }">
					<tr>
						<td>${bdto.num }</td>
						<td><a href="boardInfo?num=${bdto.num}">${bdto.subject }</a></td>
						<td>${bdto.writer }</td>
						<td><fmt:formatDate value="${bdto.regDate }" pattern="yyyy-MM-dd"/></td>
						<td>${bdto.readCount }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center">
						<select id="searchKeyword">
							<option value="total">total</option>
							<option value="subject">subject</option>
							<option value="writer">writer</option>
						</select>
						<input type="text" id="searchWord" name="searchWord" ><!-- 이후 value="${searchWord}" -->
						<input type="button" id="getSearchBoard" value="Search">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>