<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="/js/lib/boostrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/css/class.css" />
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/js/lib/boostrap/bootstrap.js"></script>
    <style type="text/css">
    </style>
</head>
<body>
<div class="dbody">
    <div class="dsize">
        <#include "class_left.ftl"/>
            <div class="right right_top" style="padding-top: 0px;">
            	<div class="photos">
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="lolPlate">
                            <div class="panel panel-default" style="margin-bottom: 0px">
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
                                                            <a href="#" style="display: block; width: 54px; text-align: center;overflow: hidden;text-overflow:ellipsis; font-size: 10px">${(msg.name)!'匿名用户'}</a>
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
                                        <textarea style="width: 100%;" class="form-control" rows="5" name="content" placeholder="请输入内容...."></textarea>
                                        <p></p>
                                        <input style="width: 100%;" class="form-control" type="text" name="phone" placeholder="请输入您的联系方式"/>
                                        <p></p>
                                        <input type="hidden" name="status" value="1">
                                        <input type="hidden" name="type" value="${class.id}">
                                        <input type="submit" class="btn btn-warning" value="提交" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
            	</div>
            </div>
            <div class="clearfloat"></div>
        </div>
    </div>
    <div class="footer right"></div>
</div>
</body>
</html>