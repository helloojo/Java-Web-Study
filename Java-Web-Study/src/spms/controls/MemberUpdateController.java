package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.MemberDao;
import spms.vo.Member;

@Component("/member/update.do")
public class MemberUpdateController implements Controller, DataBinding {
  MemberDao memberDao;

  public MemberUpdateController setMemberDao(MemberDao memberDao) {
    this.memberDao = memberDao;
    return this;
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Member member = (Member) model.get("member");
    Integer no = (Integer) model.remove("no");
    if (member.getEmail() == null) {
      model.put("member", memberDao.selectOne(no));
      return "/member/MemberUpdateForm.jsp";
    } else {
      memberDao.update(member);
      return "redirect:list.do";
    }
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] { "member", spms.vo.Member.class, "no", Integer.class };
  }
}
