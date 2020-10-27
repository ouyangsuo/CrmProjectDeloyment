<html lang="en">
<head>
    <title>客户池管理</title>
    <#include "../common/header.ftl">
    <script>
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

        //吸纳
        $(function () {
            $(".absorbBtn").click(function () {

                //弹出模态框
                $("#absorbModal").modal("show");
                //数据复原
                $("#absorbForm")[0].reset();

                //客户回显数据
                var data = $(this).data("json");
                if(data){
                    $("#absorbForm input[name='customer.id']").val(data.id);
                    $("#absorbForm input[name='customer.name']").val(data.name);
                    $("#absorbForm input[name='oldSeller.id']").val(data.seller);
                    $("#absorbForm input[name='oldSeller.name']").val(data.sellerName);

                }
            })


            $(".absorbSubmit").click(function () {
                $("#absorbForm").ajaxSubmit(function (data) {
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
<#assign currentMenu="customer_pool">

<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl">
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl">
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">客户池管理</h1>
                </div>
            </div>
            <!--高级查询--->
            <form class="form-inline" id="searchForm" action="/customer/poolList.do" method="post">
                <input type="hidden" name="currentPage" id="currentPage" value="1">
                <div class="form-group">
                    <label for="keyword">关键字:</label>
                    <input type="text" class="form-control" id="keyword" name="keyword" value="${(qo.keyword)!''}" placeholder="请输入姓名/电话">
                </div>
                <div class="form-group">
                    <label for="seller">销售员:</label>
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
                           <a class="btn btn-primary btn-xs absorbBtn"  data-json='${entity.jsonData}'>
                               <span class="glyphicon glyphicon-pencil"></span> 吸纳
                           </a>
                           <@shiro.hasRole name="Market_Manager">
                           <a class="btn btn-warning btn-xs transferBtn"  data-json='${entity.jsonData}'>
                               <span class="glyphicon glyphicon-pencil"></span>移交
                           </a>
                           </@shiro.hasRole>
                       </td>
                   </tr>
               </#list>
            </table>
            <#--分页-->
            <#include "../common/page.ftl"/>
        </div>
    </div>
</div>

<#--移交模态框-->
<div id="transferModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">移交</h4>
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



<#--吸纳模态框-->
<div id="absorbModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">吸纳</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/customerTransfer/absorb.do" method="post" id="absorbForm" style="margin: -3px 118px">
                    <input type="hidden" name="id" />
                    <input type="hidden" class="form-control"    name="oldSeller.id"  >
                    <input type="hidden" class="form-control"  name="customer.id"  >

                    <div class="form-group">
                        <label for="sn" class="col-sm-4 control-label">吸纳备注：</label>
                        <div class="col-sm-8">
                            <textarea type="text" class="form-control"  name="reason" cols="10" ></textarea>
                        </div>
                    </div>

                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary absorbSubmit" >保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</body>
</html>