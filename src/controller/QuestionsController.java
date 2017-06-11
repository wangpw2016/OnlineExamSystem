package controller;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import po.Pagination;
import po.Questions;
import po.QuestionsCustom;
import service.QuestionsService;

@Controller
public class QuestionsController {
	
	@Autowired
	private QuestionsService questionsService;
	
	@RequestMapping("/managerToQuestionsList.action")
	public String managerToQuestionsList(HttpServletRequest request) throws Exception{
		request.setAttribute("myurl", request.getContextPath()+"/jsp/managerQuestionsList.jsp");
		return "/managerIndex";
	}
	
	@RequestMapping("/managerGetQuestionsList.action")
	public @ResponseBody Map<String, Object> managerGetQuestionsList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<Questions> list= questionsService.getList();
		List<QuestionsCustom> list2= questionsService.getListByLimit(pagination);
		map.put("total", list.size());
		map.put("rows", list2);
		return map;
	}
	
	@RequestMapping("/managerDeleteQuestion.action")
	public String managerDeleteQuestion(Integer id) throws Exception{
		questionsService.deleteOneById(id);
		return "redirect:managerToQuestionsList.action";
	}
	
	@RequestMapping("/managerToAddQuestion.action")
	public String managerToAddQuestion(HttpServletRequest request) throws Exception{
		request.setAttribute("myurl", request.getContextPath()+"/jsp/managerAddQuestion.jsp");
		return "/managerIndex";
	}
	
	@RequestMapping("/managerAddQuestion.action")
	public String managerAddQuestion(Questions questions) throws Exception{
		questions.setCreatetime(new Timestamp(new Date().getTime()));
		questionsService.addOne(questions);
		return "redirect:managerToQuestionsList.action";
	}
	
	@RequestMapping("/managerToUpdateQuestions.action")
	public String managerToUpdateQuestions(String id,HttpServletRequest request) throws Exception{
		try {
			Integer id2=Integer.parseInt(id);
			request.setAttribute("myurl", request.getContextPath()+"/jsp/managerUpdateQuestion.jsp?id="+id2);
			return "/managerIndex";
		} catch (Exception e) {
			return "redirect:managerToQuestionsList.action";
		}
	}
	
	@RequestMapping("/managerGetQuestionInfo.action")
	public @ResponseBody Questions managerGetQuestionInfo(Integer id) throws Exception{
		return questionsService.getOneById(id);
	}
	
	@RequestMapping("/managerUpdateQuestion.action")
	public String managerUpdateQuestion(Questions questions) throws Exception{
		questionsService.updateOne(questions);
		return "redirect:managerToQuestionsList.action";
	}
}
