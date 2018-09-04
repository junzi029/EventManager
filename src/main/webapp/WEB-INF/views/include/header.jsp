<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbarEexample">
				<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<spring:url value="/todayEvent" />"><img src="images/EventManager.png" height="50px"></a>
		</div>

		<div class="collapse navbar-collapse" id="navbarEexample">
			<ul class="nav navbar-nav">
				<li class="active"><a href="<spring:url value="/itemList" />">備品管理</a></li>
				<li><a href="<spring:url value="/locationList" />">場所管理</a></li>
				<li><a href="<spring:url value="/usersList" />">ユーザー管理</a></li>
			</ul>

			<ul class="nav navbar-nav  navbar-right">
				<li class="dropdown"><a href="#" class="" data-toggle="dropdown" role="button" aria-expanded="false"> <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						${sessionScope.userName}<span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li role="presentation"><a href="<spring:url value="/logout" />">ログアウト</a></li>
					</ul></li>
			</ul>
		</div>
	</div>
</nav>