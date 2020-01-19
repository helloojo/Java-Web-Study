package spms.controls;

import java.util.Map;

import spms.annotation.Component;
import spms.bind.DataBinding;
import spms.dao.ProjectDao;
import spms.vo.Project;

@Component("/project/update.do")
public class ProjectUpdateController implements Controller, DataBinding {
  ProjectDao projectDao;

  public ProjectUpdateController setProjectDao(ProjectDao projectDao) {
    this.projectDao = projectDao;
    return this;
  }

  @Override
  public Object[] getDataBinders() {
    return new Object[] { "no", Integer.class, "project", spms.vo.Project.class };
  }

  @Override
  public String execute(Map<String, Object> model) throws Exception {
    Project project = (Project) model.get("project");
    Integer no = (Integer) model.get("no");
    if (project.getTitle() != null) {
      projectDao.update(project);
      return "redirect:list.do";
    } else {
      model.put("project", projectDao.selectOne(no));
      return "/project/ProjectUpdateForm.jsp";
    }
  }

}
