package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Lesson;
import po.Pagination;
import service.LessonService;

@Controller
public class LessonController {
	@Autowired
	private LessonService lessonService;
	
	@RequestMapping("/managerToLessonList.action")
	public String managerToLessonList(HttpServletRequest request) throws Exception{
		request.setAttribute("myurl", request.getContextPath()+"/jsp/managerLessonList.jsp");
		return "/managerIndex";
	}
	
	@RequestMapping("/managerGetLessonList.action")
	public @ResponseBody Map<String, Object> managerGetLessonList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<Lesson> list=lessonService.getList();
		List<Lesson> list2=lessonService.getListByLimit(pagination);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	
	@RequestMapping("/managerDeleteLesson.action")
	public String managerDeleteLesson(Integer id) throws Exception{
		lessonService.deleteOneById(id);
		return "redirect:managerToLessonList.action";
	}
	
	@RequestMapping("/managerToAddLesson.action")
	public String managerToAddLesson(HttpServletRequest request) throws Exception{
		request.setAttribute("myurl", request.getContextPath()+"/jsp/managerAddLesson.jsp");
		return "/managerIndex";
	}
	
	@RequestMapping("/managerAddLesson.action")
	public String managerAddLesson(Lesson lesson) throws Exception{
		lesson.setCreatetime(new Date());
		lessonService.addOne(lesson);
		return "redirect:managerToLessonList.action";
	}
	
	@RequestMapping("/managerGetLessons.action")
	public @ResponseBody List<Lesson> managerGetLessons() throws Exception{
		return lessonService.getList();
	}
	
	@RequestMapping("/getLessonList.action")
	public @ResponseBody List<Lesson> getLessonList() throws Exception{
		return lessonService.getList();
	}
}
