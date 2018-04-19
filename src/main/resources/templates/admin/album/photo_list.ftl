<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图片管理 <span class="c-gray en">&gt;</span> 图片列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
            <form action="/album/photo/list" id="findForm" method="post">
                <div class="text-c"> 日期范围：
                    <input type="text" name="minAddTime" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" value="${(albumPhotoCondition.minAddTime?date)!}" id="datemin" class="input-text Wdate" style="width:120px;">
                    -
                    <input type="text" name="maxAddTime" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" value="${(albumPhotoCondition.maxAddTime?date)!}"  id="datemax" class="input-text Wdate" style="width:120px;">
                    <input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="name" value="${(albumPhotoCondition.name)!}">
                    <button type="submit" class="btn btn-success" id="" name="" onclick='$("#findForm").submit()' ><i class="Hui-iconfont">&#xe665;</i> 搜图片</button>
                </div>
            </form>

			<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="picture_dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
				<a class="btn btn-primary radius" style="display: none" onclick="picture_add('添加图片','picture-add.html')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加图片</a></span>
				<span class="r">共有数据：<strong>${photoList?size}</strong> 条</span> </div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="40"><input name="" type="checkbox" value=""></th>
							<th width="80">ID</th>
							<th width="100">分类</th>
                            <th width="100">相册名</th>
                            <th>图片名称</th>
							<th width="150">添加时间</th>
							<th width="80">发布状态</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<#list photoList as photo>
						    <tr class="text-c">
                                <td><input name="" type="checkbox" value="${photo.photoId}"></td>
                                <td>${photo.id}</td>
                                <td>${(albumMap['3'].name)!}</td>
                                <td>${(albumMap['3'].name)!}</td>
                                <td class="text-l"><a class="maincolor" href="/upload/${photo.photoId}" data-lightbox="image" data-title="${photo.name}">${photo.name}</a></td>
								<td>${photo.addTime?datetime}</td>
                                <#if photo.photoId?indexOf('temp_') == -1>
                                    <td class="td-status"><span class="label label-success radius">已发布</span></td>
                                	<td class="td-manage">
										<a style="text-decoration:none" onClick="picture_stop(this,'${photo.id}', '${photo.photoId}')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>
								<#else>
									<td class="td-status"><span class="label label-defaunt radius">已下架</span></td>
                                	<td class="td-manage">
										<a style="text-decoration:none" onClick="picture_start(this,'${photo.id}', '${photo.photoId}')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>
                                </#if>
									<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${photo.id}','${photo.photoId}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
								</td>
                            </tr>
						</#list>
					</tbody>
				</table>
			</div>
		</article>
	</div>
</section>

<#include "../include/footer.ftl">

<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "asc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,7]}// 制定列不参与排序
	]
});
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-查看*/
function picture_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-下架*/
function picture_stop(obj,id,photoId){
	layer.confirm('确认要下架吗？',function(index){
		$.post("/album/photo/stop",
				{
				    "id":id,
					"photoId":photoId
				},
				function (data) {
					if(data.status){
                        $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_start(this,'+id+',\''+photoId+'\')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
                        $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                        $(obj).remove();
                        layer.msg('已下架!',{time:1000});
					}
                })
	});
}

/*图片-发布*/
function picture_start(obj,id,photoId){
	layer.confirm('确认要发布吗？',function(index){
        $.post("/album/photo/start",
                {
                    "id":id,
                    "photoId":photoId
                },
                function (data) {
                    if(data.status){
						$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="picture_stop(this,'+id+',\''+photoId+'\')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
						$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
						$(obj).remove();
						layer.msg('已发布!',{time:1000});
                    }
                })

	});
}
/*图片-编辑*/
function picture_edit(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
		content: url
	});
	layer.full(index);
}
/*图片-删除*/
function picture_del(obj,id,photoId){
	layer.confirm('确认要删除吗？',function(index){
		$.post("/album/photo/del",
				{
				    "id":id,
					"photoId":photoId
				},
				function (data) {
					if(data.status){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{time:1000});
					}else{
                        layer.msg('删除失败',{time:1500});
					}
                });
	});
}
function picture_dels(){
    if($("tbody input:checked").length == 0){
        layer.msg('请先选择',{time:1000});
        return;
	}

    layer.confirm('确认要删除吗？',function(index){
        $.each($("tbody input:checked"), function () {
            $.ajax({
                url: "/album/photo/del",
                data: {
                    "id": $(this).parent().next().text(),
                    "photoId": $(this).val()
                },
                async:false
            });
        });
		layer.msg('删除成功',{time:1000});
    });
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>