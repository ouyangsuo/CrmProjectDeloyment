<html lang="en">
<head>
    <title>角色编辑</title>
    <#include "../common/header.ftl"/>

    <script>

        $(function () {
            //拍重
            var ids = $.map($(".selfPermissions option"), function(item){
                return item.value;
            })
            $.each($(".allPermissions option"), function (index, item) {
                if($.inArray(item.value, ids) >= 0){
                    $(item).remove();
                    $(item).remove();
                }
            });

            //提交表单
            $("#btn_submit").click(function () {
                $(".selfPermissions option").prop("selected", true);
                $("#editForm").submit();
            })
        })

        //移动选中
        function moveSelected(srcCls, targetCls){
            $("." + srcCls + " option:selected").appendTo($("." + targetCls));
        }
        //移动全部
        function moveAll(srcCls, targetCls){
            $("." + srcCls + " option").appendTo($("." + targetCls))
        }
    </script>
</head>
<body>
<!--设置菜单回显-->
<#assign currentMenu = 'role'>
<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">角色编辑</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/role/saveOrUpdate.do" method="post" id="editForm">
                    <input type="hidden" value="${(entity.id)!''}" name="id">
                    <div class="form-group" >
                        <label for="name" class="col-sm-2 control-label">角色名称：</label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" id="name" name="name" value="${(entity.name)!''}" placeholder="请输入角色名称">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="sn" class="col-sm-2 control-label">角色编号：</label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" id="sn" name="sn" value="${(entity.sn)!''}" placeholder="请输入角色编号">
                        </div>
                    </div>

                    <div class="form-group" id="role">
                        <div>
                            <label for="role" class="control-label" style="margin-left: 60px">权限：</label>
                        </div>
                        <div class="row" style="margin-top: 10px">
                            <div class="col-sm-4 col-sm-offset-1">
                                <select multiple class="form-control allPermissions" size="15">
                                    <#list  permissions as p>
                                        <option value="${p.id}" >${p.name}</option>
                                    </#list>
                                </select>
                            </div>

                            <div class="col-sm-2" style="margin-top: 60px;" align="center">
                                <div >
                                    <a type="button" class="btn btn-info  "  style="margin-top: 10px"
                                       onclick="moveSelected('allPermissions', 'selfPermissions')">&nbsp;&gt;&nbsp;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveSelected('selfPermissions', 'allPermissions')">&nbsp;&lt;&nbsp;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveAll('allPermissions', 'selfPermissions')">&gt;&gt;</a>
                                    <br>
                                    <a type="button" class="btn btn-info " style="margin-top: 10px"
                                       onclick="moveAll('selfPermissions', 'allPermissions')">&lt;&lt;</a>
                                </div>
                            </div>

                            <div class="col-sm-4">
                                <select multiple class="form-control selfPermissions" size="15" name="ids">
                                    <#if (entity.permissions)??>
                                        <#list entity.permissions as p>
                                            <option value="${p.id}" >${p.name}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-1 col-sm-6">
                            <button id="btn_submit" class="btn btn-default">保存</button>
                            <button type="reset" class="btn btn-default">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>