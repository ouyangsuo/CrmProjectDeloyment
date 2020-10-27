<html lang="en">
<head>
    <title>客户管理</title>
    <#include "../common/header.ftl">
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="customer">

<div class="container" style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">客户管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/customer/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="form-group">
                    <label for="keyword">关键字:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword" value="${(qo.keyword)!''}" placeholder="请输入姓名/电话">
                </div>
                <div class="form-group">
                    <label for="status">状态:</label>
                    <select class="form-control" id="status" name="status">
                        <option value="-1">全部</option>
                        <option value="0">潜在客户</option>
                        <option value="1">正式客户</option>
                        <option value="2">资源池客户</option>
                        <option value="3">失败客户</option>
                        <option value="4">流失客户</option>
                    </select>
                    <script>
                        $("#status option[value='${qo.status}']").prop("selected", true);
                    </script>
                </div>

                <div class="form-group">
                    <label for="seller">市场专员:</label>
                    <select class="form-control" id="seller" name="sellerId">
                        <option value="-1">全部</option>

                        <#list sellers as e>
                        <option value="${e.id}">${e.name}</option>
                        </#list>
                    </select>
                    <script>
                        $("#seller option[value='${qo.sellerId}']").prop("selected", true);
                    </script>
                </div>
                <button id="btn_query" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span> 查询</button>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>名称</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>电话</th>
                        <th>QQ</th>
                        <th>职业</th>
                        <th>来源</th>
                        <th>市场专员</th>
                        <th>状态</th>
                    </tr>
                </thead>
               <#list result.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td>${entity.name}</td>
                       <td>${entity.gender}</td>
                       <td>${entity.age}</td>
                       <td>${entity.tel}</td>
                       <td>${entity.qq}</td>
                       <td>${(entity.job.title)!''}</td>
                       <td>${(entity.source.title)!''}</td>
                       <td>${(entity.seller.name)!''}</td>
                       <td>

                           <#if entity.status == 0 >
                                潜在客户
                               <#elseif entity.status == 1 >
                                正式客户
                               <#elseif entity.status == 2 >
                                资源池客户
                               <#elseif entity.status == 3 >
                                开发失败客户
                               <#elseif entity.status == 4 >
                                流失客户
                               <#else>
                           </#if>
                       </td>

                   </tr>
               </#list>
            </table>
            <#--分页-->
            <#include "../common/page.ftl"/>
        </div>
    </div>
</div>

<#--客户编辑模态框-->
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">客户编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/customer/saveOrUpdate.do" method="post" id="editForm">
                    <input type="hidden" value="" name="id">
                    <div class="form-group" >
                        <label  class="col-sm-3 control-label">客户名称：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="name"
                                   placeholder="请输入客户姓名"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">客户年龄：</label>
                        <div class="col-sm-6">
                            <input type="number" class="form-control" name="age"
                                   placeholder="请输入客户年龄"/>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label  class="col-sm-3 control-label">客户性别：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="gender">
                                <option value="1">男</option>
                                <option value="0">女</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">客户电话：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="tel"
                                   placeholder="请输入客户电话"/>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label  class="col-sm-3 control-label">客户QQ：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="qq"
                                   placeholder="请输入客户QQ"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">客户工作：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="job.id">
                                <#list jobs as j>
                                    <option value="${j.id}">${j.title}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">客户来源：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="source.id">
                                <#list sources as s>
                                    <option value="${s.id}">${s.title}</option>
                                </#list>
                            </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label  class="col-sm-3 control-label">销售专员：</label>
                        <div class="col-sm-6">
                            <select class="form-control" name="seller.id">
                               <#list sellers as e>
                                   <option value="${e.id}">${e.name}</option>
                               </#list>
                            </select>
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