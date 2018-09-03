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
<link href='<spring:url value="/css/bootstrap.min.css" />' rel="stylesheet" />
<title>備品管理</title>
</head>
<body>
	<div class="container">
		<c:import url="include/header.jsp" />
		<h1>備品編集</h1>
		<form:form modelAttribute="item" enctype="multipart/form-data">

			<div class="form-group">
				品名(必須)
				<form:errors path="name" element="p" cssClass="text-danger" />
				<form:input path="name" class="form-control" />
			</div>


			<div class="form-group">
				数量(必須)
				<form:errors path="amount" element="p" cssClass="text-danger" />
				<form:input path="amount" class="form-control" />
			</div>


			<div class="form-group">
				場所
				<form:select path="location.id" class="form-control" items="${locations}" itemLabel="name" itemValue="id" />
			</div>

			<div class="form-group">
				<p>画像</p>
				<img src="<spring:url value="/images/item/" /><c:out value="${item.imageUrl}" />" height="100px">
				<!-- <input type="file" name="upfile" /> -->
				<form:input type="file" path="imageFile" />
				<form:hidden path="imageUrl" class="form-control" />
			</div>
			<div class="form-group">
				備考
				<form:textarea path="note" class="form-control" />
			</div>

			<form:hidden path="id" class="form-control" />
			<form:hidden path="registered" class="form-control" />

			<p>
				<input class="btn btn-primary" type="submit" value="更新"> <a class="btn btn-default" href="<spring:url value="/itemList" />">キャンセル</a>
			</p>

		</form:form>
	</div>
	<script src="<spring:url value="/js/jquery-2.2.4.min.js" />"></script>
	<script src="<spring:url value="/js/bootstrap.min.js" />"></script>
</body>
</html>