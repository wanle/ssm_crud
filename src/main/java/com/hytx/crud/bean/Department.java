package com.hytx.crud.bean;
/**
 * 
 * @ClassName:     Department   
 * @Description:   部门类  
 * @author:        wangle
 * @date:          2019年3月31日 下午10:46:56
 */
public class Department {
    private Integer deptId;

    private String deptName;

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getDeptName() {
        return deptName;
    }

    public void setDeptName(String deptName) {
        this.deptName = deptName == null ? null : deptName.trim();
    }

	public Department(Integer deptId, String deptName) {
		this.deptId = deptId;
		this.deptName = deptName;
	}

	public Department() {
	
	}
     
}