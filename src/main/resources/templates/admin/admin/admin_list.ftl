<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
		<span class="c-gray en">&gt;</span>
		管理员管理
		<span class="c-gray en">&gt;</span>
		管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a> </nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="text-c"> 日期范围：
				<input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
				-
				<input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
				<input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="">
				<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l"> <a href="javascript:;" onclick="admin_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
					<a href="javascript:;" onclick="admin_add('添加管理员','/admin/addAdminPage','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a> </span>
				<span class="r">共有数据：<strong>${adminList?size}</strong> 条</span>
			</div>
			<table class="table table-border table-bordered table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="9">员工列表</th>
					</tr>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="40">ID</th>
						<th width="150">登录名</th>
						<th width="90">手机</th>
						<th width="150">邮箱</th>
						<th>角色</th>
						<th width="130">加入时间</th>
						<th width="100">是否已启用</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
				<#list adminList as admin>
					<tr class="text-c">
						<td><input type="checkbox" value="${admin.id}" name=""></td>
						<td>${admin.id}</td>
						<td>${admin.nickname}</td>
						<td>${admin.phone!}</td>
						<td>admin@mail.com</td>
						<td>${admin.roleName!}</td>
						<td>${admin.addTime?date}</td>
                        <#if admin.state == 1>
                            <td class="td-status"><span class="label label-success radius">已启用</span></td>
						    <td class="td-manage"><a style="text-decoration:none" onClick="admin_stop(this,${admin.id})" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
                        <#else>
                            <td class="td-status"><span class="label radius">已停用</span></td>
                            <td class="td-manage"><a style="text-decoration:none" onClick="admin_start(this,${admin.id})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>
                        </#if>
                                <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','/admin/editAdminPage',${admin.id},'800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
                                <a title="删除" href="javascript:;" onclick="admin_del(this,${admin.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
                            </td>
					</tr>
				</#list>
				</tbody>
			</table>
		</article>
	</div>
</section>

<#include "../include/footer.ftl"/>
<script type="text/javascript">
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
    layer_show(title,url+"?id="+id,w,h);
}
/*管理员-删除*/
function admin_del(obj, id) {
    admin_delList($(obj), id);
}
function admin_dels(){
    var idList = [];
    var checkBoxs = $("tbody input:checked");
    $.each(checkBoxs, function () {
        idList.push($(this).val());
    });
    admin_delList(checkBoxs, idList);
}
function admin_delList(objs, idList) {
    if(idList.length == 0){
        layer.msg('请先选择', {time: 1000});
        return;
    }
    layer.confirm('角色删除须谨慎，确认要删除吗？', function (index) {
        $.ajax({
            url: "/admin/del",
            data: {
                "idList": idList
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
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
        $.post("/admin/stateChange", {"id":id, "state":0}, function (data) {
            if(data.status){
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
                $(obj).remove();
                layer.msg('已停用!',{time:1000});
            }else{
                layer.msg('停用失败!', {time: 1000});
            }
        })
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$.post("/admin/stateChange", {"id":id, "state":1}, function (data) {
            if(data.status){
                $(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
                $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                $(obj).remove();
                layer.msg('已启用!', {time:1000});
            }else{
                layer.msg('启用失败!', {time: 1000});
            }
        })
	});
}
</script>
</body>
</html>