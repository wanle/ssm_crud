package com.hytx.crud.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hytx.crud.bean.Employee;
import com.hytx.crud.bean.Msg;
import com.hytx.crud.service.EmployeeService;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	/**
	 * 
	 * @Title:         delEmp   
	 * @Description:   删除员工   
	 * @param:         @return      
	 * @return:        Msg   
	 * @author:        wangle  
	 * @date:          2019年3月19日 下午9:03:27   
	 * @throws
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg delEmp(@PathVariable("ids") String ids){
		if(ids.contains("-")){
			List<Integer> list=new ArrayList<Integer>();
			String[] str=ids.split("-");
			for(String id:str){
			list.add(Integer.parseInt(id.trim()));	
			}
			employeeService.delAllEmp(list);
		}else{
			int empId = Integer.parseInt(ids);
			employeeService.delEmp(empId);
		}
		return Msg.sueess();
	}
	
	/**
	 * 
	 * @Title:         updateEmp   
	 * @Description:   更新员工信息  
	 * @param:         @return      
	 * @return:        Msg   
	 * @author:        wangle  
	 * @date:          2019年3月19日 下午8:30:10   
	 * @throws
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee emp){
		System.out.println(emp);
		int num = employeeService.updateEmp(emp);
		if(num!=0){
			return Msg.sueess();
		}
		return Msg.fail();
	}
	
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id){
	  Employee	employee=employeeService.getEmp(id);
		return Msg.sueess().add("employee", employee);
	}
	
	@RequestMapping(value="/checkUser",method=RequestMethod.POST)
	@ResponseBody
	public Msg checkUser(String empName){
		boolean b = employeeService.checkUser(empName);
		if(b){
			return Msg.sueess();	
		}
		return Msg.fail();
	}
	
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee emp,BindingResult result){
		if(result.hasErrors()){
			Map<String,Object> map=new HashMap<String,Object>();
			List<FieldError> errors = result.getFieldErrors();
			for(FieldError error:errors){
				map.put(error.getField(),error.getDefaultMessage());
			}
			return Msg.fail().add("fieldErrors", map);
		}
		int num=employeeService.saveEmp(emp);
		if(num!=0){
			return Msg.sueess();	
		}else{
			return Msg.fail();
		}	
	}
	
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn){
		PageHelper.startPage(pn,5);
		List<Employee> emps=employeeService.getAllEmps();
		//包装查询结果 后面5表示查询连续的页码
		PageInfo pageInfo=new PageInfo(emps,5);
		if(emps.size()>0){
			return Msg.sueess().add("pageInfo",pageInfo);
		}
		return Msg.fail();
	}
	
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model){
		//分页插件 页码和每页数量
		PageHelper.startPage(pn,8);
		List<Employee> emps=employeeService.getAllEmps();
		//包装查询结果 后面5表示查询连续的页码
		PageInfo pageInfo=new PageInfo(emps,5);
		model.addAttribute("pageInfo",pageInfo);
		return "list";
	}
}
