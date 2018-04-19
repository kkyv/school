<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>$Title$</title>
    <link rel="stylesheet" type="text/css" href="/css/class.css" />
    <link href="/js/lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet">
    <script type="text/javascript" src="/js/lib/lightbox2/2.8.1/js/lightbox.js"></script>
    <style type="text/css">
    	.right_title{height: 45px; padding-bottom: 10px; margin: 0px 30px; line-height: 45px; border-bottom: 1px #c1c1c1 solid;}
    
		.photo_box{float: left; height: 220px; margin: 10px 0px 0px 30px; }
        .photo_box img{width: 165px; height: 165px; display: block; margin: 10px 0px 5px 0px;}
        .photo_box > span{display: block; text-align: center; color: #626262; font-size: 12px;}
        .photo_box a{color: #14647d; font-weight: bold; font-size: 16px;}
    </style>
</head>
<body>
<div class="dbody">
    <div class="dsize">
        <#include "class_left.ftl"/>
            <div class="right right_top">
            	<div class="right_title">
            		<img src="/img/i_25.jpg" class="img_middle" />
            		<a href="#">欢乐时光</a>
            	</div>
                <div class="photos">
					<#list albumPhotoPoList as photo>
						<div class="photo_box">
							<a href="/upload/${photo.photoId}" data-lightbox="class_photo" data-title="${photo.name}">
								<img src="/upload/${photo.photoId}" />
							</a>
							<span><a href="#">哈哈哈哈</a></span>
							<span>2018-01-21</span>
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