<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<title>備品リスト</title>
</head>
<body>
	<div class="container">
		<c:import url="include/header.jsp" />

		<h1>備品リスト</h1>
		<ul class="pagination">
			<c:if test="${totalPages > 1}">
				<c:choose>
					<c:when test="${currentPage == 1}">
						<li class="disabled"><a href="#" aria-label="前のページへ"> <span aria-hidden="true">«</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="?p=<c:out value="${currentPage - 1}" />" aria-label="前のページへ"> <span aria-hidden="true">«</span>
						</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach begin="1" end="${totalPages}" var="p">
					<c:choose>
						<c:when test="${currentPage == p}">
							<li class="active"><a href="?p=<c:out value="${p}" />"><c:out value="${p}" /></a></li>
						</c:when>
						<c:otherwise>
							<li><a href="?p=<c:out value="${p}" />"><c:out value="${p}" /></a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${currentPage == totalPages}">
						<li class="disabled"><li class="disabled">
					<a href="#" aria-label="次のページへ"> <span aria-hidden="true">»</span>
						</a></li></c:when>
					<c:otherwise>
						<li><a href="?p=<c:out value="${currentPage + 1}" />" aria-label="次のページへ"> <span aria-hidden="true">»</span>
						</a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
		</ul>
		<table class="table table-bordered">
			<tr>
				<th>品名</th>
				<th>数量</th>
				<th>場所</th>
				<th>備考</th>
				<th>画像</th>
				<th>登録日</th>
				<th>更新日</th>
				<th>編集</th>
				<th>削除</th>
			</tr>

			<c:forEach items="${listItem}" var="item">
				<tr>
					<td><c:out value="${item.name}" /></td>
					<td><c:out value="${item.amount}" /></td>
					<td><c:out value="${item.location.name}" /></td>
					<td><c:out value="${item.note}" /></td>
					<td><img src="images/item/<c:out value="${item.imageUrl}" />" height="100px"></td>
					<td><fmt:formatDate value="${item.registered}" pattern="yyyy-MM-dd HH:mm" /></td>
					<td><fmt:formatDate value="${item.updated}" pattern="yyyy-MM-dd HH:mm" /></td>
					<td><a class="btn btn-default" href="updateItem/<c:out value="${item.id}" />">編集</a></td>
					<td><a class="btn btn-danger" href="delItem/<c:out value="${item.id}" />">削除</a></td>

				</tr>
			</c:forEach>
		</table>
		<p>
			<a href="addItem" class="btn btn-primary">備品の追加</a>
		</p>

	</div>
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>