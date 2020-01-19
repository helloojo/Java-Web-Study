<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 등록</title>
</head>
<body>
	<jsp:include page="/Header.jsp" />
	<h1>프로젝트 등록</h1>
	<form action="add.do" method="POST">
		<ul style="list-style-type: none;">
			<li>
				<label for="title">제목</label>
				<input id="title" name="title" type="text" />
			</li>
			<li>
				<label for="content">내용</label>
				<textarea id="content" name="content" rows="4"></textarea>
			</li>
			<li>
				<label for="startdate">시작일</label>
				<input id="startdate" name="startdate" placeholder="예)2019-01-01" />
			</li>
			<li>
				<label for="enddate">종료일</label>
				<input id="enddate" name="enddate" placeholder="예)2019-01-01"/>
			</li>
			<li>
				<label for="tags">태그</label>
				<input id="tags" name="tags" placeholder="예)태그1 태그2 태그3"/>
			</li>
		</ul>
		<input type="submit" value="추가"/>
		<input type='button' value='취소' onclick="location.href='list.do'"/>
	</form>
	<jsp:include page="/Tail.jsp" />
</body>
</html>
