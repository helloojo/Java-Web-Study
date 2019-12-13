package spms.controls;

import java.util.Map;

import javax.servlet.http.HttpSession;

import spms.bind.DataBinding;
import spms.dao.MemberDao;
import spms.vo.Member;

public class LoginController implements Controller, DataBinding {
  MemberDao memberDao;

  public LoginController setMemberDao(MemberDao memberDao) {
    this.memberDao = memberDao;
    return this;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Member member = (Member) model.get("member");
    if (member.getEmail() == null) {
      return "/auth/LoginForm.jsp";
    } else {
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

  @Override
  public Object[] getDataBinders() {
    return new Object[] { "member", spms.vo.Member.class };
  }
}
