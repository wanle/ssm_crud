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
<!--员工修改框 -->
<div class="modal fade" id="myModal_update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel__update">修改员工</h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal">
       	<div class="form-group">
   			 <label for="inputempName" class="col-sm-2 control-label">empName</label>
   			 <div class="col-sm-8">
     		 <input type="text"  name="empName" class="form-control" id="empName__update" placeholder="empName">
     		 <span id="helpBlock2" class="help-block"></span>
    		</div>
 		 </div>
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    		<div class="col-sm-8">
     	 	<input type="email" name="email" class="form-control" id="email__update" placeholder="Email">
     	 	 <span id="helpBlock2" class="help-block"></span>
    		</div>
 	 	</div>
 	 	<div class="form-group">
   			 <label for="inputempName" class="col-sm-2 control-label">department</label>
   			 <div class="col-sm-8">
     			 <select class="form-control" name="dId" id="dId__update">
				</select>
    		</div>
 		</div>
  		<div class="form-group">
    		<label for="inputgnder3" class="col-sm-2 control-label">gender</label>
     		<div class="col-sm-10">
   			 <label class="radio-inline">
  				<input type="radio" name="gender" id="inlineRadio1_update" value="0" checked="checked"> 男
			</label>
			<label class="radio-inline">
  				<input type="radio" name="gender" id="inlineRadio2_update" value="1">女
			</label>
  		</div>
  		
  </div>
  </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_update">更新</button>
      </div>
    </div>
  </div>
</div>


<!--员工添加框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">新增员工</h4>
      </div>
      <div class="modal-body">
       <form class="form-horizontal">
       	<div class="form-group">
   			 <label for="inputempName" class="col-sm-2 control-label">empName</label>
   			 <div class="col-sm-8">
     		 <input type="text"  name="empName" class="form-control" id="empName" placeholder="empName">
     		 <span id="helpBlock2" class="help-block"></span>
    		</div>
 		 </div>
  		<div class="form-group">
    		<label for="inputEmail3" class="col-sm-2 control-label">Email</label>
    		<div class="col-sm-8">
     	 	<input type="email" name="email" class="form-control" id="email" placeholder="Email">
     	 	 <span id="helpBlock2" class="help-block"></span>
    		</div>
 	 	</div>
 	 	<div class="form-group">
   			 <label for="inputempName" class="col-sm-2 control-label">department</label>
   			 <div class="col-sm-8">
     			 <select class="form-control" name="dId" id="dId">
				</select>
    		</div>
 		</div>
  		<div class="form-group">
    		<label for="inputgnder3" class="col-sm-2 control-label">gender</label>
     		<div class="col-sm-10">
   			 <label class="radio-inline">
  				<input type="radio" name="gender" id="inlineRadio1" value="0" checked="checked"> 男
			</label>
			<label class="radio-inline">
  				<input type="radio" name="gender" id="inlineRadio2" value="1">女
			</label>
  		</div>
  		
  </div>
 
</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save">保存</button>
      </div>
    </div>
  </div>
</div>

<div class="container">
<!-- 标题 -->
 <div class="row">
  <div class="col-md-12">
  
  <h1>SSM_CRUD</h1></div>
</div>
<!-- 按钮 -->
<div class="row">
  <div class="col-md-4 col-md-offset-9">
  	<input class="btn btn-primary" type="button" id="emp_add" value="新增">
  	<input class="btn btn-danger"  type="button" id="emp_allDel" value="删除">
  </div>
</div>
<!-- 明细 -->
<div class="row">
  <div class="col-md-12">
  	<table class="table table-hover" id="emps_table">
  		<thead>
  			<tr>
				<th><input type="checkbox" id="chcked_all"/></th><th> 序号</th><th>姓名</th><th>性别</th><th>邮箱</th><th>部门名称</th><th>操作</th>
			</tr>
		</thead>
		<tbody>
			
		</tbody>
	</table>
  </div>
</div>
<!-- 页脚 -->
<div class="row">
  <div class="col-md-6" id="page_info_area"></div>
  <div class="col-md-5 col-md-offset-7">
  	<nav aria-label="Page navigation" id="program_bar">
  </nav>
  </div>
</div>
</div>
</body>
<script type="text/javascript">
	var pageTptal;
	var curryPage;
	$(function(){
		to_pages(1);
	});
	
		function to_pages(pn){
			$.ajax({
				url:"${APP_APTH}/emps",
				data:"pn="+pn,
				type:"GET",
				success:function(data){
					//处理列表数据
					bind_emps_table(data);
					//显示分页信息
					bind_emps_area(data);
					//分页条
					bind_emps_progress(data);
				}
			});
		}
	//处理列表数据
	function bind_emps_table (data){
		$("#emps_table tbody").empty();
		var emps=data.entend.pageInfo.list;
		$.each(emps,function(index,item){
			var check=$("<td></td>").append($("<input type='checkbox'/>").addClass("check_item"));
			if(data.entend.pageInfo.pageNum!=1){
				var empNum=$("<td></td>").append(((data.entend.pageInfo.pageNum-1)*5)+index+1);
			}else{
				var empNum=$("<td></td>").append(index+1);
			}
			var empName=$("<td></td>").append(item.empName);
			var empGender=$("<td></td>").append(item.gender=='0'?'男':'女');
			var empEmail=$("<td></td>").append(item.email);
			var deptName=$("<td></td>").append(item.department.deptName);
			var editBtn=$("<button></button>").addClass("btn btn-primary edit_btn").text("编辑").append($("<span></span>").addClass("glyphicon glyphicon-pencil"));
				editBtn.attr("edit-id",item.empId);
			var deltBtn=$("<button></button>").addClass("btn btn-danger del_btn").text("删除").append($("<span></span>").addClass("glyphicon glyphicon-remove"));
				deltBtn.attr("del-id",item.empId);
			var caoZuo=$("<td></td>").append(editBtn).append(" ").append(deltBtn)
			$("<tr></tr>").append(check).append(empNum).append(empName).append(empGender)
			.append(empEmail).append(deptName).append(caoZuo).appendTo("#emps_table tbody")
		})
	}
	//显示分页信息
	function bind_emps_area(result){
		$("#page_info_area").empty();
		var item=result.entend.pageInfo;
		$("#page_info_area").text("当前第"+item.pageNum+"页,共"+item.pages+"页,共"+item.total+"条数据");
		pageTptal=item.total;
		curryPage=item.pageNum;
	}
	
	//分页条
	function bind_emps_progress(result){
		$("#program_bar").empty();
		var ulBar=$("<ul></ul>").addClass("pagination");
		if(!result.entend.pageInfo.isFirstPage){
			var firstPages=$("<li></li>").append($("<a></a>").text("首页"));
			var prePages=$("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;")));
			firstPages.click(function(){
				 to_pages(1)
			});
			prePages.click(function(){
				 to_pages(result.entend.pageInfo.pageNum-1)
			});
			ulBar.append(firstPages).append(prePages);
		}

		$.each(result.entend.pageInfo.navigatepageNums,function(index,item){
			var itemul=$("<li></li>").append($("<a></a>").text(item));
			if(result.entend.pageInfo.pageNum==item){
				itemul.addClass("active");
				
			}
			 itemul.click(function(){
				 to_pages(item);
			})
			ulBar.append(itemul);
		})
		
		if(!result.entend.pageInfo.isLastPage){
			var nextPages=$("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;")));
			var lastPages=$("<li></li>").append($("<a></a>").text("末页"));
			lastPages.click(function(){
				 to_pages(result.entend.pageInfo.pages)
			});
			nextPages.click(function(){
				 to_pages(result.entend.pageInfo.pageNum+1)
			});
			ulBar.append(nextPages).append(lastPages);
		}
		$("#program_bar").append(ulBar);
	}
	$("#emp_add").click(function(){
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		reset_form("#myModal form");
		getDepts("#dId");
		$("#myModal").modal({
			backdrop:"static"
		});
	})
	
	//清空表单样式及内容
		function reset_form(ele){
			$(ele)[0].reset();
			//清空表单样式
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
	
	function getDepts(ele){
		$(ele).empty();
		$.ajax({
			url:"${APP_APTH}/depts",
			type:"GET",
			success:function(data){
				var depts=data.entend.list;
				 $.each(depts,function(index,item){
					var didItem=$("<option></option>").val(item.deptId).text(item.deptName);
					$(ele).append(didItem);
				});
			}
		});
	}
	//保存数据
	$("#emp_save").click(function(){
		//校验数据合法性
		/* if(!validate_emp()){
			return false;
		}; */
		//校验用户名是否重复
		if($(this).attr("ajax-va")== "error"){
			return false;
		}
		 $.ajax({
			url:"${APP_APTH}/emp",
			data:$("#myModal form").serialize(),
			type:"POST",
			success:function(data){
				if(data.code==200){
					$('#myModal').modal('hide');
					to_pages(pageTptal);
				}else{
					if(undefined!=data.entend.fieldErrors.empName){
						show_validate_msg("#empName","error","用户名格式错误!")
					}
					if(undefined!=data.entend.fieldErrors.email){
						show_validate_msg("#email","error","邮箱格式错误!")	
					}
				}
			}
		});
	})
	function validate_emp(){
		var empName=$("#empName").val();
		var empNameReg=/^[a-z0-9_-]{8,16}$|^[\u2E80-\u9FFF]{2,5}/;
		if(!empNameReg.test(empName)){
			show_validate_msg("#empName","error","用户名格式错误")
			return false;
		}else{
			show_validate_msg("#empName","success","")
		}
		var empEmail=$("#email").val();
		var empEmailReg=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!empEmailReg.test(empEmail)){
			show_validate_msg("#email","error","邮箱格式错误")
			return false;
		}else{
			show_validate_msg("#email","success","")
		}
		return true;
	}
	
	//显示校验结果的提示信息
	function show_validate_msg(ele,status,msg){
		//清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("span").text("");
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}else if("error" == status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	//效验用户名是否重复
	$("#empName").change(function(){
		var empName=$("#empName").val();
		$.ajax({
			url:"${APP_APTH}/checkUser",
			data:"empName="+empName,
			type:"POST",
			success:function(data){
				console.log(data);
				if(data.code==200){
					show_validate_msg("#empName","success","");
					$("#emp_save").attr("ajax-va","success")
				}else{
					show_validate_msg("#empName","error","用户名已经被占用");
					$("#emp_save").attr("ajax-va","error")
				}
			}
		});
	});
	//点击编辑弹出模态框,第一个元素选择document可以给后面添加的元素添加事件
	$(document).on("click",".edit_btn",function(){
		//清除表单数据（表单完整重置（表单的数据，表单的样式））
		reset_form("#myModal_update form");
		getDepts("#dId__update");
		$("#myModal_update").modal({
			backdrop:"static"
		});
		var id=$(this).attr("edit-id");
		$("#emp_update").attr("edit-data",id);
		$.ajax({
			url:"${APP_APTH}/emp/"+id,
			type:"GET",
			success:function(data){
				var emp=data.entend.employee;
				$("#empName__update").val(emp.empName);
				$("#email__update").val(emp.email);
				$("#myModal_update input[name=gender]").val([emp.gender]);
				$("#myModal_update select").val([emp.dId]);
			}
		});
	})
	$("#emp_update").click(function(){
		var empEmail=$("#email__update").val();
		var empEmailReg=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		if(!empEmailReg.test(empEmail)){
			show_validate_msg("#email__update","error","邮箱格式错误")
			return false;
		}else{
			show_validate_msg("#email__update","success","")
		}
		var id=$(this).attr("edit-data");
		$.ajax({
			url:"${APP_APTH}/emp/"+id,
			data:$("#myModal_update form").serialize(),
			type:"PUT",
			success:function(data){
				$("#myModal_update").modal('hide');
				to_pages(1);
			}
		})
	});
	//单个删除
	$(document).on("click",".del_btn",function(){
		var name=$(this).parents("tr").find("td:eq(2)").text();
		var empId=$(this).attr("del-id");
		if(confirm("你确定要删除"+name+"的员工吗？")){
			$.ajax({
				url:"${APP_APTH}/emp/"+empId,
				type:"DELETE",
				success:function(data){
					$("#myModal_update").modal('hide');
					to_pages(curryPage);
				}
			})
		}
	});
	
	//点击全选
	$("#chcked_all").click(function(){
		$(".check_item").prop("checked",$(this).prop("checked"));
	});
	
	//单个全部选中的时候默认选中全选
	$(document).on("click",".check_item",function(){
		var flag=$(".check_item:checked").length==$(".check_item").length;
			$("#chcked_all").prop("checked",flag);
	});
	
	//全选删除
	$("#emp_allDel").click(function(){
		var empName="";
		var empId="";
			$.each($(".check_item:checked"),function(){
				empName+=$(this).parents("tr").find("td:eq(2)").text()+",";
				empId+=$(this).parents("tr").find("td:eq(6) button:eq(0)").attr("edit-id")+"-";
			})
			empName=empName.substring(0,empName.length-1);
			empId=empId.substring(0,empId.length-1);
			if(confirm("您确定要删除"+empName+"员工吗")){
				$.ajax({
					url:"${APP_APTH}/emp/"+empId,
					type:"DELETE",
					success:function(data){
						console.log(data);
						to_pages(curryPage);
						$("#chcked_all").prop("checked",false);
					}
				})
			}
	})
	
</script>
</html>