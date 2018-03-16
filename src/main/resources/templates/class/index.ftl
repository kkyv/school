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
        body{margin: 0px; padding: 0px;}
        ol, ul ,li{list-style:none; padding: 0px; margin: 0px;}
        a{color:#000000;text-decoration:none}
        img,div{border: 0px;}
        .clearfloat{float: none;}
        .left{float: left;}
        .right{float: right;}
        .gree_box{border: 1px #b3db84 solid; border-radius: 3px; width: 240px;}
        .c_img_box{padding-left: 12px; float: left;}
        .c_img_box img{width: 65px; height: 65px; display: block; margin-bottom: 5px;}
        .c_img_box span{display: block; text-align: center; font-size: 12px; color: #626262; }
        .c_img_box span:last-child{ margin-bottom: 10px;}
        .noshow{visibility: hidden;}
        .show{visibility: visible;}
        .button{color: #ccae72; font-size: 14px;}

        .dbody{width: 100%; background-image: url(/img/c_18.jpg); background-repeat: repeat-x;}
        .dsize{width: 1080px; margin: 0px auto;}
        .head{width: 100%; }
        #nav{ width:100%; height:60px; background:#99D511; box-shadow: 5px 5px 3px #c1c1c1; border-radius: 5px;}
        #nav ul{width: 1080px;}
        #nav li{display:inline; height:60px;}
        #nav li a{display:inline-block; padding:0 10px; height:60px; line-height:60px;  width: 100px; text-align: center;
            color:#FFF; font-family:"\5FAE\8F6F\96C5\9ED1"; font-size:16px}
        #nav li a:hover{background: limegreen;}
        .link{height: 60px; width: 200px; margin-right: 20px;}
        .link > div{width: 95px; background-color: #FCC300; height: 100%;}
        .link > div:first-child{margin-right: 10px; }
        .link_box{ border: 2px dashed #fff; margin: 3px; height: 50px; border-radius: 2px;}
        .link_box a{display: block; height: 50px; text-align: center; line-height: 50px; color: #B16021; font-size: 18px;}
        .link_box a:hover{color: #fff; background-color: #FE9E00;}

        .center{margin-top: 15px;}

        .clas_info{background-image: url(/img/gai_33.jpg); width: 240px; height: 180px; background-repeat: no-repeat;}
        .edit_class_info{height: 65px; text-align: right; line-height: 65px; padding-right: 20px;}
        .class_marque{margin-left: 25px; width: 195px; margin-top: -13px;}
        .class_marque marquee{ height: 70px; font-size: 13px;}
        .birthday{ height: 145px;}
        /*.bheads{padding-left: 20px; float: left;}
        .bheads img{width: 80px; height: 80px; display: block; margin-bottom: 5px;}
        .bheads span{display: block; text-align: center; color: #626262; font-size: 13px;}*/
        .box_head{margin: 5px 10px; line-height: 25px; height: 25px; background-image: url(/img/c_1332.jpg); background-repeat: no-repeat;}
        .box_head_text{color: #177a1c; padding-left: 25px; font-weight: bold; overflow: hidden; font-size: 14px;}

        .browser{  height: 130px; margin-top: 10px;}

        .count{ height: 85px; margin-top: 10px;}
        .count table{font-size: 13px; color: #89827E; margin-left: 15px;}
        .num{font-size: 14px; color: #177a1c; margin-right: 10px;}

        .right_top{border: 1px #c1c1c1 solid; border-radius: 3px;}
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
        <div class="head">
            <div class="headimg">
                <img src="/img/c_20.jpg"/>
            </div>
        </div>
        <nav id="nav">
            <ul >
                <li><a href="#">班级首页</a></li>
                <li><a href="/class/photo">班级相册</a></li>
                <li><a href="/class/child">班级成员</a></li>
                <li><a href="/class/bbs">留言板</a></li>
                <div class="right link noshows">
                    <div class="noshow left">
                        <div class="link_box">
                            <a href="/admin/">管理页面</a>
                        </div>
                    </div>
                    <div class="left">
                        <div class="link_box">
                            <a href="/">网站首页</a>
                        </div>
                    </div>
                </div>
            </ul>
        </nav>
        <div class="center">
            <div class="left">
                <div class="clas_info">
                    <div class="edit_class_info">
                        <a href="#" class="show button">编辑</a>
                    </div>
                    <div class="class_marque">
                        <marquee scrollamount="1" direction="up"  onmouseover="this.stop();" onmouseout="this.start();">
                            额外功能为哦同欧俄波vu办呢我去过后二个后期若不额外功能为哦同欧俄波vu办呢
                            我去过后二个后期若不额外功能为哦同欧俄波vu办呢我去过后二个后期若不额外功
                            能为哦同欧俄波vu办呢我去过后二个后期若不
                        </marquee>
                    </div>
                </div>
                <div class="birthday gree_box">
                    <div class="box_head">
                        <span class="box_head_text">生日</span>
                    </div>
                    <div class="c_img_box">
                        <img src="/img/nophoto.jpg"/>
                        <span>生日</span>
                        <span>名字</span>
                    </div>
                    <div class="c_img_box">
                        <img src="/img/nophoto.jpg"/>
                        <span>生日</span>
                        <span>名字</span>
                    </div>
                    <div class="c_img_box">
                        <img src="/img/nophoto.jpg"/>
                        <span>生日</span>
                        <span>名字</span>
                    </div>
                </div>
                <div class="browser gree_box">
                    <div class="box_head">
                        <span class="box_head_text">来访记录</span>
                    </div>
                    <div class="c_img_box">
                        <img src="/img/nophoto.jpg"/>
                        <span>名字</span>
                    </div>
                    <div class="c_img_box">
                        <img src="/img/nophoto.jpg"/>
                        <span>名字</span>
                    </div>
                    <div class="c_img_box">
                        <img src="/img/nophoto.jpg"/>
                        <span>名字</span>
                    </div>
                </div>
                <div class="count gree_box">
                    <div class="box_head">
                        <span class="box_head_text">班级统计</span>
                    </div>
                    <div>
                        <table>
                            <tr>
                                <td>班级相片：</td>
                                <td class="num">20</td>
                                <td>张</td>
                            </tr>
                            <tr>
                                <td>班级相片：</td>
                                <td class="num">20</td>
                                <td>张</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="right right_top">
                <div class="imgBorder left">
                    <div class="bigImg">
                        <div class="bigImg_info">
                            <img src="/img/nophoto.jpg" width="395px" height="320px" />
                        </div>
                    </div>
                </div>
                <div class="info right" style="">
                    <div id="box_title">大家正在说</div>
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
                        <div class="img_box left">
                            <a href="#">
                                <img src="/img/nophoto.jpg"/>
                            </a>
                        </div>
                        <div class="img_box left">
                            <a href="#">
                                <img src="/img/nophoto.jpg"/>
                            </a>
                        </div>
                        <div class="img_box left">
                            <a href="#">
                                <img src="/img/nophoto.jpg"/>
                            </a>
                        </div>
                        <div class="img_box left">
                            <a href="#">
                                <img src="/img/nophoto.jpg"/>
                            </a>
                        </div>
                        <div class="img_box left">
                            <a href="#">
                                <img src="/img/nophoto.jpg"/>
                            </a>
                        </div>
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