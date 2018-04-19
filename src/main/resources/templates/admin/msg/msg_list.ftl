<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 留言管理 <span class="c-gray en">&gt;</span> 园所留言 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
            <form action="/bbs/msg/list" id="findForm" method="post">
                <div class="text-c"> 日期范围：
                    <input type="text" name="minTime" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" value="${(msgCondition.minTime?date)!}" id="datemin" class="input-text Wdate" style="width:120px;">
                    -
                    <input type="text" name="maxTime" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" value="${(msgCondition.maxTime?date)!}"  id="datemax" class="input-text Wdate" style="width:120px;">
                    <input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="content" value="${(msgCondition.content)!}">
                    <button type="submit" class="btn btn-success" id="" name="" onclick='$("#findForm").submit()' ><i class="Hui-iconfont">&#xe665;</i> 搜留言</button>
                </div>
            </form>
			<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> </span> <span class="r">共有数据：<strong>${msgList?size!0}</strong> 条</span> </div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-hover table-bg table-sort">
					<thead>
						<tr class="text-c">
							<th width="25"><input type="checkbox" name="" value=""></th>
							<th width="30">ID</th>
							<th width="100">用户名</th>
							<th width="120">联系方式</th>
							<th>留言内容</th>
							<th width="120">留言时间</th>
							<th width="80">状态</th>
							<th width="120">操作</th>
						</tr>
					</thead>
					<tbody>
						<#list msgList as msg>
                        <tr class="text-c">
                            <td><input type="checkbox" value="${msg.id}" name=""></td>
                            <td>${msg.id}</td>
                            <td><a href="javascript:;">${(msg.name)!}</a></td>
                            <td>${(msg.phone)!}</td>
                            <td class="text-l">
                                <div>【${(msg.title)!}】</div>
                                <div  class="f-12 c-999">${msg.content}</div>
                            </td>
                            <td>${msg.time?datetime}</td>
                            <#if msg.status == 1>
								<td class="td-status"><span class="label label-success radius">审核通过</span></td>
								<td class="td-manage">
									<a style="text-decoration:none" onClick="member_stop(this,'${msg.id}')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>
							<#else>
								<td class="td-status"><span class="label label-defaunt radius">已下架</span></td>
								<td class="td-manage">
									<a style="text-decoration:none" onClick="member_start(this,'${msg.id}')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>
							</#if>
                                <a title="删除" href="javascript:;" onclick="del(this,'${msg.id}')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a>
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
		//"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": true,//状态保存
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[0,2,4]}// 制定列不参与排序
		]
	});
});
/*停用*/
function member_stop(obj,id){
    layer.confirm('确认要停用吗？',function(index){
        $.post("/bbs/msg/changeState",
                {
                    "id":id,
                    "status":0
                },
                function (data) {
                    if(data.status){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,'+id+')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                        $(obj).remove();
                        layer.msg('已停用!',{time:1000});
                    }
                })

    });
}

/*启用*/
function member_start(obj,id){
    layer.confirm('确认要发布吗？',function(index){
        $.post("/bbs/msg/changeState",
                {
                    "id":id,
                    "status":1
                },
                function (data) {
                    if(data.status){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this, '+id+')" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">审核通过</span>');
                        $(obj).remove();
                        layer.msg('已发布!',{time:1000});
                    }
                })

    });
}
/*用户-编辑*/
function member_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*密码-修改*/
function change_password(title,url,id,w,h){
	layer_show(title,url,w,h);	
}
/*管理员-删除*/
function del(obj, id) {
    del_list($(obj), id);
}
function dels(){
    var idList = [];
    var checkBoxs = $("tbody input:checked");
    $.each(checkBoxs, function () {
        idList.push($(this).val());
    });
    del_list(checkBoxs, idList);
}
function del_list(objs, idList) {
    if(idList.length == 0){
        layer.msg('请先选择', {time: 1000});
        return;
    }
    layer.confirm('删除须谨慎，确认要删除吗？', function (index) {
        $.ajax({
            url: "/bbs/msg/dels",
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
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>