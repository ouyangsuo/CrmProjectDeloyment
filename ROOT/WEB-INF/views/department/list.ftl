<html lang="en">
<head>
    <title>部门管理</title>
    <#include "../common/header.ftl">
    <script type="text/javascript">
        //编辑
        $(function () {
            $(".btn_input_modal").click(function () {
                //弹出模态框
                $("#editModal").modal("show");
                //修改模态框标题
                $(".modal-title").html("部门添加");
                //数据复原
                $("#editForm")[0].reset();

                //部门回显数据
                var data = $(this).data("json");
                if(data){
                    $(".modal-title").html("部门编辑");
                    $("input[name='id']").val(data.id);
                    $("input[name='name']").val(data.name);
                    $("input[name='sn']").val(data.sn);
                }
            })
        })

        //提交编辑表单
        $(function () {
            $(".btn_submit").click(function () {
                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        window.location.reload();
                    }else{
                        $.messager.alert("温馨提示", data.msg)
                    }
                })
            })
        })
    </script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="department">

<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">部门管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/department/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <a href="JavaScript:;" class="btn btn-success btn_input_modal"><span class="glyphicon glyphicon-plus"></span>  添加</a>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>部门名称</th>
                        <th>部门编号</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list result.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td>${entity.name}</td>
                       <td>${entity.sn}</td>
                       <td>
                           <a class="btn btn-info btn-xs btn_input_modal" href="javascript:;" data-json='${entity.jsonData}'>
                               <span class="glyphicon glyphicon-pencil"></span> 编辑
                           </a>
                           <a href="javascript:;" class="btn btn-danger btn-xs btn_delete"
                              data-url="/department/delete.do?id=${entity.id}">
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

<#--部门编辑模态框-->
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span> </button>
                <h4 class="modal-title">部门编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/department/saveOrUpdate.do" method="post" id="editForm">
                    <input type="hidden" value="" name="id">
                    <div class="form-group" >
                        <label  class="col-sm-3 control-label">部门名称：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name" value="" placeholder="请输入部门名称">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">部门编号：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="sn" value="" placeholder="请输入部门编号">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary btn_submit" >保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
            </div>
        </div>
    </div>
</div>



</body>
</html>