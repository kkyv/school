<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span
            class="c-gray en">&gt;</span> 角色管理 <a class="btn btn-success radius r"
                                                  style="line-height:1.6em;margin-top:3px"
                                                  href="javascript:location.replace(location.href);" title="刷新"><i
            class="Hui-iconfont">&#xe68f;</i></a></nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <div class="cl pd-5 bg-1 bk-gray"><span class="l"> <a href="javascript:;" onclick="admin_role_dels()"
                                                                  class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a
                    class="btn btn-primary radius" href="javascript:;"
                    onclick="admin_role_add('添加角色','/admin/addRolePage','800')"><i class="Hui-iconfont">&#xe600;</i> 添加角色</a> </span>
                <span class="r">共有数据：<strong>${adminRoleList?size}</strong> 条</span></div>
            <div class="mt-10">
                <table class="table table-border table-bordered table-hover table-bg">
                    <thead>
                    <tr>
                        <th scope="col" colspan="6">角色管理</th>
                    </tr>
                    <tr class="text-c">
                        <th width="25"><input type="checkbox" value="" name=""></th>
                        <th width="40">ID</th>
                        <th width="200">角色名</th>
                        <th>用户列表</th>
                        <th width="300">描述</th>
                        <th width="70">操作</th>
                    </tr>
                    </thead>
                    <tbody>
					<#list adminRoleList as adminRole>
                        <tr class="text-c">
                            <td><input type="checkbox" value="" name=""></td>
                            <td>${adminRole.role.id}</td>
                            <td>${adminRole.role.name}</td>
                            <td>
                                    <#list adminRole.adminList as admin>
                                        <#if admin_has_next>
                                            <a href="#">${admin.nickname}</a>，
                                        <#else>
                                            <a href="#">${admin.nickname}</a>
                                        </#if>
                                    </#list>
                            </td>
                            <td>${adminRole.role.desc}</td>
                            <td class="f-14"><a title="编辑" href="javascript:;"
                                                onclick="admin_role_edit('角色编辑','admin-role-add.html','1')"
                                                style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a
                                    title="删除" href="javascript:;" onclick="admin_role_del(this, ${adminRole.role.id})" class="ml-5"
                                    style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </article>
    </div>
</section>

<#include "../include/footer.ftl"/>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    /*管理员-角色-添加*/
    function admin_role_add(title, url, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-角色-编辑*/
    function admin_role_edit(title, url, id, w, h) {
        layer_show(title, url, w, h);
    }

    /*管理员-角色-删除*/
    function admin_role_del(obj, id) {
        admin_role_delList($(obj), id);
    }
    function admin_role_dels(){
        var idList = [];
        var checkBoxs = $("tbody input:checked").parent().next();
        $.each(checkBoxs, function () {
            idList.push($(this).text());
        });
        admin_role_delList(checkBoxs, idList);
    }
    function admin_role_delList(objs, idList) {
        if(idList.length == 0){
            layer.msg('请先选择', {time: 1000});
            return;
        }
        layer.confirm('角色删除须谨慎，确认要删除吗？', function (index) {
            $.ajax({
                url: "/admin/delRole",
                data: {
                    "roleIdList": idList
                },
                traditional: true,
                success: function (data) {
                    if (data.status) {
                        $.each(objs, function () {
                            $(this).parents("tr").remove();
                        })
                        layer.msg('已删除!', {time: 1000});
                    } else {
                        layer.msg('删除失败', {time: 2000});
                    }
                }
            });
        });
    }
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>