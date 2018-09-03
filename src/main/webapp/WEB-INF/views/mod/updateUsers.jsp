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
		<h1>ユーザー編集</h1>
		<form:form modelAttribute="users">

			<div class="form-group">
				名前(必須)
				<form:errors path="name" element="p" cssClass="text-danger" />
				<form:input path="name" class="form-control" />
			</div>


			<div class="form-group">
				ログインID(必須)
				<form:errors path="loginId" element="p" cssClass="text-danger" />
				<form:input path="loginId" class="form-control" />
			</div>


			<div class="form-group">
				ログインパス
				<form:errors path="loginPass" element="p" cssClass="text-danger" />
				<form:password path="loginPass" class="form-control" />
			</div>
			<form:hidden path="id" class="form-control" />
			<p>
				<input class="btn btn-primary" type="submit" value="登録"> <a class="btn btn-default" href="/usersList">キャンセル</a>
			</p>

		</form:form>
	</div>
	<script src="<spring:url value="/js/jquery-2.2.4.min.js" />"></script>
	<script src="<spring:url value="/js/bootstrap.min.js" />"></script>

</body>
</html>