<html lang="en">
<head>
    <title>员工管理</title>
    <#include "../common/header.ftl"/>
    <script type="text/javascript">
        //批量删除
        $(function () {
            $(".btn_batchDelete").click(function () {
                //1:提示是否选择
                if ($(".cb:checked").size() <= 0) {
                    alertMessage("请选择要删除数据")
                    return;
                }
                var url = $(this).data("url");
                //2：提示是否确定要删除
                $.messager.confirm("温馨提示","你确定要删除选中数据么?", function () {
                    //获取选中数据id
                    var ids = $.map($(".cb:checked"), function (item) {
                        return $(item).data("id");
                    })
                    //删除
                    $.post(url, {ids:ids}, function (data) {
                        if(data.success){
                            //删除成功
                            $.messager.confirm("温馨提示","删除成功", function () {
                                window.location.reload();
                            })
                        }else{
                            //删除失败
                            $.messager.alert("温馨提示",data.msg)
                        }
                    });
                })
            })
        })
        $(function () {
            //导入
            $(".btn_import").click(function () {
               $("#editModal").modal("show");
            })
            //模态框提交：导入
            $(".btn_save").click(function () {
                $("#editForm").submit();
            })
        })
    </script>
</head>
<body>
<!--设置菜单回显-->
<#assign currentMenu = 'employee'>
<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
             <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">员工管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/employee/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage">
                <div class="form-group">
                    <label for="keyword">关键字:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword" value="${(qo.keyword)!''}" placeholder="请输入姓名/邮箱">
                </div>
                <div class="form-group">
                    <label for="dept">部门:</label>
                    <select class="form-control" id="dept" name="deptId">
                        <option value="-1">全部</option>
                        <#list depts as d>
                            <option value="${d.id}">${d.name}</option>
                        </#list>
                    </select>
                    <script>
                        $("#dept option[value='${qo.deptId}']").prop("selected", true);
                    </script>
                </div>
                <button id="btn_query" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span>  查询</button>
                <a href="javascript:;" class="btn btn-success btn_redirect" data-url="/employee/input.do">
                    <span class="glyphicon glyphicon-plus"></span> 添加
                </a>
                <a href="javascript:;" class="btn btn-danger btn_batchDelete" data-url="/employee/batchDelete.do">
                    <span class="glyphicon glyphicon-trash"></span> 批量删除
                </a>

               <@shiro.hasPermission name="employee:exportXls">
                    <a href="/employee/exportXls.do" target="_blank" class="btn btn-warning" >
                        <span class="glyphicon glyphicon-export"></span>  导出
                    </a>
               </@shiro.hasPermission>

                 <@shiro.hasPermission name="employee:importXls">
                <a href="javascript:;" class="btn btn-warning btn_import">
                    <span class="glyphicon glyphicon-import"></span>  导入
                </a>
                 </@shiro.hasPermission>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th><input type="checkbox"></th>
                        <th>编号</th>
                        <th>名称</th>
                        <th>email</th>
                        <th>年龄</th>
                        <th>部门</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list result.list as entity>
                   <tr>
                       <td><input type="checkbox" class="cb" data-id="${entity.id}"></td>
                       <td>${entity_index+1}</td>
                       <td>${entity.name}</td>
                       <td>${entity.email}</td>
                       <td>${entity.age}</td>
                       <td>${(entity.dept.name)!''}</td>
                       <td>
                           <a class="btn btn-info btn-xs btn_redirect" href="javascript:;"
                            data-url="/employee/input.do?id=${entity.id}">
                               <span class="glyphicon glyphicon-pencil"></span> 编辑
                           </a>
                           <a href="JavaScript:;" class="btn btn-danger btn-xs btn_delete" data-url="/employee/delete.do?id=${entity.id}">
                               <span class="glyphicon glyphicon-trash"></span> 删除
                           </a>
                       </td>
                   </tr>
                   </#list>
            </table>
            <#--分页-->
            <#include "../common/page.ftl"/>
        </div>
    </div>
</div>


<#--导入模态框-->
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                <h4 class="modal-title">员工导入</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/employee/importXls.do" method="post" id="editForm" enctype="multipart/form-data">
                    <div class="form-group" >
                        <div class="col-sm-6">
                            <input type="file"  name="file"><br/>
                            <a href="/template/employee_import.xls" class="btn btn-success" >
                                <span class="glyphicon glyphicon-download-alt"></span>  下载模板
                            </a>
                        </div>

                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary btn_save">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>