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

import exception.CustomException;
import po.Manager;
import po.Pagination;
import service.ManagerService;

@Controller
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	
	@RequestMapping("/managerLogin.action")
	public String managerLogin(Manager manager,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		List<Manager> list = managerService.checkManager(manager);
		if(list.size() >0) {
			Manager manager2 = list.get(0);
			session.setAttribute("managerName", manager2.getName());
			session.setAttribute("managerAuthority", manager2.getAuthority());
			return "redirect:/jsp/managerIndex.jsp";
		}else {
			request.setAttribute("message", "对不起，帐号或密码错误！");
			return "/managerLogin";
		}
	}
	
	@RequestMapping("/managerLogout.action")
	public String managerLogout(HttpSession session) throws Exception{
		session.invalidate();
		return "/managerLogin";
	}
	
	@RequestMapping("/managerToList.action")
	public String managerToList(HttpServletRequest request) throws Exception{
		request.setAttribute("myurl", request.getContextPath()+"/jsp/managerList.jsp");
		return "/managerIndex";
	}
	
	@RequestMapping("/managerGetList.action")
	public @ResponseBody Map<String, Object> managerGetList(Pagination pagination) throws Exception{
		Map<String, Object> map=new HashMap<String, Object>();
		List<Manager> list = managerService.getList();
		List<Manager> list2 = managerService.getListByLimit(pagination);
		int total = list.size();
		map.put("rows", list2);
		map.put("total", total);
		return map;
	}
	
	@RequestMapping("/managerToAdd.action")
	public String managerToAdd(HttpServletRequest request) throws Exception{
		request.setAttribute("myurl", request.getContextPath()+"/jsp/managerAdd.jsp");
		return "/managerIndex";
	}
	
	@RequestMapping("/managerAdd.action")
	public String managerAdd(Manager manager) throws Exception{
		managerService.addOne(manager);
		return "redirect:managerToList.action";
	}
	
	@RequestMapping("/managerDelete.action")
	public String managerDelete(Integer id) throws Exception{
		managerService.deleteOne(id);
		return "redirect:managerToList.action";
	}
	
	@RequestMapping("/managerToUpate.action")
	public String managerToUpate(String id,HttpServletRequest request) throws Exception{
		try {
			Integer id2=Integer.parseInt(id);
			request.setAttribute("myurl", request.getContextPath()+"/jsp/managerUpdate.jsp?managerId="+id2);
			return "/managerIndex";
		} catch (Exception e) {
			return "redirect:managerToList.action";
		}
	}
	
	@RequestMapping("/managerGetUpdateInfo.action")
	public @ResponseBody Manager managerGetUpdateInfo(Integer id) throws Exception{
		Manager manager = managerService.findOneById(id);
		return manager;
	}
	
	@RequestMapping("/managerUpdate.action")
	public String managerUpdate(Manager manager) throws Exception{
		managerService.updateOne(manager);
		return "redirect:managerToList.action";
	}
}
