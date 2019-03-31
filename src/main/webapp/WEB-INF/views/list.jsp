<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<%  
	pageContext.setAttribute("APP_APTH",request.getContextPath());
%>
<link href="${APP_APTH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_APTH}/static/js/jquery-1.12.4.min.js"></script>
<script src="${APP_APTH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
<!-- 标题 -->
 <div class="row">
  <div class="col-md-12">
  
  <h1>SSM_CRUD</h1></div>
</div>
<!-- 按钮 -->
<div class="row">
  <div class="col-md-4 col-md-offset-9">
  	<input class="btn btn-primary" type="button" value="新增">
  	<input class="btn btn-danger"  type="button" value="删除">
  </div>
</div>
<!-- 明细 -->
<div class="row">
  <div class="col-md-12">
  	<table class="table table-hover">
  		<thead>
  			<tr>
				<th> 序号</th><th>姓名</th><th>性别</th><th>邮箱</th><th>部门名称</th><th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pageInfo.list}" var="emp" >
				<% int i=1;%>
				<tr>
				<td><%= i%></td>
				<td>${emp.empName}</td>
				<td>${emp.gender}</td>
				<td>${emp.email}</td>
				<td>${emp.department.deptName}</td>
				<td>
					<button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>编辑</button>
  					<button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除</button>
  				</td>
				</tr>
			<% i++; %>
			</c:forEach>
		</tbody>
	</table>
  </div>
</div>
<!-- 页脚 -->
<div class="row">
  <div class="col-md-6">当前第${pageInfo.pageNum}页,共${pageInfo.pages}页,共${pageInfo.total}条数据</div>
  <div class="col-md-5 col-md-offset-7">
  	<nav aria-label="Page navigation">
 	 <ul class="pagination">
 	 	<c:if test="${pageInfo.pageNum!=1}">
 	 		<li><a href="${APP_APTH}/emps?pn=1">首页</a></li>
 	 		<li>
      			<a href="${APP_APTH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
       			 <span aria-hidden="true">&laquo;</span>
      			</a>
    		</li>
 	 	</c:if>
    	
    	<c:forEach items="${pageInfo.navigatepageNums}" var="nums">
    		<c:if test="${pageInfo.pageNum==nums}">
    			<li class="active"><a href="${APP_APTH}/emps?pn=${nums}">${nums}</a></li>
    		</c:if>
    		<c:if test="${pageInfo.pageNum != nums}">
    			<li><a href="${APP_APTH}/emps?pn=${nums}">${nums}</a></li>
    		</c:if>
    		
    	</c:forEach>
   		
      	<c:if test="${pageInfo.pageNum!=pageInfo.pages}">
      		<li>
      			<a href="${APP_APTH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
        		<span aria-hidden="true">&raquo;</span>
      			</a>
      		</li>
      		<li><a href="${APP_APTH}/emps?pn=${pageInfo.pages}">末页</a></li>	
      	</c:if>
       
  </ul>
</nav>
</div>
</div>
</div>
</body>
</html>