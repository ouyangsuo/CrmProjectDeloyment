<html lang="en">
<head>
    <title>数据字典单项管理</title>
    <#include "../common/header.ftl">
    <script type="text/javascript">
        //编辑
        $(function () {
            $(".btn_input_modal").click(function () {

                var pid = '${qo.parentId}';

                if(!pid || pid == -1){
                    $.messager.alert("温馨提示", "请先选中字典目录")
                    return ;
                }


                //弹出模态框
                $("#editModal").modal("show");
                //修改模态框标题
                $(".modal-title").html("数据字典明细添加");
                //数据复原
                $("#editForm")[0].reset();

                //数据字典回显数据
                var data = $(this).data("json");
                if(data){
                    $(".modal-title").html("数据字典明细编辑");
                    $("input[name='id']").val(data.id);
                    $("input[name='title']").val(data.title);
                    $("input[name='sequence']").val(data.sequence);
                }
            })
        })

        //提交编辑表单
        $(function () {
            $(".btn_submit").click(function () {
                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        $.messager.confirm("温馨提示", "操作成功", function () {
                            window.location.reload();
                        })
                    }else{
                        $.messager.alert("温馨提示", data.msg)
                    }
                })
            })
        })

        //字典目录点击
        $(function () {
            $(".dicDir").click(function () {
                var pid = $(this).data("pid");
                $("#parentId").val(pid);
                //表单提交
                $("#searchForm").submit();
            })
        })
    </script>
</head>
<body>
<!--左侧菜单回显变量设置-->
<#assign currentMenu="systemDictionaryItem">

<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">数据字典明细管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/systemDictionaryItem/list.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <input type="hidden" name="parentId" id="parentId" value="${(qo.parentId)!''}">
                <a href="JavaScript:;" class="btn btn-success btn_input_modal"><span class="glyphicon glyphicon-plus"></span> 添加明细</a>
            </form>


            <div class="row">
                <ul id="menu" class="list-group col-sm-3">
                    <li class="list-group-item">
                        <a href="#" data-toggle="collapse">
                            <span>字典目录 </span>
                        </a>
                        <ul class="in">
                            <#list dics as d>
                                <li><a class="dicDir" data-pid="${d.id}" href="javascript:;">${d.title}</a></li>
                            </#list>
                            <script>
                                $(".dicDir[data-pid='${qo.parentId}']").closest("li").addClass("active");
                            </script>
                        </ul>
                    </li>
                </ul>


                <div class="col-sm-9">
                    <table class="table table-striped table-hover table-bordered">
                        <thead>
                        <tr>
                            <th>编号</th>
                            <th>标题</th>
                            <th>序号</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                       <#list result.list as entity>
                           <tr>
                               <td>${entity_index+1}</td>
                               <td>${entity.title}</td>
                               <td>${entity.sequence!''}</td>
                               <td>
                                   <a class="btn btn-info btn-xs btn_input_modal" href="javascript:;" data-json='${entity.jsonData}'>
                                       <span class="glyphicon glyphicon-pencil"></span>编辑
                                   </a>
                                   <a href="javascript:;" class="btn btn-danger btn-xs btn_delete"
                                      data-url="/systemDictionaryItem/delete.do?id=${entity.id}">
                                       <span class="glyphicon glyphicon-trash"></span>删除
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
    </div>
</div>

<#--数据字典编辑模态框-->
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">数据字典编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/systemDictionaryItem/saveOrUpdate.do" method="post" id="editForm">
                    <input type="hidden" value="${(qo.parentId)!''}" name="parentId">
                    <input type="hidden" value="" name="id">
                    <div class="form-group" >
                        <label  class="col-sm-3 control-label">明细标题：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" name="title" value="" placeholder="请输入数据字典明细标题">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">明细序号：</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control"  name="sequence" value="" placeholder="请输入数据字典明细编号">
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