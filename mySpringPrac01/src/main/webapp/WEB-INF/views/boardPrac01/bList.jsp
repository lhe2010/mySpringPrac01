<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script>
	$().ready(function(){
		$("#getSearchBoard").click(function(){
			var onePageViewCount = $("#onePageViewCount").val(); 
			var searchKeyword = $("#searchKeyword").val();
			var searchWord = $("#searchWord").val();
			/* alert("검색중!\n["+searchKeyword+"]"+searchWord); */
			location.href="boardList?onePageViewCount="+onePageViewCount+"&searchKeyword="+searchKeyword+"&searchWord="+searchWord;
		});
		$("#onePageViewCount").change(function(){
			var onePageViewCount = $("#onePageViewCount").val(); 
			var searchKeyword = $("#searchKeyword").val();
			var searchWord = $("#searchWord").val();
			location.href="boardList?onePageViewCount="+onePageViewCount+"&searchKeyword="+searchKeyword+"&searchWord="+searchWord;
		});
	});
</script>
</head>
<body>
	<div>
		<h1>게시판 전체보기</h1><br>
		<a href="makeDummyData">더미데이터생성</a>
	</div>
	<div>
		<div>
			Total <span style="color: red; font-weight: bold">${totalBoardCount }</span> entries
		</div>
		<div>Show 
			<select id="onePageViewCount">
				<option value="5" <c:if test="${onePageViewCount eq 5}"> selected</c:if>>5</option>
				<option value="7" <c:if test="${onePageViewCount eq 7}"> selected</c:if>>7</option>
				<option value="10" <c:if test="${onePageViewCount eq 10}"> selected</c:if>>10</option>
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
				<c:set var="order" value="${totalBoardCount - (currentPageNumber -1 ) * onePageViewCount }"/>
				<c:forEach var="bdto" items="${boardList }">
					<tr>
						<td><fmt:parseNumber integerOnly="true" value="${order}"/></td>
							<c:set var="order" value="${order-1 }"/>	
						<td><c:if test="${bdto.reStep > 1 }">
								<c:forEach var="j" begin="0" end="${bdto.reLevel-1 }">
									&nbsp;&nbsp;
								</c:forEach> >>
							</c:if><a href="boardInfo?num=${bdto.num}">${bdto.subject }</a></td>
						<td>${bdto.writer }</td>
						<td><fmt:formatDate value="${bdto.regDate }" pattern="yyyy-MM-dd"/></td>
						<td>${bdto.readCount }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center">
						<select id="searchKeyword">
							<option <c:if test="${searchKeyword eq 'total' }"> selected </c:if> value="total" >total</option>
							<option <c:if test="${searchKeyword eq 'subject' }"> selected </c:if> value="subject" >subject</option>
							<option <c:if test="${searchKeyword eq 'writer' }"> selected </c:if> value="writer" >writer</option>
						</select>
						<input type="text" id="searchWord" name="searchWord" value="${searchWord }">
						<input type="button" id="getSearchBoard" value="Search">
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 페이지버튼 -->
	<div>
		<c:if test="${totalBoardCount gt 0 }">
			<ul>
				<c:if test="${startPage gt 10 }">
					<li><a href="boardList?currentPageNumber=${startPage-10 }&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}">Previous</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<li><a href="boardList?currentPageNumber=${i}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}">${i }</a></li>
				</c:forEach>
				<c:if test="${endPage le totalBoardCount && endPage ge 10}">
					<li><a href="boardList?currentPageNumber=${startPage+10 }&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}">Next</a>
				</c:if>
			</ul>
		</c:if>
	</div>
</body>
</html>