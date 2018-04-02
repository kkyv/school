<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<link rel="stylesheet" type="text/css" href="/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/css/index.css"/>
		<link rel="stylesheet" type="text/css" href="/css/nav.css"/>


        <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
        <!--jQuery动画暂停插件-->
        <script type="text/javascript" src="/js/jquery.pause.min.js"></script>
        <script type="text/javascript" src="/js/nav.js"></script>
        <!--滚动效果js-->
        <script type="text/javascript" src="/js/banner.js"></script>

        <script type="text/javascript">
            function imgLogin_onclick() {
                var username = document.getElementById("username").value;
                var password = document.getElementById("password").value;
                $.post("/child/login", {"id":username,"password":password}, function (resp) {
                    if(resp.status){
                        location.reload();
                        window.open("/class/" + resp.data.classId);
                    }else {
                        alert(resp.msg);
                    }
                });
            }
        </script>
        <style>
            /*baner*/
            #box_title{width:324px;font-weight:bold;line-height:28px;}
            /* con */
            #con{height:95%;margin:0px auto;position:relative;border-top:1px solid #d6d6d6;background-color:#FFF;overflow:hidden;}
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
            <#include "include/head.ftl"/>
        <div class="dsize">
            <div class="midlbox">
                <!--<div class="cline fl clt">
                </div>-->
                <div class="centbox">
                    <div class="ctop">
                        <div class="ctlf fl">
                            <div class="ctlftop">
                                <div class="loginbox" id="dlogin">
                                    <#if child??>
                                        <p>
                                            <span>${child.nickname}</span>
                                            <a href="/child/logout/${child.id}">退出登录</a>
                                        </p>
                                        <a href="/class/${child.classId}" target="_blank">进入班级主页</a>
                                    <#else>
                                        <div class="dlname">
                                            <div class="fl">
                                                用户名：<input type="text" id="username" name="username" class="txtiput" onkeyup="if(event.keyCode==13 && this.value.trim()!=''){document.all.password.focus()}" />
                                            </div>
                                        </div>
                                        <div class="dlpassw">
                                            <div class="fl">
                                                密&nbsp;&nbsp;码：<input type="password" id="password" name="password" class="txtiput"
                                                                      onkeyup="if(event.keyCode==13 &&thisbotbot.value.trim()!=''){document.all.imgLogin.click()}" />
                                            </div>
                                        </div>
                                        <div class="dlbtn">
                                        <div class="dlremeber">
                                            <div class="fl">
                                                <input type="checkbox" id="autologin" checked="checked" value="checkbox" style="border: none;
                                                    width: 20px;" />
                                            </div>
                                            <div class="fl">
                                                记住密码
                                            </div>
                                        </div>
                                        <div class="fl pl5">
                                            <a href="javascript:void(0)" style="display: inline-block;" onclick="imgLogin_onclick(); return false;">
                                                <img src="img/m103_login.jpg" alt="" id="imgLogin" /></a></div>
                                        <div class="fl pl5" style="visibility: hidden">
                                            <a href="/ecenter/reg.aspx?schoolid=22247" style="display: inline-block;"
                                               target="_blank">
                                                <img src="img/m103_register.jpg" alt="" id="img1" /></a></div>
                                        </div>
                                    </#if>
                                </div>
                                <div class="wxtsbox">
                                    <marquee scrollamount="1" direction="up" onmouseover="this.stop();" onmouseout="this.start();">
                                        ${prompt.content}
                                    </marquee>
                                </div>
                            </div>
                            <div class="ctyzjy">
                                <div class="divbox">
                                    <img src="img/m103_more.jpg" style="width:80px;height:80px;border:3px solid #A2D926;" />
                                    <img src="img/m103_more.jpg" style="width:80px;height:80px;border:3px solid #A2D926;" />
                                    <img src="img/m103_more.jpg" style="width:80px;height:80px;border:3px solid #A2D926;" />
                                    <img src="img/m103_more.jpg" style="width:80px;height:80px;border:3px solid #A2D926;" />
                                </div>
                            </div>
                        </div>
                        <div class="ctcenter fl">
                            <div class="ysxw">
                                <!--<div class="weatherbox">
                                    <iframe src="http://m.weather.com.cn/m/pn4/weather.htm " width="160" height="20"
                                        marginwidth="0" marginheight="0" hspace="0" vspace="0" frameborder="0" scrolling="no">
                                    </iframe>
                                </div>-->
                                <div class="more1 allm">
                                    <a href="/info/list/13" target="_blank"></a>
                                </div>
                                <div class="ysxwCont listnews">
                                    <ul>
                                        <#list cate13InfoList as cate13Info>
                                            <div class="dNewsLeft">
                                                <a href="/info/${cate13Info.id}" target="_blank" title="${cate13Info.title}">${cate13Info.title}</a>
                                            </div>
                                            <div  class="dNewsRight">${cate13Info.addTime?date}</div>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                            <div class="ystz">
                                <div class="more2 allm">
                                    <a href="/info/list/22" target="_blank"></a>
                                </div>
                                <div class="ystzCont listnews">
                                    <ul>
                                        <#list cate22InfoList as cate22Info>
                                            <div class="dNewsLeft">
                                                <a href="/info/${cate22Info.id}" target="_blank" title="${cate22Info.title}">${cate22Info.title}</a>
                                            </div>
                                            <div  class="dNewsRight">${cate22Info.addTime?date}</div>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                            <div class="bjlb">
                                <div class="more5">
                                    <a href="/class/list" target="_blank">查看所有班级</a>
                                </div>
                                <div class="bjpic">
                                </div>
                                <div class="bjlist">
                                    <ul>
                                        <#list classList as class>
                                            <li>
                                                <a href="/class/${class.id}" target="_blank" title="${class.name}" >${class.name}</a>
                                            </li>
                                        </#list>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="ctrt fl">
                            <div id="box_title">大家在说</div>
                            <div id="con">
                                <div class="bottomcover" style="z-index:2;"></div>
                                <ul>
                                    <li>
                                        <div class="div_left"><a href="http://www.htmleaf.com/"><img src="img/head.jpg" title="Jarvis_风"></a></div>
                                        <div class="div_right">
                                            <a href="http://www.htmleaf.com/" target="_blank">Jarvis_风</a>：唉，总是在越忙的时候事情越多。。。我的神曲你在哪里呀~~~亲耐滴你再不出来你就木有人疼了！！#248#ds公司疯狗萨哥官方身上轧人挪活
                                            <div class="twit_item_time">3分钟前</div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_left"><a href="http://www.htmleaf.com/"><img src="img/head.jpg" title="Jarvis_风"></a></div>
                                        <div class="div_right">
                                            <a href="http://www.htmleaf.com/" target="_blank">Jarvis_风</a>：看来今天收到礼品的亲们不少哦~
                                            <div class="twit_item_time">13分钟前</div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_left"><a href="http://www.htmleaf.com/"><img src="img/head.jpg" title="Jarvis_风"></a></div>
                                        <div class="div_right">
                                            <a href="http://www.htmleaf.com/" target="_blank">Jarvis_风</a>：【打扰了，@EsonLong_摄视度，微博网友请您帮助】&ldquo; 请问係广州有冇鸿福堂吖？想试试啊，平时静係 ...&rdquo;帮助回答请点击http://www.htmleaf.com ，谢谢！[不想被求助点击http://www.htmleaf.com ]
                                            <div class="twit_item_time">16分钟前</div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_left"><a href="http://www.htmleaf.com/"><img src="img/head.jpg" title="Jarvis_风"></a></div>
                                        <div class="div_right">
                                            <a href="http://www.htmleaf.com/" target="_blank">Jarvis_风</a>：【新型电话骗局盯上有线电视用户】一些市民接到陌生电话，提醒自家的宽带和有线电视就要到期了，在两小时内不续费就要被断网。警方提醒，这是一种新的电话骗局方式，骗子的最终目的是让受害人把资金转移到所谓的&ldquo;安全账户&rdquo;里。警方提醒大家万一遇到类似情况，可以拨打正规客服电话咨询哦。
                                            <div class="twit_item_time">17分钟前</div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_left"><a href="http://www.htmleaf.com/"><img src="img/head.jpg" title="Jarvis_风"></a></div>
                                        <div class="div_right">
                                            <a href="http://www.htmleaf.com/" target="_blank">Jarvis_风</a>：【什么时候才能看见外星人啊】《西班牙渔夫意外拍的军方与飞碟UFO对峙》  http://www.htmleaf.com  （分享自 @土豆网）
                                            <div class="twit_item_time">18分钟前</div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_left"><a href="http://www.htmleaf.com/"><img src="img/head.jpg" title="Jarvis_风"></a></div>
                                        <div class="div_right">
                                            <a href="http://www.htmleaf.com/" target="_blank">Jarvis_风</a>：小小骑手牵着小小马儿。你俩是来参加卖萌大赛的吧！！！！
                                            <div class="twit_item_time">22分钟前</div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="div_left"><a href="http://www.htmleaf.com/"><img src="img/head.jpg" title="Jarvis_风"></a></div>
                                        <div class="div_right">
                                            <a href="http://www.htmleaf.com/" target="_blank">Jarvis_风</a>：学会沉默，至少平静。有时候，被人误解，不想争辩，所以选择沉默。本来就不是所有人都得了解你，因此不必对全世界喊话。生命中往往有连舒伯特都无言以对的时刻，毕竟不是所有的是非都能条列清楚，甚至可能根本没有真正的是与非。那么，不想说话，就不说吧，在多说无益的时候，也许沉默就是最好的解释。
                                            <div class="twit_item_time">1小时前</div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="cmiddlebox">
                        <div class="jyky fl">
                            <div class="more3 allm">
                                <a href="/info/list/22" target="_blank"></a>
                            </div>
                            <div class="jykyCont listnews">
                                <ul>
                                    <#list cate15InfoList as cate15Info>
                                        <div class="dNewsLeft">
                                            <a href="/info/${cate15Info.id}" target="_blank" title="${cate15Info.title}">${cate15Info.title}</a>
                                        </div>
                                        <div  class="dNewsRight">${cate15Info.addTime?date}</div>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                        <div class="yebj fl">
                            <div class="more4 allm">
                                <a href="/info/list/17" target="_blank"></a>
                            </div>
                            <div class="jykyCont listnews">
                                <ul>
                                    <#list cate17InfoList as cate17Info>
                                        <div class="dNewsLeft">
                                            <a href="/info/${cate17Info.id}" target="_blank" title="${cate17Info.title}">${cate17Info.title}</a>
                                        </div>
                                        <div  class="dNewsRight">${cate17Info.addTime?date}</div>
                                    </#list>
                                </ul>
                            </div>
                        </div>
                        <div class="tzbox fl">
                            <div class="tzpic">
                                <a href="list.aspx?cid=1&did=208" target="_blank">
                                    <img src="img/m103_pic.jpg" /></a></div>
                        </div>
                    </div>
                    <div class="cbot">
                        <div class="bottom">
                            <div class="bottop">
                                <div class="bot01">
                                    <div>
                                        <b>玛利亚的奇迹蒙特梭利儿童之家</b></div>
                                    <div>电话：010-82011145</div>
                                    <div>地址：北京市朝阳区安贞街道裕民路</div>
                                </div>
                                <div class="bot02">
                                    <div style="font-family: 黑体; font-size: 16px;">
                                    	总访问量：<em class="number" id="vtime"></em></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--<div class="cline fl crt">
                </div>-->
                <div class="mbottom">
            	</div>
            </div>
        </div>
    </div>
	</body>
</html>
