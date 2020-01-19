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
	<jsp:useBean id="orderCond" scope="request" class="java.lang.String" type="java.lang.String"/>
	<table border="1">
		<tbody>
			<tr>
				<th>
				<% if(orderCond.equals("PNO_ASC")) { %>
					<a href="list.do?orderCond=PNO_DESC">번호↑</a>
				<% } else if(orderCond.equals("PNO_DESC")) { %>
					<a href="list.do?orderCond=PNO_ASC">번호↓</a>
				<% } else { %>
					<a href="list.do?orderCond=PNO_ASC">번호</a>
				<% } %>
				</th>
				<th>
				<% if(orderCond.equals("TITLE_ASC")) { %>
					<a href="list.do?orderCond=TITLE_DESC">제목↑</a>
				<% } else if(orderCond.equals("TITLE_DESC")) { %>
					<a href="list.do?orderCond=TITLE_ASC">제목↓</a>
				<% } else { %>
					<a href="list.do?orderCond=TITLE_ASC">제목</a>
				<% } %>
				</th>
				<th>
				<% if(orderCond.equals("STARTDATE_ASC")) { %>
					<a href="list.do?orderCond=STARTDATE_DESC">시작일↑</a>
				<% } else if(orderCond.equals("STARTDATE_DESC")) { %>
					<a href="list.do?orderCond=STARTDATE_ASC">시작일↓</a>
				<% } else { %>
					<a href="list.do?orderCond=STARTDATE_ASC">시작일</a>
				<% } %>
				</th>
				<th>
				<% if(orderCond.equals("ENDDATE_ASC")) { %>
					<a href="list.do?orderCond=ENDDATE_DESC">종료일↑</a>
				<% } else if(orderCond.equals("ENDDATE_DESC")) { %>
					<a href="list.do?orderCond=ENDDATE_ASC">종료일↓</a>
				<% } else { %>
					<a href="list.do?orderCond=ENDDATE_ASC">종료일</a>
				<% } %>
				</th>
				<th>
				<% if(orderCond.equals("STATE_ASC")) { %>
					<a href="list.do?orderCond=STATE_DESC">상태↑</a>
				<% } else if(orderCond.equals("STATE_DESC")) { %>
					<a href="list.do?orderCond=STATE_ASC">상태↓</a>
				<% } else { %>
					<a href="list.do?orderCond=STATE_ASC">상태</a>
				<% } %>
				</th>
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