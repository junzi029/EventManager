<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="css/bootstrap.min.css" rel="stylesheet" />
<title>備品管理</title>
</head>
<body>
	<div class="container"><c:import url="include/header.jsp" />
		<h1>場所登録</h1>
		<form:form modelAttribute="location">
			<div class="form-group">
				場所(必須)
				<form:errors path="name" element="p" cssClass="text-danger" />
				<form:input path="name" class="form-control" />
			</div>

			<p>
				<input class="btn btn-primary" type="submit" value="登録"> <a class="btn btn-default" href="<spring:url value="/itemList" />">キャンセル</a>
			</p>

		</form:form>
	</div>
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

</body>
</html>