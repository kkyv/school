<#include "../include/meta.ftl">
<link href="/js/lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet">

<div class="pd-20">
	<div class="cl pd-5 bg-1 bk-gray mt-20">
		<span class="l">
			<a href="javascript:;" onclick="dels()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a>
		</span>
		<span class="r">共有：<strong>${photoList?size}</strong> 张</span>
	</div>
	<div class="portfolio-content">
		<ul class="cl portfolio-area">
			<#list photoList as photo>
			    <li class="item">
                    <div class="portfoliobox">
                        <input class="checkbox" name="" type="checkbox" value="${photo.id}" photoId="${photo.photoId}">
                        <div class="picbox">
                            <a href="/upload/${photo.photoId}" data-lightbox="album_photo" data-title="${photo.name}"><img src="/upload/${photo.photoId}"></a>
                        </div>
                        <div class="textbox">${photo.name} </div>
                    </div>
                </li>
			</#list>
		</ul>
	</div>
</div>

<#include "../include/footer.ftl">

<script type="text/javascript" src="/js/lib/lightbox2/2.8.1/js/lightbox.min.js"></script>
<script type="text/javascript">
function dels() {
    if($("input:checked").length == 0){
        layer.msg('请先选择',{time:1000});
        return;
    }

    layer.confirm('确认要删除吗？',function(index){
        $.each($("input:checked"), function () {
            $.ajax({
                url: "/album/photo/del",
                data: {
                    "id": $(this).val(),
                    "photoId": $(this).attr("photoId")
                },
				success:function (data) {
					console.log(data.status);
                },
                async:false
            });
        });
        layer.msg('删除成功',{time:1000});
    });
}
</script>
</body>
</html>