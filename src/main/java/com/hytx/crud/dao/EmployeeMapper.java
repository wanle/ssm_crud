package com.hytx.crud.dao;

import com.hytx.crud.bean.Employee;
import com.hytx.crud.bean.EmployeeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeMapper {
    long countByExample(EmployeeExample example);

    int deleteByExample(EmployeeExample example);

    int insert(Employee record);

    int insertSelective(Employee record);

    List<Employee> selectByExample(EmployeeExample example);
    
    List<Employee> selectByExampleWithDept(EmployeeExample example);
    	
    Employee selectByPrimayKyWithDept(EmployeeExample example);
    
    Employee selectByPrimaryKey(Integer empId);

    int updateByExampleSelective(@Param("record") Employee record, @Param("example") EmployeeExample example);

    int updateByExample(@Param("record") Employee record, @Param("example") EmployeeExample example);
    
    int updateByPrimaryKeySelective(Employee record);
    
    int deleteByPrimaryKey(Integer empId);
}