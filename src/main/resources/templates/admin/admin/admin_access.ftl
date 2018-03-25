<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 权限管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
			<div class="text-c">
				<form class="Huiform" method="post" action="/admin/admin/accessList" id="findForm">
					<input type="text" class="input-text" style="width:250px" value="${name!}" placeholder="权限名称" id="" name="name">
					<button type="submit" class="btn btn-success" onclick='$("#findForm").submit()'><i class="Hui-iconfont">&#xe665;</i> 搜权限节点</button>
				</form>
			</div>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l" style="visibility: hidden">
					<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
						<i class="Hui-iconfont">&#xe6e2;</i> 批量删除
					</a>
					<a href="javascript:;" onclick="admin_permission_add('添加权限节点','admin-permission-add.html','','310')" class="btn btn-primary radius">
						<i class="Hui-iconfont">&#xe600;</i> 添加权限节点
					</a>
				</span>
				<span class="r">共有数据：<strong>${accessList?size}</strong> 条</span>
			</div>
			<table class="table table-border table-bordered table-bg">
				<thead>
					<tr>
						<th scope="col" colspan="8">权限节点</th>
					</tr>
					<tr class="text-c">
						<th width="25"><input type="checkbox" name="" value=""></th>
						<th width="40">ID</th>
						<th width="200">权限名称</th>
						<th>字段名</th>
                        <th width="200">分组名</th>
                        <th width="200">模块名</th>
                        <th width="100">是否已启用</th>
						<th width="100">操作</th>
					</tr>
				</thead>
				<tbody>
					<#list accessList as access>
						<tr class="text-c">
                            <td><input type="checkbox" value="1" name=""></td>
                            <td>${access.id}</td>
                            <td>${access.name}</td>
                            <td>${access.access}</td>
                            <td>${access.groupName}</td>
							<td>${access.modelName}</td>
							<#if access.state == 1>
								<td class="td-status"><span class="label label-success radius">已启用</span></td>
								<td class="td-manage"><a style="text-decoration:none" onClick="access_stop(this,${access.id}, '${access.group}')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
							<#else>
								<td class="td-status"><span class="label radius">已停用</span></td>
								<td class="td-manage"><a style="text-decoration:none" onClick="access_start(this,${access.id})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a>
							</#if>
								<a title="编辑" href="javascript:;" onclick="admin_permission_edit('角色编辑','admin-permission-add.html',${access.id},'','310')" class="ml-5" style="text-decoration:none">
									<i class="Hui-iconfont">&#xe6df;</i>
								</a>
								<a title="删除" href="javascript:;" onclick="admin_permission_del(this,${access.id})" class="ml-5" style="text-decoration:none">
									<i class="Hui-iconfont">&#xe6e2;</i>
								</a>
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
/*管理员-权限-添加*/
function admin_permission_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-权限-编辑*/
function admin_permission_edit(title,url,id,w,h){
    layer.msg('权限管理编辑功能停用中',{time:1000});
	// layer_show(title,url,w,h);
}
/*管理员-权限-删除*/
function admin_permission_del(obj,id){
    layer.msg('权限管理删除功能停用中',{time:1000});
	// layer.confirm('角色删除须谨慎，确认要删除吗？',function(index){
	// 	$(obj).parents("tr").remove();
	// 	layer.msg('已删除!',{icon:1,time:1000});
	// });
}
/*管理员-权限-批量删除*/
function datadel() {
	layer.msg("权限管理功能禁止中！");
}
/*管理员-停用*/
function access_stop(obj,id,group){
    if(group == "access"){
        layer.msg("权限管理禁止停用", {time:1500});
        return;
	}
    layer.confirm('确认要停用吗？',function(index){
        $.post("/admin/admin/accessState", {"id":id, "state":0}, function (data) {
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
function access_start(obj,id){
    layer.confirm('确认要启用吗？',function(index){
        $.post("/admin/admin/accessState", {"id":id, "state":1}, function (data) {
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
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>