package com.hytx.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hytx.crud.bean.Employee;
import com.hytx.crud.bean.EmployeeExample;
import com.hytx.crud.bean.EmployeeExample.Criteria;
import com.hytx.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	public List<Employee> getAllEmps() {
		return employeeMapper.selectByExampleWithDept(null);
	}

	public int saveEmp(Employee emp) {
		// TODO Auto-generated method stub
		return employeeMapper.insertSelective(emp);
	}

	public boolean checkUser(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria  criteria =example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long count=employeeMapper.countByExample(example);
		return count==0;
	}

	public Employee getEmp(Integer id) {
		// TODO Auto-generated method stub
		Employee employee = employeeMapper.selectByPrimaryKey(id);
		return employee;
	}

	public int updateEmp(Employee emp) {
		// TODO Auto-generated method stub
		int num=employeeMapper.updateByPrimaryKeySelective(emp);
		return num;
	}

	public void delEmp(Integer empId) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(empId);
	}

	public void delAllEmp(List<Integer> list) {
		// TODO Auto-generated method stub
		EmployeeExample example=new EmployeeExample();
		Criteria c=example.createCriteria();
		c.andEmpIdIn(list);
		employeeMapper.deleteByExample(example);
	}

}
