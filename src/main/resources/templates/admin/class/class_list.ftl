<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 产品管理 <span class="c-gray en">&gt;</span> 产品列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<div>
			<div class="pd-20">
                <form action="/class/manage/list" id="findForm" method="post">
                    <div class="text-c">
                        日期范围：
                        <input type="text" name="minAddTime" value="${(classCondition.minAddTime?date)!}" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
                        -
                        <input type="text" name="maxAddTime" value="${(classCondition.maxAddTime?date)!}" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
                        <input type="text" class="input-text" style="width:250px" placeholder="搜资讯" id="" name="name" value="${(classCondition.name)!}">
                        <button type="submit" class="btn btn-success" id="" name="" onclick='$("#findForm").submit()' ><i class="Hui-iconfont">&#xe665;</i> 搜班级</button>
                    </div>
                </form>
				<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l">
					<a href="javascript:;" onclick="datadel()" style="display: none" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
					<a class="btn btn-primary radius" onclick="product_add('新增班级','/class/manage/addPage')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 新增班级</a>
					</span> <span class="r">共有：<strong>${(classList?size)!0}</strong> 个班级</span> </div>
				<div class="mt-20">
					<table class="table table-border table-bordered table-bg table-hover table-sort">
						<thead>
							<tr class="text-c">
								<th width="40">ID</th>
								<th width="100">封面图片</th>
								<th width="130">班级名称</th>
								<th>班级公告</th>
                                <th width="100">管理员</th>
								<th width="140">开班时间</th>
								<th width="80">状态</th>
								<th width="100">操作</th>
							</tr>
						</thead>
						<tbody>
							<#list classList as class>
                                <tr class="text-c va-m">
                                    <td>${class.id}</td>
                                    <td>
                                        <a href="/upload/${(class.photo)!}" data-lightbox="class_photo" data-title="${class.name}">
                                            <img width="60" class="product-thumb" src="/upload/${(class.photo)!}">
                                        </a>
                                    </td>
                                    <td><a style="text-decoration:none" href="/class/${class.id}" target="_blank">${class.name}</a></td>
                                    <td class="text-l">${(class.notice)!}</td>
                                    <td>${(class.adminId)!}</td>
                                    <td>${class.addTime?date}</td>
                                    <#if class.state == 1>
                                        <td class="td-status"><span class="label label-success radius">开班中</span></td>
                                        <td class="td-manage">
                                            <a style="text-decoration:none" onClick="product_stop(this,'${class.id}')" href="javascript:;" title="关班"><i class="Hui-iconfont">&#xe6de;</i></a>
                                    <#else>
                                        <td class="td-status"><span class="label label-defaunt radius">已关班</span></td>
                                        <td class="td-manage">
                                            <a style="text-decoration:none" onClick="product_start(this,id)" href="javascript:;" title="开班"><i class="Hui-iconfont">&#xe603;</i></a>
                                    </#if>
                                            <a style="text-decoration:none" class="ml-5" onClick="product_edit('班级编辑','/class/manage/editPage','${class.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
                                            <a style="text-decoration:none" class="ml-5" onClick="product_del(this,'${class.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                                        </td>
                                </tr>
							</#list>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</div>
</section>
<#include "../include/footer.ftl">

<script type="text/javascript">

$('.table-sort').dataTable({
	"aaSorting": [[ 0, "asc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  {"orderable":false,"aTargets":[6]}// 制定列不参与排序
	]
});
/*图片-添加*/
function product_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		area:['800px','500px'],
		content: url
	});
}
/*图片-查看*/
function product_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}

/*图片-编辑*/
function product_edit(title,url,id){
    var index = layer.open({
        type: 2,
        title: title,
        area:['800px','600px'],
        content: url+"?id="+id
    });
}
/*关班*/
function product_stop(obj,id){
    layer.confirm('确认要关班吗？',function(index){
        $.post("/class/manage/changeState",
                {
                    "id":id,
					"state":0
                },
                function (data) {
                    if(data.status){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                        $(obj).remove();
                        layer.msg('开班成功!', {time: 1000});
                    }else{
                        layer.msg('开班失败!', {time: 1000});
                    }
                })

    });

}
/*开班*/
function product_start(obj,id){
	layer.confirm('确认要开班吗？',function(index){
	    $.post("/class/manage/changeState",
				{
				    "id":id,
					"state":1
				},
				function (data) {
					if(data.status){
						$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="product_stop(this,'+id+')" href="javascript:;" title="关班"><i class="Hui-iconfont">&#xe6de;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已开班</span>');
						$(obj).remove();
                        layer.msg('开班成功!', {time: 1000});
					}else{
                        layer.msg('开班失败!', {time: 1000});
					}
                })

    });
}
/*图片-删除*/
function product_del(obj,id){
    layer.confirm('删除须谨慎，确认要删除吗？', function (index) {
        $.ajax({
            url: "/class/manage/del",
            data: {
                "id": id
            },
            type:"POST",
            success: function (data) {
                if (data.status) {
                    $(obj).parents("tr").remove();
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