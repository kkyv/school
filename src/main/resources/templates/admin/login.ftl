<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <title></title>

    <script type="text/javascript" src="/js/jquery-1.9.1.min.js"></script>
    <style type="text/css">
        body {
            background-image: url(/img/lback.jpg);
            background-repeat: no-repeat;
            background-position: center 0px;
            margin: 0px;
            padding: 0px;
            font-family: 宋体;
            background-color: #FFF4A8;
        }

        .h {
            overflow: hidden;
            height: 250px;
            position: relative;
        }

        .s {
            width: 980px;
            margin: 0px auto;
            overflow: hidden;
        }

        .n {
            left: 220px;
            top: 90px;
            font-family: 幼圆;
            font-size: 18px;
            font-weight: bold;
            color: #690a04;
            position: absolute;
        }

        .r {
            right: 120px;
            top: 30px;
            position: absolute;
        }

        .r a {
            display: inline-block;
            width: 124px;
            height: 45px;
        }

        .footer {
            margin-top: 10px;
            height: 36px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .ffl {
            width: 11px;
            height: 36px;
            background-image: url(/img/ht_139.jpg);
        }

        .ffr {
            width: 8px;
            height: 36px;
            background-image: url(/img/ht_148.jpg);
        }

        .fm {
            border-bottom: 1px solid #c5ee90;
            border-top: 1px solid #c5ee90;
            height: 24px;
            width: 961px;
            text-align: center;
            padding-top: 10px;
            font-size: 12px;
            background-color: White;
        }

        .fm a {
            text-decoration: none;
            color: #666666;
        }

        .fl {
            float: left;
        }

        .fr {
            float: right;
        }

        .c {
            height: 440px;
            position: relative;
        }

        .c table {
            left: 200px;
            top: 0px;
            position: absolute;
        }

        .c table td {
            height: 50px;
            color: #666666;
        }

        .c table td a {
            color: #666666;
        }

        .i {
            border: 1px solid #b8b8b8;
            height: 28px;
            width: 220px;
            font-size: 18px;
            line-height: 28px;
            font-family: Arial;
        }
    </style>
    <script type="text/javascript">
        function doLogin_onclick() {
            $("form").submit();
        }
    </script>
</head>

<body>
    <div class="aspNetHidden">
        <input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJNzgzNDMwNTMzZGQ=" />
    </div>

    <div class="s">
        <div class="h">
            <div class="n">
            </div>
            <div class="r">
            </div>
        </div>
        <div class="c">
            <form action="/admin/login" method="post">
            <table>
                <tr>
                    <td>
                        用户名

                    </td>
                    <td>
                        <input id="username" name="id" class="i" type="text" />
                    </td>
                </tr>
                <tr>
                    <td>
                        密&nbsp;&nbsp;码

                    </td>
                    <td>
                        <input id="password" class="i" name="password" type="password" />
                        <a href="#" target="_blank">忘记密码？</a>
                    </td>
                </tr>

                <tr>
                    <td>
                    </td>
                    <td>
                        <a href="javascript:void(0)">
                            <img style="border: none" onclick="doLogin_onclick()" src="/img/wueren_17.jpg" alt="登录" /></a>&nbsp;&nbsp;
                    </td>
                </tr>
            </table>
            </form>
        </div>
    </div>
</body>
</html>