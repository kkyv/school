<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
	<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 相册管理 <span class="c-gray en">&gt;</span> 相册列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
	<div class="Hui-article">
		<article class="cl pd-20">
            <form action="/album/album/list" id="findForm" method="post">
                <div class="text-c"> 日期范围：
                    <input type="text" name="minAddTime" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" value="${(albumCondition.minAddTime?date)!}" id="datemin" class="input-text Wdate" style="width:120px;">
                    -
                    <input type="text" name="maxAddTime" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" value="${(albumCondition.maxAddTime?date)!}"  id="datemax" class="input-text Wdate" style="width:120px;">
                    <input type="text" class="input-text" style="width:250px" placeholder="输入管理员名称" id="" name="name" value="${(albumCondition.name)!}">
                    <button type="submit" class="btn btn-success" id="" name="" onclick='$("#findForm").submit()' ><i class="Hui-iconfont">&#xe665;</i> 搜相册</button>
                </div>
            </form>
			<div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
					<a href="javascript:;" onclick="upload(this, '/album/uploadImgPage')" class="btn btn-success radius"><i class="Hui-iconfont">&#xe600;</i> 上传图片</a>
					<a class="btn btn-primary radius" onclick="picture_add('创建相册','/album/album/addPage')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 创建相册</a>
				</span>
				<span class="r">共有数据：<strong>${albumList?size}</strong> 条</span> </div>
			<div class="mt-20">
				<table class="table table-border table-bordered table-bg table-hover table-sort">
					<thead>
						<tr class="text-c">
							<th width="80">ID</th>
							<th width="100">分类</th>
							<th width="150">Tags</th>
							<th width="100">封面</th>
							<th>图片</th>
							<th width="150">更新时间</th>
							<th width="100">操作</th>
						</tr>
					</thead>
					<tbody>
						<#list albumList  as album>
							<tr class="text-c">
								<td>${album.id}</td>
								<td>${(album.cateName)!}</td>
								<td class="text-c">${(album.name)!}</td>
								<#if albumMap['${album.id}']??>
									<#assign albumPhotoList = (albumMap['${album.id}'])/>
								    <td><a data-lightbox="albumImg" href="/upload/${(albumPhotoList[0].photoId)}" data-title="${(albumPhotoList[0].name)}"><img width="100" class="picture-thumb" src="/upload/${(albumPhotoList[0].photoId)}"></a></td>
									<td class="text-l">
										<a class="maincolor" href="javascript:;" onClick="picture_show('相册编辑','/album/album/show','${album.id}')">
											<#list albumMap['${album.id}'] as photo>
												${photo.name}&nbsp;&nbsp;&nbsp;
											</#list>
										</a>
									</td>
								<#else>
									<td>暂无封面</td>
									<td>暂无图片</td>
								</#if>
								<td>${(album.addTime?datetime)!}</td>
                                <td class="td-manage">
                                    <a style="text-decoration:none" class="ml-5" onClick="upload(this, '/album/uploadImgPage?id=${album.id}')" href="javascript:;" title="上传图片"><i class="Hui-iconfont">&#xe684;</i></a>
									<a style="text-decoration:none" class="ml-5" onClick="picture_edit(this, '${album.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
									<a style="text-decoration:none" class="ml-5" onClick="picture_del(this,'${album.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
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

<script type="text/javascript" src="/js/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 0, "asc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[6]}// 制定列不参与排序
	]
});

function upload(obj, url) {
    var index = layer.open({
        type: 2,
        area:['700px', '600px'],
        title: "上传图片",
        content: url
    });
}
/*图片-添加*/
function picture_add(title,url){
	var index = layer.open({
		type: 2,
		area:['500px', '250px'],
		title: title,
		content: url
	});
}
/*图片-查看*/
function picture_show(title,url,id){
	var index = layer.open({
		type: 2,
		title: title,
        area: ['800px', '700px'],
		content: url+"?id="+id
	});
}
/*图片-编辑*/
function picture_edit(obj, id){
    var name = $(obj).parent().parent().find("td:nth-child(3)").text();
    layer.prompt({
		title:"请输入名字",
		value:name
	},function(val, index){
        if(name == val){
            return;
		}
		if(name == ""){
            layer.msg("名字不能为空", {time:1000});
            return;
		}

        $.post("/album/album/rename",
				{
				    "id":id,
					"name":val
				},
				function (data) {
					if(data.status){
					    layer.msg("编辑成功",{time:1000});
                        $(obj).parent().parent().find("td:nth-child(3)").text(val);
					    layer.close(index);
					}else {
                        layer.msg("编辑失败",{time:1000});
					}
                }
		)
        layer.close(index);
    });
}
/*图片-删除*/
function picture_del(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$.post("/album/album/del",
				{
				    "id":id
				},
				function (data) {
					if(data.status){
                        $(obj).parents("tr").remove();
                        layer.msg('已删除!',{time:1000});
					}
                }
		);
	});
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>