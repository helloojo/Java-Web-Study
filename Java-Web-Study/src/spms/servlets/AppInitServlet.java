package spms.servlets;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class AppInitServlet extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  public void init(ServletConfig config) throws ServletException {
    System.out.println("AppInitServlet 준비...");
    super.init(config);

    try {
      ServletContext sc = this.getServletContext();
      Class.forName(sc.getInitParameter("driver"));
      // 웹 어플리케이션 시작시 DB Connection 생성
      Connection conn = DriverManager.getConnection(sc.getInitParameter("url"), sc.getInitParameter("username"),
          sc.getInitParameter("password"));
      sc.setAttribute("conn", conn);
    } catch (Exception e) {
    }
  }

  @Override
  public void destroy() {
    System.out.println("AppInitServlet 마무리...");
    super.destroy();
    Connection conn = (Connection) this.getServletContext().getAttribute("conn");
    try {
      if (conn != null && conn.isClosed() == false) {
        conn.close();
      }
    } catch (Exception e) {
    }
  }
}
