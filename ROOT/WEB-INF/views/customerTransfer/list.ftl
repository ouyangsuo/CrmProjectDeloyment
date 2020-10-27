<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <#include "../common/header.ftl">
</head>
<body>

<!--左侧菜单回显变量设置-->
<#assign currentMenu="customerTransfer">

<div class="container " style="margin-top: 20px">
     <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
              <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">移交历史管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/customerTransfer/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage" >
                <div class="form-group">
                    <label for="keyword">关键字:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword" value="${(qo.keyword)!""}" placeholder="请输入姓名或电话">
                </div>
                <div class="form-group">
                </div>
                <button id="btn_query" class="btn btn-default">查询</button>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>编号</th>
                        <th>客户姓名</th>
                        <th>操作日期</th>
                        <th>操作人</th>
                        <th>旧营销人员</th>
                        <th>新营销人员</th>
                        <th>移交原因</th>
                    </tr>
                </thead>
               <#list result.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td>${entity.customer.name}</td>
                       <td>${entity.operateTime?string('yyyy-MM-dd HH:mm:ss')}</td>
                       <td>${entity.operator.name}</td>
                       <td>${entity.oldSeller.name}</td>
                       <td>${entity.newSeller.name}</td>
                       <td>${entity.reason}</td>
                   </tr>
               </#list>
            </table>
            <#include "../common/page.ftl">
        </div>
    </div>
</div>

</body>
</html>