<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ninja Gold!</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
	<div class="header">
		<h1>Ninja Gold Game</h1>
		<h2>Complete tasks and get gold!</h2>
	</div>
	<div class="count">
		<p>Your Gold: ${count }</p>
	</div>
	<div class="container">
		<div class="box">
			<p>Farm</p>
			<p>(earns 10-20 gold)</p>
			<form action="/process" method="POST">
				<input type="hidden" name="choice" value="farm"></input>
				<input type="hidden" name="min" value="10"></input>
				<input type="hidden" name="max" value="20"></input>
				<button type="submit">Find Gold!</button>
			</form>
		</div>
		<div class="box">
			<p>Cave</p>
			<p>(earns 5-10 gold)</p>
			<form action="/process" method="POST">
				<input type="hidden" name="choice" value="cave"></input>
				<input type="hidden" name="min" value="5"></input>
				<input type="hidden" name="max" value="10"></input>
				<button type="submit">Find Gold!</button>
			</form>
		</div><div class="box">
			<p>House</p>
			<p>(earns 2-5 gold)</p>
			<form action="/process" method="POST">
				<input type="hidden" name="choice" value="house"></input>
				<input type="hidden" name="min" value="2"></input>
				<input type="hidden" name="max" value="5"></input>
				<button type="submit">Find Gold!</button>
			</form>
		</div><div class="box">
			<p>Quest</p>
			<p>(earns or loses 0-50 gold)</p>
			<form action="/process" method="POST">
				<input type="hidden" name="choice" value="quest"></input>
				<input type="hidden" name="min" value="0"></input>
				<input type="hidden" name="max" value="50"></input>
				<button type="submit">Find Gold!</button>
			</form>
		</div>
	</div>
	<div class="activities">
		<p>Activities:</p>
		<c:forEach var="oneEvent" items="${activityList}">
			<p><c:out value="${oneEvent }"/></p>
		</c:forEach>
	</div>
</body>
</html>