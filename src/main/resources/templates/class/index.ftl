<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="/css/class.css" />
    <!--jQuery-->
    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <!--jQuery动画暂停插件-->
    <script type="text/javascript" src="/js/jquery.pause.min.js"></script>
    <!--滚动效果js-->
    <script type="text/javascript" src="/js/banner.js"></script>
    <style type="text/css">


        .imgBorder{background-image: url(/img/gai_34.jpg); padding: 20px 0px 0px 30px; width: 435px;
            height: 380px; background-repeat: no-repeat; margin: 10px 5px 0px 0px; height: 350px;}
        .bigImg img{border: 6px #FFFF9A solid; width: 395px; border-radius: 10px;}

        .info{ height: 380px; margin: 10px 10px 0px 5px;}

        .right_center{margin: 10px 0px 10px 20px; background-image: url(/img/classimgs.jpg);
            background-repeat: no-repeat; width: 816px;}
        .img_box{margin-left: 9px;}
        .img_list img{width: 154px; height: 120px; margin-top: 0px;}
        .more_imgs{width: 100%; height: 40px; margin-bottom: 5px;}
        /*.right_center img{visibility: hidden;}*/
        .more_imgs a{ display: block; float: right; line-height: 40px; margin-right: 5px;}

        .footer{width: 100%; background-image: url(/img/b_05.png); height: 70px;}

        /*baner*/
        #box_title{width:324px;font-weight:bold;line-height:28px;}
        /* con */
        #con{width:324px;height:340px;margin:0px auto;position:relative;border-top:1px solid #d6d6d6;background-color:#FFF;overflow:hidden;}
        #con .bottomcover{position:absolute;bottom:0; no-repeat 0 -5px;height:35px;width:394px;}
        #con ul{position:relative;margin:0px 10px 0px 10px;top:0;left:0;padding:0;}
        #con ul li{width:100%;border-top:1px dotted #d6d6d6;padding:10px 0;_padding:8px 0;overflow:hidden;line-height:1.5;}
        #con ul li .div_left{float:left;width:50px;border:1px solid; display: none;}
        #con ul li .div_right{float:right;width:305px;font-size:13px;}
        #con ul li .div_right a{color:#6EAFD5;padding:0px;}
        #con ul li .div_right .twit_item_time{font-size:11px;color:#999;padding:0px;text-align: right; margin-left: 10px;}
    </style>
</head>
<body>
<div class="dbody">
    <div class="dsize">
        <#include "class_left.ftl"/>
            <div class="right right_top">
                <div class="imgBorder left">
                    <div class="bigImg">
                        <div class="bigImg_info">
                            <#if (class.pic)??>
                                <img src="/upload/${class.pic}" width="395px" height="320px" />
                            <#else>
                                <img src="/img/nophoto.jpg" width="395px" height="320px" />
                            </#if>
                        </div>
                    </div>
                </div>
                <div class="info right" style="">
                    <div id="box_title">大家正在说</div>
                    <div id="con">
                        <div class="bottomcover" style="z-index:2;"></div>
                        <ul>
                            <#list msgList as msg>
                                        <li>
                                            <div class="div_left"><a href="javascript:;"><img src="img/head.jpg" title="${msg.name}"></a></div>
                                            <div class="div_right">
                                                <a href="javascript:;" target="_blank">${msg.name}</a>：<#if (msg.title)??>「 ${msg.title} 」</#if>${msg.content}
                                                <div class="twit_item_time">3分钟前</div>
                                            </div>
                                        </li>
                            </#list>
                        </ul>
                    </div>
                </div>
                <div class="clearfloat"></div>
                <!--</div>-->
            </div>
            <div class="right_center left">
                <div class="more_imgs right">
                    <a href="#" class="button">More</a>
                </div>
                <div class="class_imgs">
                    <div class="imgs_title">
                    </div>
                    <div class="img_list">
                        <#list albumPoList as album>
                            <div class="img_box left">
                                <#if album.photo??>
                                    <a href="/upload/${(album.photo)!}" data-lightbox="class_album">
                                        <img src="/upload/${(album.photo)!}"/>
                                    </a>
                                <#else>
                                    <img src="/img/nophoto.jpg">
                                </#if>
                            </div>
                        </#list>
                    </div>
                </div>
            </div>
            <div class="clearfloat"></div>
        </div>
    </div>
    <div class="footer right">

    </div>
</div>
</body>
</html>