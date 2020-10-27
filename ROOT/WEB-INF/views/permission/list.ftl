<html lang="en">
<head>
    <title>权限管理</title>
    <#include "../common/header.ftl"/>
    <script>
        $(function () {
            $(".btn_reload").click(function () {
                var url = $(this).data("url");
                $.messager.confirm("温馨提示","加载权限会耗时，确定要操作么?",function () {
                    $.get(url,function (data) {
                        if(data.success){
                            //加载成功
                            $.messager.confirm("温馨提示","加载成功", function () {
                                window.location.reload();
                            })
                        }
                    });
                })
            })
        })
    </script>


</head>
<body>
<!--设置菜单回显-->
<#assign currentMenu='permission'>
<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">权限管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/permission/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage">
                <a href="javascript:;" data-url="/permission/reload.do" class="btn btn-success btn_reload">
                    <span class="glyphicon glyphicon-repeat"></span>  重新加载
                </a>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>权限名称</th>
                        <th>权限表达式</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <#list result.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td>${entity.name}</td>
                       <td>${entity.expression}</td>
                       <td>
                           <a href="javascript:;"data-url="/permission/delete.do?id=${entity.id}" class="btn btn-danger btn-xs btn_delete" >
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
</body>
</html>