<html lang="en">
<head>
    <title>客户报表</title>
    <#include "../common/header.ftl">
    <script type="text/javascript" src="/js/echarts/echarts-all.js"></script>
    <script type="text/javascript">
        $(function(){
            $("#editForm").ajaxForm(function (data) {
                if(data.success){
                    $.messager.confirm("提示","保存成功",function () {
                        window.location.reload();
                    })
                }else{
                    $.messager.alert(data.msg);
                }

            })

            $("#btn_query").click(function(){
                $("#currentPage").val(1);
                $("#searchForm").submit();
            });

            $(".addBtn").click(function () {
                $("#editForm")[0].reset();
                $("#customerId").val("");
                $("#departmentModal").modal('show');
            })
            $(".editBtn").click(function () {
                $("#editForm")[0].reset();
                var json = $(this).data("jsonstr");
                $("#departmentId").val(json.id);
                $("#sn").val(json.sn);
                $("#name").val(json.name);
                $("#departmentModal").modal('show');
            })

            $(".saveBtn").click(function () {
                $("#editForm").submit();
            })

            // 点击图表时打开视图窗口
            $(".chart_btn").click(function () {
                // 将序列化后的参数,拼接到url中
                var url = $(this).data("url") + "?" + $("#searchForm").serialize();
                var name = $(this).val();

                // 使用弹窗显示图表数据
                //modal初始化和打开之前清除页面内容和缓存数据
                $('#chartModal .modal-content').empty();
                $('#chartModal').removeData('bs.modal').modal({
                    remote: url
                });

            });
        });
    </script>
</head>
<body>
<!--设置菜单回显-->
<#assign currentMenu='customerReport'>
<div class="container " style="margin-top: 20px">
     <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
              <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">潜在客户报表</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/customerReport/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="form-group">
                    <label for="keyword">员工姓名:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword" value="${(qo.keyword)!""}" placeholder="请输入姓名">
                </div>
                <div class="form-group">
                    <label for="date">时间段查询:</label>
                    <input type="text" class="form-control " id="beginTime" name="beginTime" onclick="WdatePicker()" value="${(qo.beginTime?string('yyyy-MM-dd'))!""}">-
                    <input type="text" class="form-control " id="endTime" name="endTime" onclick="WdatePicker()" value="${(qo.endTime?string('yyyy-MM-dd'))!""}">
                </div>
                <div class="form-group">
                    <label for="status">分组类型:</label>
                    <select class="form-control" id="groupType" name="groupType">
                    <#assign  keys=groupTypes?keys/>
                        <#list keys as k>
                            <option value="${k}"
                                <#if k=='${qo.groupType}'>
                                    selected
                                </#if>
                            >${groupTypes[k]}</option>
                        </#list>
                    </select>
                </div>
                <div  style="margin-top: 10px">
                    <button id="btn_query" class="btn btn-primary">
                        <span class="glyphicon glyphicon-search"></span> 查询
                    </button>
                    <button type="button" class="btn btn-info chart_btn" data-url="/customerReport/chartByBar.do">
                        <span class="glyphicon glyphicon-stats"></span> 柱状图
                    </button>
                    <button type="button" class="btn btn-warning chart_btn"  data-url="/customerReport/chartByPie.do">
                        <span class="glyphicon glyphicon-dashboard"></span> 饼状图
                    </button>
                </div>
            </form>
            <table class="table table-striped table-hover" >
                <thead>
                    <tr>
                        <th>分组类型</th>
                        <th>潜在客户新增数</th>
                    </tr>
                </thead>
               <#list result.list as entity>
                   <tr>
                       <td>${entity.groupType}</td>
                       <td>${entity.customerNum}</td>
                   </tr>
               </#list>
            </table>
            <#include "../common/page.ftl">
        </div>
    </div>
</div>


<div id="chartModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">

        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</body>
</html>