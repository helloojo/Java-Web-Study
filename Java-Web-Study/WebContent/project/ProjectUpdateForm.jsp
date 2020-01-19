<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 정보</title>
</head>
<body>
	<jsp:include page="/Header.jsp"/>
	<h1>프로젝트 정보</h1>
	<jsp:useBean id="project" scope="request" class="spms.vo.Project"/>
	<form action="update.do?no=<%=project.getNo() %>" method="POST">
		<ul style="list-style-type: none;">
			<li>
				<label for="no">번호</label>
				<input disabled="disabled" name="no" id="no" type="text" value="<%=project.getNo()%>"/>
			</li>
			<li>
				<label for="title">제목</label>
				<input name="title" id="title" type="text" value="<%=project.getTitle() %>"
			</li>
			<li>
				<label for="content">내용</label>
				<textarea id="content" name="content"><%=project.getContent() %></textarea>
			</li>
			<li>
				<label for="startdate">시작일</label>
				<input id="startdate" name="startdate" type="text" placeholder="예)2019-01-01" value="<%=project.getStartDate() %>"/>
			</li>
			<li>
				<label for="enddate">종료일</label>
				<input id="enddate" name="enddate" type="text" placeholder="예)2019-01-01" value="<%=project.getEndDate() %>"/>
			</li>
			<li>
				<label for="state">상태</label>
				<select id="state" name="state">
					<option value="0" ${project.state==0 ? "selected" : ""}>준비</option>
					<option value="1" ${project.state==1 ? "selected" : ""}>진행</option>
					<option value="2" ${project.state==2 ? "selected" : ""}>완료</option>
					<option value="3" ${project.state==3 ? "selected" : ""}>취소</option>
				</select>
			</li>
			<li>
				<label for="tags">태그</label>
				<input id="tags" name="tags" type="text" placeholder="예)태그1 태그2 태그3" value="<%=project.getTags() %>"/>
			</li>
			<input type="submit" value="저장"/>
			<input type='button' value='삭제' onclick='location.href="delete.do?no=${project.no}"'>
			<input type="button" value="취소" onclick="location.href=list.do"/>						
		</ul>
	</form>
	<jsp:include page="/Tail.jsp"/>
</body>
</html>