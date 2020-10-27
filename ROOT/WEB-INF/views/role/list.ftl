<html lang="en">
<head>
    <title>角色管理</title>
    <#include "../common/header.ftl"/>
</head>
<body>
<!--设置菜单回显-->
<#assign currentMenu='role'>
<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">角色管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/role/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage">
                <a href="javascript:;" data-url="/role/input.do" class="btn btn-success btn_redirect">
                    <span class="glyphicon glyphicon-plus"></span>  添加</a>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>角色名称</th>
                        <th>角色编号</th>
                        <th>操作</th>
                    </tr>
                </thead>
               <#list result.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td>${entity.name}</td>
                       <td>${entity.sn}</td>
                       <td>
                           <a class="btn btn-info btn-xs btn_redirect" href="javascript:;" data-url="/role/input.do?id=${entity.id}">
                               <span class="glyphicon glyphicon-pencil"></span> 编辑
                           </a>
                           <a href="javascript:;" data-url="/role/delete.do?id=${entity.id}" class="btn btn-danger btn-xs btn_delete" >
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