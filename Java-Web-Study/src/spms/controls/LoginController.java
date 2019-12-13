package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import spms.dao.MemberDao;
import spms.vo.Member;

public class LoginController implements Controller {
  @Override
  public String execute(Map<String, Object> model) throws Exception {
    if (model.get("member") == null) {
      return "/auth/LoginForm.jsp";
    } else {
      MemberDao memberDao = (MemberDao) model.get("memberDao");
      Member member = (Member) model.get("member");
      Member login = memberDao.exist(member.getEmail(), member.getPassword());
      if (login == null) {
        return "/auth/LoginFail.jsp";
      } else {
        HttpSession session = (HttpSession) model.get("session");
        session.setAttribute("member", login);
        return "redirect:../member/list.do";
      }
    }
  }
}
