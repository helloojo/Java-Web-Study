<%@ page import="spms.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
</head>
<body>
	<jsp:include page="/Header.jsp" />
	<h1>회원 목록</h1>
	<p>
		<a href='add.do'>신규 회원</a>
	</p>
	<table border="1">
		<tbody>
			<jsp:useBean id="orderCond" scope="request" class="java.lang.String"/>
			<tr>
				<th>
				<% if(orderCond.equals("MNO_ASC")) { %>
					<a href="list.do?orderCond=MNO_DESC">번호↑</a>
				<% } else if(orderCond.equals("MNO_DESC")) { %>
					<a href="list.do?orderCond=MNO_ASC">번호↓</a>
				<% } else { %>
					<a href="list.do?orderCond=MNO_ASC">번호</a>
				<% } %>
				</th>
				<th>
				<% if(orderCond.equals("NAME_ASC")) { %>
					<a href="list.do?orderCond=NAME_DESC">이름↑</a>
				<% } else if(orderCond.equals("NAME_DESC")) { %>
					<a href="list.do?orderCond=NAME_ASC">이름↓</a>
				<% } else { %>
					<a href="list.do?orderCond=NAME_ASC">이름</a>
				<% } %>
				</th>
				<th>
				<% if(orderCond.equals("EMAIL_ASC")) { %>
					<a href="list.do?orderCond=EMAIL_DESC">이메일↑</a>
				<% } else if(orderCond.equals("EMAIL_DESC")) { %>
					<a href="list.do?orderCond=EMAIL_ASC">이메일↓</a>
				<% } else { %>
					<a href="list.do?orderCond=EMAIL_ASC">이메일</a>
				<% } %>
				</th>
				<th>
				<% if(orderCond.equals("CREATEDDATE_ASC")) { %>
					<a href="list.do?orderCond=CREATEDDATE_DESC">등록일↑</a>
				<% } else if(orderCond.equals("CREATEDDATE_DESC")) { %>
					<a href="list.do?orderCond=CREATEDDATE_ASC">등록일↓</a>
				<% } else { %>
					<a href="list.do?orderCond=CREATEDDATE_ASC">등록일</a>
				<% } %>
				</th>
				<th></th>
			</tr>
			<jsp:useBean id="members" scope="request" class="java.util.ArrayList" type="java.util.ArrayList<spms.vo.Member>"/>
			<% for (Member member : members) { %>
			<tr>
				<td><%=member.getNo()%></td>
				<td><a href='update.do?no=<%=member.getNo()%>'><%=member.getName()%></a></td>
				<td><%=member.getEmail()%></td>
				<td><%=member.getCreatedDate()%></td>
				<td><a href='delete.do?no=<%=member.getNo()%>'>[삭제]</a></td>
			</tr>	
			<% } %>
		</tbody>
	</table>
	<jsp:include page="/Tail.jsp" />
</body>
</html>