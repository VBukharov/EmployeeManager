package ru.bukharov.employeemanager.web;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ru.bukharov.employeemanager.domain.*;
import ru.bukharov.employeemanager.service.*;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping("/index")
	public String listEmployers(Map<String, Object> map){
		map.put("employee", new Employee());
		map.put("employeeList", employeeService.listEmployee());
		
		return "employee";
	}
	
	@RequestMapping("/")
	public String home(){
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public String getEdit(@RequestParam(value = "id", required = true) Integer id, Model model){
		model.addAttribute("employee", employeeService.findEmployee(id));
		return "edit";
	}
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST)
	public String editedEmployee(@ModelAttribute("employee") Employee employee,
			@RequestParam(value = "id", required = true) Integer id, Model model){
		employee.setId(id);
		employeeService.changeEmployee(employee);
		model.addAttribute("id", id);
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String getFind(){
		return "find";
	}
	
	  @RequestMapping(value = "/find", method = RequestMethod.POST)	 
	  public String findEmployers(@RequestParam(required= false, defaultValue="" ) String firstName,
			  @RequestParam(required= false, defaultValue="" ) String secondName,
			  @RequestParam(required= false, defaultValue="" ) String lastName,
			  Model model)
	 
	  {
	   System.out.println(firstName);
	   List<Employee> list = employeeService.findEmployeeByName(firstName, secondName, lastName);
	   
	   model.addAttribute("employeeList", list);
	   
	   return "find";
	
	  }
	
	@RequestMapping("/delete/{employeeId}")
	public String deleteEmployee(@PathVariable("employeeId") Integer id){
		
		employeeService.removeEmployee(id);
		
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addEmployee(@ModelAttribute("employee") Employee employee, BindingResult result){
		employeeService.addEmployee(employee);
		return "redirect:/index";
	}
}

