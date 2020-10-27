<html lang="en">
<head>
    <title>客户管理</title>

    <#include "../common/header.ftl">
    <script type="text/javascript">

        //编辑
        $(function () {
            $(".inputBtn").click(function () {

                //弹出模态框
                $("#editModal").modal("show");
                //修改模态框标题
                $("#inputTitle").html("客户添加");
                //数据复原
                $("#editForm")[0].reset();

                //客户回显数据
                var data = $(this).data("json");
                if(data){
                    $("#inputTitle").html("客户编辑");
                    $("#editForm input[name='id']").val(data.id);
                    $("#editForm input[name='name']").val(data.name);
                    $("#editForm input[name='age']").val(data.age);
                    $("#editForm select[name='gender']").val(data.gender);
                    $("#editForm input[name='tel']").val(data.tel);
                    $("#editForm input[name='qq']").val(data.qq);
                    $("#editForm select[name='job.id']").val(data.job);
                    $("#editForm select[name='source.id']").val(data.source);
                }
            })
        })

        //提交编辑表单
        $(function () {
            $(".inputSubmit").click(function () {
                $("#editForm").ajaxSubmit(function (data) {
                    if(data.success){
                        window.location.reload();
                    }else{
                        $.messager.alert("温馨提示", data.msg)
                    }
                })
            })
        })


        //跟进
        $(function () {
            $(".traceBtn").click(function () {

                //弹出模态框
                $("#traceModal").modal("show");
                //数据复原
                $("#traceForm")[0].reset();

                //客户回显数据
                var data = $(this).data("json");
                if(data){
                    $("#traceForm input[name='customer.id']").val(data.id);
                    $("#traceForm input[name='name']").val(data.name);

                }
            })


            $(".traceSubmit").click(function () {
                $("#traceForm").ajaxSubmit(function (data) {
                    if(data.success){
                        window.location.reload();
                    }else{
                        $.messager.alert("温馨提示", data.msg)
                    }
                })
            })
        })
        //移交
        $(function () {
            $(".transferBtn").click(function () {

                //弹出模态框
                $("#transferModal").modal("show");
                //数据复原
                $("#transferForm")[0].reset();

                //客户回显数据
                var data = $(this).data("json");
                if(data){
                    $("#transferForm input[name='customer.id']").val(data.id);
                    $("#transferForm input[name='customer.name']").val(data.name);
                    $("#transferForm input[name='oldSeller.id']").val(data.seller);
                    $("#transferForm input[name='oldSeller.name']").val(data.sellerName);

                    console.log($("#transferForm input[name='oldSeller.name']"));
                }
            })


            $(".transferSubmit").click(function () {
                $("#transferForm").ajaxSubmit(function (data) {
                    if(data.success){
                        window.location.reload();
                    }else{
                        $.messager.alert("温馨提示", data.msg)
                    }
                })
            })
        })

        //改变状态
        $(function () {
            $(".statusBtn").click(function () {

                //弹出模态框
                $("#statusModal").modal("show");
                //数据复原
                $("#statusForm")[0].reset();

                //客户回显数据
                var data = $(this).data("json");
                if(data){
                    $("#statusForm input[name='cid']").val(data.id);
                    $("#statusForm input[name='name']").val(data.name);
                }
            })


            $(".statusSubmit").click(function () {
                $("#statusForm").ajaxSubmit(function (data) {
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
<#assign currentMenu="customer_potential">
<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">潜在客户管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/customer/potentialList.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="form-group">
                    <label for="keyword">关键字:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword" value="${(qo.keyword)!''}" placeholder="请输入姓名/电话">
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
                <a href="JavaScript:;" class="btn btn-success inputBtn"><span class="glyphicon glyphicon-plus"></span>  添加</a>
            </form>

            <table class="table table-striped table-hover" >
                <thead>
                <tr>
                    <th>编号</th>
                    <th>名称</th>
                    <th>电话</th>
                    <th>QQ</th>
                    <th>职业</th>
                    <th>来源</th>
                    <th>销售员</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                </thead>
               <#list result.list as entity>
                   <tr>
                       <td>${entity_index+1}</td>
                       <td>${entity.name}</td>
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
                       <td>
                           <a class="btn btn-info btn-xs inputBtn"  data-json='${entity.jsonData}'>
                               <span class="glyphicon glyphicon-pencil"></span>编辑
                           </a>

                           <a class="btn btn-primary btn-xs traceBtn"  data-json='${entity.jsonData}'>
                               <span class="glyphicon glyphicon-pencil"></span>跟进
                           </a>
                           <@shiro.hasRole name="Market_Manager">
                           <a class="btn btn-warning btn-xs transferBtn"  data-json='${entity.jsonData}'>
                               <span class="glyphicon glyphicon-pencil"></span>移交
                           </a>
                           </@shiro.hasRole>
                           <a class="btn btn-danger btn-xs statusBtn"  data-json='${entity.jsonData}'>
                               <span class="glyphicon glyphicon-pencil"></span>修改状态
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

<#--客户编辑模态框-->
<div class="modal fade" id="editModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title inputTitle">客户编辑</h4>
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
                        <label  class="col-sm-3 control-label">销售人员：</label>
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
                <button type="button" class="btn btn-primary inputSubmit" >保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal" >取消</button>
            </div>
        </div>
    </div>
</div>

<#--跟进历史-->
<div class="modal fade" id="traceModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">跟进</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/customerTraceHistory/saveOrUpdate.do" method="post" id="traceForm">
                    <#--新增,新增跟进历史没有ID,客户应该要有ID,不然就不知道当前是哪个客户的跟进历史-->
                    <input type="hidden" name="customer.id"/>
                    <div class="form-group" >
                        <label class="col-lg-4 control-label">客户姓名：</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" readonly name="name"/>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label class="col-lg-4 control-label">跟进时间：</label>
                        <div class="col-lg-6 ">
                            <input type="text" class="form-control "  name="traceTime" onfocus="WdatePicker()" placeholder="请输入跟进时间">
                        </div>
                    </div>
                    <div class="form-group" >
                        <label class="col-lg-4 control-label">跟进记录：</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="traceDetails"
                                   placeholder="请输入跟进记录"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">交流方式：</label>
                        <div class="col-lg-6">
                            <select class="form-control" name="traceType.id">
                                <#list ccts as c>
                                    <option value="${c.id}">${c.title}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">跟进结果：</label>
                        <div class="col-lg-6">
                            <select class="form-control" name="traceResult">
                                <option value="3">优</option>
                                <option value="2">中</option>
                                <option value="1">差</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" >
                        <label class="col-lg-4 control-label">备注：</label>
                        <div class="col-lg-6">
                            <textarea type="text" class="form-control" name="remark"></textarea>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary traceSubmit">保存</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
<#--移交模态框-->
<div id="transferModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">新增/编辑</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/customerTransfer/saveOrUpdate.do" method="post" id="transferForm" style="margin: -3px 118px">
                    <input type="hidden" name="id" id="customerTransferId"/>
                    <div class="form-group" >
                        <label for="name" class="col-sm-4 control-label">客户姓名：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  name="customer.name"   readonly >
                            <input type="hidden" class="form-control"  name="customer.id"  >
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="sn" class="col-sm-4 control-label">旧营销人员：</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  name="oldSeller.name" readonly >
                            <input type="hidden" class="form-control"    name="oldSeller.id"  >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sn" class="col-sm-4 control-label">新营销人员：</label>
                        <div class="col-sm-8">
                            <select name="newSeller.id" id="newSeller" class="form-control">
                                <#list sellers as e>
                                    <option value="${e.id}">${e.name}</option>
                                </#list>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="sn" class="col-sm-4 control-label">移交原因：</label>
                        <div class="col-sm-8">
                            <textarea type="text" class="form-control" id="reason" name="reason" cols="10" ></textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary transferSubmit" >保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<#--修改状态-->
<div class="modal fade" id="statusModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">修改客户状态</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/customer/updateStatus.do" method="post" id="statusForm">
                    <input type="hidden" name="cid"/>
                    <div class="form-group" >
                        <label class="col-lg-4 control-label">客户名称：</label>
                        <div class="col-lg-6">
                            <input type="text" class="form-control" name="name"
                                   readonly placeholder="请输入客户名称"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-4 control-label">客户状态：</label>
                        <div class="col-lg-6">
                            <select class="form-control" name="status">
                                <option value="0">潜在客户</option>
                                <option value="1">转正式客户</option>
                                <option value="2">移入客户池</option>
                                <option value="3">开发失败</option>
                                <option value="4">客户流失</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary statusSubmit">保存</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>