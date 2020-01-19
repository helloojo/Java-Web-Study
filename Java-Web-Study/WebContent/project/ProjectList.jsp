<%@ page import="spms.vo.Project" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로젝트 목록</title>
</head>
<body>
	<jsp:include page="/Header.jsp" />
	<h1>프로젝트 목록</h1>
	<p><a href="add.do">신규 프로젝트</a></p>
	<jsp:useBean id="projects" scope="request" class="java.util.ArrayList" type="java.util.ArrayList<spms.vo.Project>" />
	<table border="1">
		<tbody>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>상태</th>
				<th></th>
			</tr>
			<% for(Project project: projects) { %>
			<tr>
				<td><%=project.getNo() %></td>			
				<td><a href="update.do?no=<%=project.getNo()%>"><%=project.getTitle() %></a></td>			
				<td><%=project.getStartDate() %></td>			
				<td><%=project.getEndDate() %></td>			
				<td><%=project.getState() %></td>			
				<td><a href="delete.do?no=<%=project.getNo() %>">[삭제]</a></td>			
			</tr>
			<% } %>
		</tbody>
	</table>
	<jsp:include page="/Tail.jsp" />
</body>
</html>