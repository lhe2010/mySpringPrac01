<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardList</title>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<link href="resources/css/styles.css" rel="stylesheet"/>
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
<body class="sb-nav-fixed"> 
	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
		<a class="navbar-brand ps-3" href="boardList">BoardList</a>
    </nav>
<!--  -->
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Board</div>
                        <a class="nav-link" href="boardList">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            boardList
                        </a>
                        <a class="nav-link" href="simpleBoardList">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            simpleBoardList
                        </a>
                	</div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    Spring Board Prac01
                </div>
            </nav>
        </div>
        <!--  -->
        <div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">게시판 전체보기</h1>
			</div>
			<div class="card mb-4">
	            <div class="card-body">
	                1) 부트스트랩 적용<br>
	                2) 검색기능 적용<br>
	                3) 페이징 처리 적용 > <a href="makeDummyData">테스트용 더미파일 만들기</a><br>
	                4) 계층형 댓글 적용<br>
	            </div>
	        </div>
	        <div class="ml-1">
				<!-- 총게시글수 -->
			    <i class="fas fa-table me-1"></i>
			    Total <span style="color: red; font-weight: bold">${totalBoardCount }</span> entries
	        </div>
	        <div class="card mb-4">
				<div class="card-header">
					<!-- 테이블 상단 -->
			        <div class="dataTable-top">
					    <div class="dataTable-dropdown">
					        <label> Show
					            <select class="dataTable-selector" id="onePageViewCount">
									<option value="5" <c:if test="${onePageViewCount eq 5}"> selected</c:if>>5</option>
									<option value="7" <c:if test="${onePageViewCount eq 7}"> selected</c:if>>7</option>
									<option value="10" <c:if test="${onePageViewCount eq 10}"> selected</c:if>>10</option>
								</select> entries
					        </label>
					    </div>
					    <div>
							<input type="button" value="Write" onclick="location.href='boardWrite'" class="btn btn-primary" style="display: inline;">
					    </div>
					</div>
					<!-- 셀렉트요소 -->
				</div>
				<div class="card-body">
					<!-- table -->
					<table id="datatablesSimple" class="table table-bordered" width="100%" cellspacing="0">
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
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5" align="center">
									<!-- 페이지 버튼 -->
									<div>
										<nav class="dataTable-pagination">
											<c:if test="${totalBoardCount gt 0 }">
												<ul class="dataTable-pagination-list">
													<c:if test="${startPage gt 10 }">
														<li class="pager"><a href="boardList?currentPageNumber=${startPage-10 }&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}">Previous</a>
													</c:if>
													<c:forEach var="i" begin="${startPage }" end="${endPage }">
														<li><a href="boardList?currentPageNumber=${i}&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}">${i }</a></li>
													</c:forEach>
													<c:if test="${endPage le totalBoardCount && endPage ge 10}">
														<li class="pager"><a href="boardList?currentPageNumber=${startPage+10 }&onePageViewCount=${onePageViewCount}&searchKeyword=${searchKeyword}&searchWord=${searchWord}">Next</a>
													</c:if>
												</ul>
											</c:if>
										</nav>
									</div>
									<!-- 페이지버튼  -->
								</td>
							</tr>
						</tfoot>
					</table>
					<div align="center">
						<select id="searchKeyword" class="form-control" style="width: 150px; display: inline;">
							<option <c:if test="${searchKeyword eq 'total' }"> selected </c:if> value="total" >total</option>
							<option <c:if test="${searchKeyword eq 'subject' }"> selected </c:if> value="subject" >subject</option>
							<option <c:if test="${searchKeyword eq 'writer' }"> selected </c:if> value="writer" >writer</option>
						</select>
						<input type="text" id="searchWord" name="searchWord" value="${searchWord }" style="width: 300px; display: inline;" class="form-control" >
						<input type="button" id="getSearchBoard" value="Search" class="btn btn-primary" style="display: inline;" >
					
					</div>
				</div>
			</div>			

		</main>
	</div>
        <!--  -->
	</div> 
</body>
</html>