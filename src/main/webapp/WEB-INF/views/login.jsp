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
<title>会員管理</title>
</head>
<body>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-sm-6 col-sm-offset-3">
				<div class="panel panel-default">

					<div class="panel-heading">
						<h1 class="panel-title"><img src="images/EventManager.png" height="50px"></h1>
					</div>

					<div class="panel-body">

						<form:errors path="users" element="div" class="alert alert-danger" role="alert" />
						<form action="" method="post">
							<div class="form-group">
								<form:errors path="users.loginId" element="p" cssClass="text-danger" />
								<input type="text" name="loginId" placeholder="ログインID" class="form-control" value="<c:out value="${users.loginId}" />" />
							</div>
							<div class="form-group">
								<form:errors path="users.loginPass" element="p" cssClass="text-danger" />
								<input type="password" name="loginPass" placeholder="パスワード"  class="form-control"/>
							</div>
							<input class="form-control btn btn-primary" type="submit" value="ログイン">
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="js/jquery-2.2.4.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>