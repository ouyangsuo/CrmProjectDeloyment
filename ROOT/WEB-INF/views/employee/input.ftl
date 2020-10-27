<html lang="en">
<head>
    <title>员工编辑</title>
    <#include "../common/header.ftl"/>
    <script>

        //表单提交验证
        $(function () {
            $("#editForm").validate({
                //验证逻辑
                rules:{
                    //单个验证
                    //name:"required"
                    //多个验证
                    name:{
                        required:true,
                        minlength:5/*,
                        remote:{
                            url:"/employee/checkname.do",
                            type:"post",
                            data:{ //发起请求参数
                                name:function(){
                                    return $("#name").val();
                                },
                                id:function () {
                                    //需要id：原因：编辑时，用户已经存在了
                                    //需要使用id来区分编辑还是添加操作
                                    return $("#id").val();
                                }
                            }
                        }*/
                    },
                    password:{
                        required:true,
                        rangelength:[4,6]
                    },
                    repassword:{
                        equalTo:"#password"
                    },
                    age:{
                        digits:true,
                        range:[18,65]
                    }
                },
                //验证失败后提示
                messages:{
                    //可以不写，使用默认的
                    name:{
                        required:"用户必填",
                        minlength:"用户名长度必须大于5个"
                    }
                }
            })
        })




        $(function () {
            //拍重
            var ids = $.map($(".selfRoles option"), function(item){
                return item.value;
            })

            $.each($(".allRoles option"), function (index, item) {
                if($.inArray(item.value, ids) >= 0){
                    $(item).remove();
                }
            });

            //提交表单
            $("#btn_submit").click(function () {
                $(".selfRoles option").prop("selected", true);
                $("#editForm").submit();
            })
            var role = "";
            //超级管理员
            $("#admin").change(function () {
                if(this.checked){
                    role = $("#role").detach();
                }else{
                    $(this).closest("div").after(role);
                }
            })
            //编辑时候， 根据是否是超级管理员决定是否显示下拉框
            <#if (entity.admin)?? &&  entity.admin>
                role = $("#role").detach();
            </#if>
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
<#assign currentMenu = 'employee'>
<div class="container " style="margin-top: 20px">
    <#include "../common/top.ftl"/>
    <div class="row">
        <div class="col-sm-2">
            <#include "../common/menu.ftl"/>
        </div>
        <div class="col-sm-10">
            <div class="row">
                <div class="col-sm-12">
                    <h1 class="page-head-line">员工编辑</h1>
                </div>
            </div>
            <div class="row col-sm-10">
                <form class="form-horizontal" action="/employee/saveOrUpdate.do" method="post" id="editForm">
                    <input type="hidden" value="${(entity.id)!''}" name="id">
                    <div class="form-group" >
                        <label for="name" class="col-sm-2 control-label">用户名：</label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" id="name" name="name" value="${(entity.name)!''}" placeholder="请输入用户名">
                        </div>
                    </div>
                    <#if !entity??>
                    <div class="form-group">
                        <label for="password" class="col-sm-2 control-label">密码：</label>
                        <div class="col-sm-6">
                        <input type="password" class="form-control" id="password"  name="password"  placeholder="请输入密码">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="repassword" class="col-sm-2 control-label">验证密码：</label>
                        <div class="col-sm-6">
                        <input type="password" class="form-control" id="repassword" name="repassword"  placeholder="再输入一遍密码">
                        </div>
                    </div>
                    </#if>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">Email：</label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" id="email" name="email" value="${(entity.email)!''}" placeholder="请输入邮箱">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="age" class="col-sm-2 control-label">年龄：</label>
                        <div class="col-sm-6">
                        <input type="text" class="form-control" id="age" name="age" value="${(entity.age)!''}" placeholder="请输入年龄">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="dept" class="col-sm-2 control-label">部门：</label>
                        <div class="col-sm-6">
                        <select class="form-control" id="dept" name="dept.id">
                             <#list depts as d>
                                <option value="${d.id}">${d.name}</option>
                            </#list>
                        </select>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="admin" class="col-sm-2 control-label">超级管理员：</label>
                        <label class="checkbox-inline" style="margin-left: 15px;">
                            <input type="checkbox" id="admin" name="admin">
                            <#if entity?? && entity.admin >
                            <script>
                                $("#admin").prop("checked", true);
                            </script>
                            </#if>
                        </label>
                    </div>
                    <div class="form-group" id="role">
                        <div>
                            <label for="role" class="control-label" style="margin-left: 60px">角色：</label>
                        </div>
                    <div class="row" style="margin-top: 10px">
                        <div class="col-sm-4 col-sm-offset-1">
                            <select multiple class="form-control allRoles" size="15">
                                <#list roles as r>
                                    <option value="${r.id}" >${r.name}</option>
                                </#list>
                            </select>
                        </div>

                        <div class="col-sm-2" style="margin-top: 60px;" align="center">
                            <div >
                                <a type="button" class="btn btn-info  "  style="margin-top: 10px"
                                   onclick="moveSelected('allRoles', 'selfRoles')">&nbsp;&gt;&nbsp;</a>
                                <br>
                                <a type="button" class="btn btn-info " style="margin-top: 10px"
                                   onclick="moveSelected('selfRoles', 'allRoles')">&nbsp;&lt;&nbsp;</a>
                                <br>
                                <a type="button" class="btn btn-info " style="margin-top: 10px"
                                   onclick="moveAll('allRoles', 'selfRoles')">&gt;&gt;</a>
                                <br>
                                <a type="button" class="btn btn-info " style="margin-top: 10px"
                                   onclick="moveAll('selfRoles', 'allRoles')">&lt;&lt;</a>
                            </div>
                        </div>

                        <div class="col-sm-4">
                            <select multiple class="form-control selfRoles" size="15" name="ids">
                                <#if (entity.roles)??>
                                    <#list entity.roles as r>
                                        <option value="${r.id}" >${r.name}</option>
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