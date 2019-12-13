package spms.listeners;

import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import spms.context.ApplicationContext;
import spms.controls.LoginController;
import spms.controls.LogoutController;
import spms.controls.MemberAddController;
import spms.controls.MemberDeleteController;
import spms.controls.MemberListController;
import spms.controls.MemberUpdateController;
import spms.dao.MySqlMemberDao;

@WebListener
public class ContextLoaderListener implements ServletContextListener {
  static ApplicationContext applicationContext;

  public static ApplicationContext getApplicationContext() {
    return applicationContext;
  }

  @Override
  public void contextInitialized(ServletContextEvent event) {
    try {
      ServletContext sc = event.getServletContext();

      String propertiesPath = sc.getRealPath(sc.getInitParameter("contextConfigLocation"));
      applicationContext = new ApplicationContext(propertiesPath);
    } catch (Throwable e) {
      e.printStackTrace();
    }
  }

  @Override
  public void contextDestroyed(ServletContextEvent event) {
  }
}
