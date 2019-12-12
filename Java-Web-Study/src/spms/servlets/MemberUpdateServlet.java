package spms.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.vo.Member;

@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
      ServletContext sc = this.getServletContext();
      conn = (Connection) sc.getAttribute("conn");
      stmt = conn.createStatement();
      rs = stmt.executeQuery("SELECT MNO,EMAIL,MNAME,CRE_DATE FROM MEMBERS WHERE MNO=" + request.getParameter("no"));
      rs.next();

      request.setAttribute("member", new Member().setNo(rs.getInt("MNO")).setName("MNAME")
          .setEmail(rs.getString("EMAIL")).setCreatedDate(rs.getDate("CRE_DATE")));

      response.setContentType("text/html;charset=UTF-8");

      RequestDispatcher rd = request.getRequestDispatcher("/member/MemberUpdateForm.jsp");
      rd.include(request, response);
    } catch (Exception e) {
      RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
      request.setAttribute("error", e);
      rd.forward(request, response);
    } finally {
      try {
        if (rs != null) {
          rs.close();
        }
      } catch (Exception e) {
      }
      try {
        if (stmt != null) {
          stmt.close();
        }
      } catch (Exception e) {
      }
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
      ServletContext sc = this.getServletContext();
      conn = (Connection) sc.getAttribute("conn");
      stmt = conn.prepareStatement("UPDATE MEMBERS SET EMAIL=?,MNAME=?,MOD_DATE=NOW() WHERE MNO=?");
      stmt.setString(1, request.getParameter("email"));
      stmt.setString(2, request.getParameter("name"));
      stmt.setInt(3, Integer.parseInt(request.getParameter("no")));

      stmt.executeUpdate();

      response.sendRedirect("list");
    } catch (Exception e) {
      RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
      request.setAttribute("error", e);
      rd.forward(request, response);
    } finally {
      try {
        if (stmt != null) {
          stmt.close();
        }
      } catch (Exception e) {
      }
    }
  }

}
