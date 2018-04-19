<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="/css/class.css" />
    <style type="text/css">
		.photo_box{float: left; height: 240px; width: 210px; margin: 10px 0px 0px 35px; background-image: url(/img/xc_85.png); background-repeat: no-repeat;}
        .photo_box img{width: 165px; height: 165px; display: block; margin: 10px 20px 20px 20px;}
        .photo_box > span{display: block; text-align: center; color: #626262; font-size: 12px;}
        .photo_box a{color: #14647d; font-weight: bold; font-size: 16px;}
    </style>
</head>
<body>
<div class="dbody">
    <div class="dsize">
        <#include "class_left.ftl"/>
            <div class="right right_top">
            	<div class="right_title"></div>
            	<div class="photos">
            		<#list albumPoList as album>
            		    <div class="photo_box">
                            <a href="/class/photo?id=${class.id}&albumId=${album.id}">
								<#if album.photo??>
								    <img src="/upload/${album.photo}" />
								<#else>
									<img src="/img/nophoto.jpg" />
								</#if>
                            </a>
                            <span><a href="/class/child?id=${class.id}">${album.name}</a></span>
                            <span>${(albumCountMap['${album.id}'])!0}张照片  ${album.addTime?date}</span>
                        </div>
            		</#list>
            	</div>
            </div>
            <div class="clearfloat"></div>
        </div>
    </div>
    <div class="footer right"></div>
</div>
</body>
</html>