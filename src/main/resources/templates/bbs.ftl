<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
        <link rel="stylesheet" type="text/css" href="/js/lib/boostrap/bootstrap.css">

		<link rel="stylesheet" type="text/css" href="/css/public.css"/>
        <link rel="stylesheet" type="text/css" href="/css/nav.css"/>

        <style type="text/css">
            .liuyanban
            {
                width: 692px;
                height: 29px;
                padding-left: 60px;
                color: #337d0E;
                line-height: 29px;
                font-weight: bold;
                background-image: url(/img/ly.jpg);
                background-position: 0px -57px;
                background-repeat: no-repeat;
            }
            .lybox
            {
                width: 750px;
                height: 300px;
                border-left: 1px solid #D1FE99;
                border-right: 1px solid #D1FE99;
                border-bottom: 1px solid #D1FE99;
            }
            .lyleft
            {
                width: 110px;
                line-height: 40px;
                height: 40px;
                text-align: right;
            }
            .lyright
            {
                width: 640px;
                height: 40px;
            }
            .lyrarea
            {
                height: 100px;
            }
            .lyrarea textarea
            {
                margin: 10px;
                width: 550px;
                font-size: 12px;
                padding: 5px;
                height: 70px;
                border: 1px solid #dddddd;
            }
            .lyright input
            {
                margin-left: 10px;
                margin-top: 9px;
                width: 250px;
                height: 22px;
                line-height: 22px;
                border: 1px solid #CCCCCC;
            }
            .yzm input
            {
                width: 80px;
            }
            .lyright a
            {
                margin-left: 10px;
                margin-top: 15px;
                width: 91px;
                height: 31px;
                display: inline-block;
                background-image: url(/img/ly.jpg);
                background-position: -114px -86px;
                background-repeat: no-repeat;
            }
            .lyright a:hover
            {
                background-image: url(/img/ly.jpg);
                background-position: -23px -86px;
                background-repeat: no-repeat;
            }

		</style>
        <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
        <script type="text/javascript" src="/js/lib/boostrap/bootstrap.js"></script>
        <script type="text/javascript" src="/js/nav.js"></script>
        <script type="text/javascript">
            function msg(isLogin) {
                // if(!isLogin){
                //     alert("请先登录")
                //     window.location.href = "/";
                // }else{
                    var title = $("#title").val();
                    var contetnt =$("#content").val();
                    var phone = $("#linkphone").val();

                    if(title == null) {
                        alert("标题不能为空")
                    }else if(contetnt == null){
                        alert("内容不能为空")
                    }else if(phone == null){
                        alert("手机号不能为空")
                    }

                    $.post("/bbs/add", {"title":title,"content":contetnt,"phone":phone},function (resp) {
                        $("#title").val("");
                        $("#content").val("");
                        $("#linkphone").val("");
                        alert(resp.msg);
                    })
                // }
            }
        </script>
	</head>
	<body>
		<div class="dbody">
        <div class="dsize">
			<#include "include/head.ftl"/>
            <div class="midlbox">
            	<div class="centbox">
            		<hr style="border:3 double #BB6900" width="90%" color="#BB6900" size=3>
            		<div class="midlbox-content">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="lolPlate">
                                <div class="panel panel-default">
                                    <!-- Default panel contents -->
                                    <div class="panel-heading">留言板</div>
                                    <!-- Table -->
                                    <table class="table">
                                            <#list msgList as msg>

                                            <tr height="100px">
                                                <th><p></p>
                                                    <div>
                                                        <a href="#">
                                                            <img style="display: block" src="/img/head.jpg" width="48" height="48">
                                                        </a>
                                                        <a href="#" style="display: block; width: 54px; text-align: center;overflow: hidden;text-overflow:ellipsis;">${(msg.name)!'匿名用户'}</a>
                                                    </div>
                                                </th>
                                                <td width="600px">
                                                    <#if msg.title??>
                                                        <p>「${(msg.title)!}」</p>
                                                        <div style="border: 1px gainsboro dashed"></div>
                                                    </#if>
                                                    <p style="margin-top: 12px">${msg.content}</p>
                                                </td>
                                                <td>${msg.time?datetime}</td>
                                                <td><span>${msg_index + 1}楼</span></td>
                                            </tr>
                                            </#list>
                                    </table>
                                </div>
                                <div class="panel panel-success">
                                    <div class="panel-heading">发表留言</div>
                                    <div class="panel-body">
                                        <form action="/bbs/add" method="post">
                                            <input style="width: 100%;" class="form-control" type="text" name="title" placeholder="标题"/>
                                            <p></p>
                                            <textarea style="width: 100%;" class="form-control" rows="5" name="content"></textarea>
                                            <p></p>
                                            <input style="width: 100%;" class="form-control" type="text" name="phone" placeholder="请输入您的联系方式"/>
                                            <input type="hidden" name="status" value="1">
                                            <input type="hidden" name="type" value="0">
                                            <input type="submit" class="btn btn-warning" value="提交" />
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
            	</div>
                <div class="mbottom">
                </div>
            </div>
        </div>
    </div>
	</body>
</html>
