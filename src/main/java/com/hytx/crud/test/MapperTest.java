package com.hytx.crud.test;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hytx.crud.bean.Employee;
import com.hytx.crud.dao.DepartmentMapper;
import com.hytx.crud.dao.EmployeeMapper;



/**
 * 测试dao
 * @author Administrator
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper deptMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession  sqlSession;
	
	@Test
	public void testDept(){
		//原始方法
		/*ApplicationContext ioc=new ClassPathXmlApplicationContext("applicationContext.xml");
		
		Department department=ioc.getBean(Department.class);*/
		System.out.println(deptMapper);
		/*	Department department = new Department(1001,"开发部");
			Department department1 = new Department(1002,"测试部");
		deptMapper.insertSelective(department);
		deptMapper.insertSelective(department1);*/
		//Integer empId, String empName, String gender, String email, Integer dId
	/*	employeeMapper.insertSelective(new Employee(null,"张三","1","zhangsan@qq.com",1001));
		employeeMapper.insertSelective(new Employee(null,"Tom","1","Tom@qq.com",1002));
		employeeMapper.insertSelective(new Employee(null,"Tom","2","jeff@qq.com",1001));*/
		//批量插入数据
		/*EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		String [] arr={"a","b","c","d","e","f","g","h","j","j","l","M","P","T","W"};
		String [] arr1={"0","1"};
		for(int i=0;i<1000;i++){
			Random random = new Random();
			int s = random.nextInt(15)%(16);
			int k = random.nextInt(15)%(16);
			int m = random.nextInt(15)%(16);
			int n = random.nextInt(15)%(16);
			int j = random.nextInt(1)%(2);
			String str=arr[s]+arr[k]+arr[m]+arr[n];
			if(i%2==0){
				mapper.insert(new Employee(null,str,arr1[j],"jeff@qq.com",1001));
			}else{
				mapper.insert(new Employee(null,str,arr1[j],"jeff@qq.com",1002));
			}
			
		}
		System.out.println("批量完成");*/
	}
}
