<#include "../include/meta.ftl"/>
<#include "../include/head.ftl"/>
<#include "../include/menu.ftl"/>

<section class="Hui-article-box">
    <nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页
        <span class="c-gray en">&gt;</span>
        资讯管理
        <span class="c-gray en">&gt;</span>
        资讯列表
        <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a>
    </nav>
    <div class="Hui-article">
        <article class="cl pd-20">
            <form action="/info/${info.cateGroup}/infoList" id="findForm" method="post">
                <div class="text-c">
                <#--<span class="select-box inline">-->
                <#--<select name="cateId" class="select">-->
                <#--<option>9</option>-->
                <#--<option value="9">园所简介</option>-->
                <#--<option value="10">师资力量</option>-->
                <#--</select>-->
                <#--</span>-->
                    日期范围：
                    <input type="text" name="minAddTime" value="${(infoCondition.minAddTime?date)!}" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
                    -
                    <input type="text" name="maxAddTime" value="${(infoCondition.maxAddTime?date)!}" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
                    <input type="text" class="input-text" style="width:250px" placeholder="搜资讯" id="" name="title" value="${(infcCondition.name)!}">
                    <button type="submit" class="btn btn-success" id="" name="" onclick='$("#findForm").submit()' ><i class="Hui-iconfont">&#xe665;</i> 搜资讯</button>
                </div>
            </form>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
				<span class="l">
				<a class="btn btn-primary radius" data-title="添加资讯" _href="article-add.html" onclick="article_add('添加资讯','/info/${info.cateGroup}/addInfoPage')" href="javascript:;"><i class="Hui-iconfont">&#xe600;</i> 添加资讯</a>
				</span>
                <span class="r">共有数据：<strong>${infoList?size}</strong> 条</span>
            </div>
            <div class="mt-20">
                <table class="table table-border table-bordered table-bg table-hover table-sort">
                    <thead>
                    <tr class="text-c">
                        <th width="30">ID</th>
                        <th>标题</th>
                        <th width="80">分类</th>
                        <th width="80">分类组</th>
                        <th width="140">更新时间</th>
                        <th width="65">浏览次数</th>
                        <th width="60">发布状态</th>
                        <th width="80">操作</th>
                    </tr>
                    </thead>
                    <tbody>
						<#list infoList as info>
						    <tr class="text-c">
                                <td>${info_index + 1}</td>
                                <td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_detail('查看','/info/detail/${info.id}','${info.id}')" title="查看">${info.title}</u></td>
                                <td>${cateGroupMap['${info.cateId}'].name}</td>
                                <td>${cateGroupMap['${info.cateGroup}'].name}</td>
                                <td>${info.lastTime?datetime}</td>
                                <td>${info.total}</td>
                                <#if info.state == 0>
                                    <td class="td-status"><span class="label label-defaunt radius">已下架</span>
                                    <td class="f-14 td-manage"><a style="text-decoration:none" onclick="article_start(this,'${info.id}','${info.cateGroup}')" href="javascript:;" title="发布"><i class="Hui-iconfont"></i></a>
                                <#elseif info.state == 1>
                                    <td class="td-status"><span class="label label-success radius">已发布</span></td>
							        <td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_stop(this,'${info.id}','${info.cateGroup}')" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>
                                <#else>
                                    <td class="td-status"><span class="label label-warning radius">草稿</span></td>
                                    <td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_start(this,'${info.id}','${info.cateGroup}')" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe6de;</i></a>
                                </#if>
                                <a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','/info/${info.cateGroup}/addInfoPage','${info.id}')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>
                                <a style="text-decoration:none" class="ml-5" onClick="article_del(this,'${info.id}','${info.cateGroup}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a>
                            </td>
                            </tr>
                        </#list>
                    <#--<tr class="text-c">-->
                    <#--<td><input type="checkbox" value="" name=""></td>-->
                    <#--<td>10001</td>-->
                    <#--<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10001')" title="查看">资讯标题</u></td>-->
                    <#--<td>行业动态</td>-->
                    <#--<td>H-ui</td>-->
                    <#--<td>2014-6-11 11:11:42</td>-->
                    <#--<td>21212</td>-->

                    <#--<a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>-->
                    <#--<a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>-->
                    <#--</tr>-->
                    <#--<tr class="text-c">-->
                    <#--<td><input type="checkbox" value="" name=""></td>-->
                    <#--<td>10002</td>-->
                    <#--<td class="text-l"><u style="cursor:pointer" class="text-primary" onClick="article_edit('查看','article-zhang.html','10002')" title="查看">资讯标题</u></td>-->
                    <#--<td>动态</td>-->
                    <#--<td>H-ui</td>-->
                    <#--<td>2014-6-11 11:11:42</td>-->
                    <#--<td>21212</td>-->
                    <#--<td class="td-status"><span class="label label-success radius">草稿</span></td>-->
                    <#--<td class="f-14 td-manage"><a style="text-decoration:none" onClick="article_shenhe(this,'10001')" href="javascript:;" title="审核">审核</a>-->
                    <#--<a style="text-decoration:none" class="ml-5" onClick="article_edit('资讯编辑','article-add.html','10001')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a>-->
                    <#--<a style="text-decoration:none" class="ml-5" onClick="article_del(this,'10001')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>-->
                    <#--</tr>-->
                    </tbody>
                </table>
            </div>
        </article>
    </div>
</section>

<#include "../include/footer.ftl"/>

<script type="text/javascript">
    $('.table-sort').dataTable({
        "aaSorting": [[ 0, "asc" ]],//默认第几个排序
        "bStateSave": true,//状态保存
        "aoColumnDefs": [
            //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
            {"orderable":false,"aTargets":[7]}// 不参与排序的列
        ]
    });
    function article_detail(title,url,id) {
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*资讯-添加*/
    function article_add(title,url){
        var index = layer.open({
            type: 2,
            title: title,
            content: url
        });
        layer.full(index);
    }
    /*资讯-编辑*/
    function article_edit(title,url,id){
        var index = layer.open({
            type: 2,
            title: title,
            content: url+"?id="+id
        });
        layer.full(index);
    }
    function article_del(obj, id, cateGroup) {
        layer.confirm('删除须谨慎，确认要删除吗？', function (index) {
            $.ajax({
                url: "/info/" + cateGroup + "/del",
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
    function article_dels(cateGroup){
        var idList = [];
        var checkBoxs = $("tbody input:checked");
        $.each(checkBoxs, function () {
            idList.push($(this).val());
        });
        article_delList(checkBoxs, idList, cateGroup);
    }
    function article_delList(objs, idList, cateGroup) {
        if(idList.length == 0){
            layer.msg('请先选择', {time: 1000});
            return;
        }

    }
    /*资讯-下架*/
    function article_stop(obj,id,cateGroup){
        layer.confirm('确认要下架吗？',function(index){
            $.post("/info/"+cateGroup+"/changeState",{"state":"0","id":id},function (data) {
                if(data.status){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_start(this,id)" href="javascript:;" title="发布"><i class="Hui-iconfont">&#xe603;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已下架</span>');
                    $(obj).remove();
                    layer.msg('已下架!', {time:1000});
                }
            })
        });
    }

    /*资讯-发布*/
    function article_start(obj,id, cateGroup){
        layer.confirm('确认要发布吗？',function(index){
            $.post("/info/"+cateGroup+"/changeState",{"state":"1","id":id},function (data) {
                if(data.status){
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="article_stop(this,id)" href="javascript:;" title="下架"><i class="Hui-iconfont">&#xe6de;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
                    $(obj).remove();
                    layer.msg('已发布!', {time:1000});
                }
            })
        });
    }
    // /*资讯-审核*/
    // function article_shenhe(obj,id){
    // 	layer.confirm('审核文章？', {
    // 		btn: ['通过','不通过','取消'],
    // 		shade: false,
    // 		closeBtn: 0
    // 	},
    // 	function(){
    // 		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_start(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
    // 		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已发布</span>');
    // 		$(obj).remove();
    // 		layer.msg('已发布', {icon:6,time:1000});
    // 	},
    // 	function(){
    // 		$(obj).parents("tr").find(".td-manage").prepend('<a class="c-primary" onClick="article_shenqing(this,id)" href="javascript:;" title="申请上线">申请上线</a>');
    // 		$(obj).parents("tr").find(".td-status").html('<span class="label label-danger radius">未通过</span>');
    // 		$(obj).remove();
    //     	layer.msg('未通过', {icon:5,time:1000});
    // 	});
    // }
    // /*资讯-申请上线*/
    // function article_shenqing(obj,id){
    // 	$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">待审核</span>');
    // 	$(obj).parents("tr").find(".td-manage").html("");
    // 	layer.msg('已提交申请，耐心等待审核!', {icon: 1,time:2000});
    // }
</script>
</body>
</html>