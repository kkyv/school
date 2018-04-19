<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户中心 <span class="c-gray en">&gt;</span> 会员列表<a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
            <form action="/child/child/list" id="findForm" method="post">
                <div class="text-c"> 日期范围：
                    <input type="text" name="minAddTime" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" value="${(childCondition.minAddTime?date)!}" id="datemin" class="input-text Wdate" style="width:120px;">
                    -
                    <input type="text" name="maxAddTime" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" value="${(childCondition.maxAddTime?date)!}"  id="datemax" class="input-text Wdate" style="width:120px;">
                    <input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="nickname" value="${(childCondition.nickname)!}">
                    <button type="submit" class="btn btn-success" id="" name="" onclick='$("#findForm").submit()' ><i class="Hui-iconfont">&#xe665;</i> 搜幼儿</button>
                </div>
            </form>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
					<a href="javascript:;" onclick="datadel()" style="display: none" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
					<a href="javascript:;" onclick="member_add('添加用户','/child/child/addPage','800','510')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加用户</a>
				</span> <span class="r">共有数据：<strong>${(childList?size)!0}</strong> 条</span> </div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="140">ID</th>
							<th width="100">用户名</th>
                            <th width="100">班级</th>
							<th width="40">性别</th>
							<th width="90">手机</th>
							<th width="">地址</th>
							<th width="130">加入时间</th>
							<th width="70">状态</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<#list childList as child>
						<tr class="text-c">
							<td>${child.id}</td>
							<td><u style="cursor:pointer" class="text-primary" onclick="member_show('${child.nickname}','/child/child/show','${child.id}','360','400')">${child.nickname}</u></td>
                            <td>${(classMap['${child.classId}'].name)!}</td>
							<td>${child.sex}</td>
							<td>${1230}</td>
							<td class="text-l">${child.addr}</td>
							<td>${child.addTime?datetime}</td>
							<#if child.state == 1>
								<td class="td-status"><span class="label label-success radius">已启用</span></td>
								<td class="td-manage">
									<a style="text-decoration:none" onClick="member_stop(this,'${child.id}')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
							<#else>
								<td class="td-status"><span class="label label-defaunt radius">已停用</span></td>
								<td class="td-manage">
									<a style="text-decoration:none" onClick="member_start(this,'${child.id}')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>
							</#if>
								<a title="编辑" href="javascript:;" onclick="member_edit('编辑','/child/child/editPage','${child.id}','800','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a>
								<a style="text-decoration:none" class="ml-5" onClick="change_password('修改密码','/child/child/rePwd','${child.id}','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont">&#xe63f;</i></a>
								<a title="删除" href="javascript:;" onclick="member_del(this,'${child.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
							</td>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</article>
	</div>
</section>

<#include "../include/footer.ftl"/>

<script type="text/javascript">
$(function(){
	$('.table-sort').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[8]}// 制定列不参与排序
		]
	});
});
/*用户-添加*/
function member_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*用户-查看*/
function member_show(title,url,id,w,h){
	layer_show(title,url+"?id="+id,w,h);
}
/*用户-停用*/
function member_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$.post("/child/child/changeState",
				{
					"id":id,
                    "state":0
				},
				function (data) {
					if(data.status){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,\''+id+'\')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已停用</span>');
						$(obj).remove();
						layer.msg('已停用!',{time:1000});
					}
				})

        });
}

/*用户-启用*/
function member_start(obj,id){
    layer.confirm('确认要发布吗？',function(index){
        $.post("/child/child/changeState",
                {
                    "id":id,
					"state":1
                },
                function (data) {
                    if(data.status){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,\''+id+'\')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
                        $(obj).remove();
                        layer.msg('已发布!',{time:1000});
                    }
                })

    });
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url+"?id="+id,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url+"?id="+id,w,h);
}
/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.post("/child/child/del",{
		    "id":id
		},function (data) {
			if(data.status){
                $(obj).parents("tr").remove();
                layer.msg('已删除!',{icon:1,time:1000});
			}
        })
	});
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>