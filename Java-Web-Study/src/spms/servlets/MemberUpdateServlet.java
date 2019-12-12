package spms.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import spms.dao.MemberDao;
import spms.vo.Member;

@WebServlet("/member/update")
public class MemberUpdateServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    try {
      ServletContext sc = this.getServletContext();
      Connection conn = (Connection) sc.getAttribute("conn");

      MemberDao memberDao = new MemberDao();
      memberDao.setConnection(conn);

      request.setAttribute("member", memberDao.selectOne(Integer.parseInt(request.getParameter("no"))));

      response.setContentType("text/html;charset=UTF-8");

      RequestDispatcher rd = request.getRequestDispatcher("/member/MemberUpdateForm.jsp");
      rd.include(request, response);
    } catch (Exception e) {
      RequestDispatcher rd = request.getRequestDispatcher("/Error.jsp");
      request.setAttribute("error", e);
      rd.forward(request, response);
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
      ServletContext sc = this.getServletContext();
      conn = (Connection) sc.getAttribute("conn");

      MemberDao memberDao = new MemberDao();
      memberDao.setConnection(conn);

      memberDao.update(new Member().setEmail(request.getParameter("email")).setName(request.getParameter("name"))
          .setNo(Integer.parseInt(request.getParameter("no"))));

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
