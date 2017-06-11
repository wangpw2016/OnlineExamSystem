package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import po.Pagination;
import po.QueryResult;
import po.Student;
import po.Studentresult;
import po.StudentresultCustom;
import service.ResultService;
import service.StudentService;

@Controller
public class ResultController {
	@Autowired
	private ResultService resultService;
	
	@Autowired
	private StudentService studentService;

	@RequestMapping("/managerToQueryResult.action")
	public String managerToQueryResult(HttpServletRequest request) throws Exception{
		request.setAttribute("myurl", request.getContextPath()+"/jsp/managerQueryResult.jsp");
		return "/managerIndex";
	}
	
	@RequestMapping("/managerGetQueryResult.action")
	public @ResponseBody Map<String, Object> managerGetQueryResult(Pagination pagination,QueryResult queryResult) throws Exception{
		Map<String,Object> map=new HashMap<String,Object>();
		List<Studentresult> list=resultService.getList();
		List<StudentresultCustom> list2=resultService.getListByLimit(pagination,queryResult);
		map.put("rows", list2);
		map.put("total", list.size());
		return map;
	}
	
	@RequestMapping("/queryResult.action")
	public ModelAndView queryResult(HttpSession session) throws Exception{
		String studentName = (String) session.getAttribute("studentName");
		Student student = studentService.findOne(studentName);
		List<StudentresultCustom> list = resultService.getListByStudentId(student.getId());
		for (StudentresultCustom studentresultCustom : list) {
			studentresultCustom.getCreatetime();
		}
		
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("/examResultAll");
		modelAndView.addObject("resultList", list);
		return modelAndView;
	}
}
