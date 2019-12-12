package spms.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharacterEncodingFilter implements Filter {
  FilterConfig config;

  @Override
  public void init(FilterConfig config) throws ServletException {
    this.config = config;
  }

  @Override
  public void doFilter(ServletRequest request, ServletResponse response, FilterChain nextFilter)
      throws IOException, ServletException {
    
    //서블릿 실행 전에 처리됨    
    request.setCharacterEncoding(config.getInitParameter("encoding"));

    nextFilter.doFilter(request, response);
    
    //서블릿 실행 후 처리됨
  }

  @Override
  public void destroy() {
  }
}