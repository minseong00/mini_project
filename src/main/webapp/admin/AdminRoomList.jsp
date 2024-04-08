<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	body{
		line-height: normal;
		display: flex;
	}
	.sidebar{
		background: #ffffff;
		font-family: "Poppins", sans=serif;
		font-weight: normal;
		padding: 0;
		width: 236px;
		height: 95vh;
		z-index: 11;
		box-shadow: 0 5px 10px 0 rgba(230, 230, 243, 0, 0.88);
		margin-left: 0.5rem;
		margin-bottom: 2.062rem;
		border-radius: 6px;
		border: 1px solid #e4e4f4;
		display: inline-block;
	}
	.nav{
		display: flex;
		flex-wrap: wrap;
		padding-left: 0;
		margin-bottom: 0;
		list-style: none; 
	}
	
	.sidebar .nav {
		overflow: hidden;
		flex-wrap: nowrap;
		flex-direction: column;
		margin-bottom: 60px;
	}
	.sidebar .nav li a {
		display: flex;
		white-space: nowrap;
		padding: 0.87rem 0.875rem 0.87rem 0.6rem;
		color: #001737;
	}
	
	.sidebar .nav li {
		margin-bottom: -1px;
	}
	
	.sidebar .nav li a {
		text-decoration: none;
	}
	
	.sidebar .nav li a:hover{
		color: #0056b3;
		text-decoration: underline;
	}
	.sidebar .nav li a span {
		text-shadow: none;
	}
	
	.rightside{
		display: flex;
		flex-direction: column;
		flex-grow: 1;
		margin-left: 0.5rem;
	}
	
</style>
</head>
<body>

	<nav class="sidebar">
		<ul class="nav">
			<li>
				<a href="#">
					<span>관리자 홈</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span>회원 예약</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span>객실정보</span>
				</a>
			</li>
			<li>
				<a href="#">
					<span>객실등록</span>
				</a>
			</li>
		</ul>
	</nav>
	<div class="rightside">
		<table>
			<colgroup>
				<col width="">
				<col width="">
				<col width="">
				<col width="">
			</colgroup>
		</table>
	</div>
</body>
</html>