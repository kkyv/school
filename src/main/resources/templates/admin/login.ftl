<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="utf-8" />
		<title></title>

		<script src="js/ecenter.js" type="text/javascript"></script>

		<script src="http://www.51yey.com/jQuery/jquery-1.4.2.min.js" type="text/javascript"></script>

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
				$("#form1").submit();
            }
		</script>
	</head>

	<body>
		<form method="post" action="/admin/login" id="form1">
			<div class="s">
				<div class="h">
					<div class="n">
					</div>
					<div class="r">
						<a href="http://www.51yey.com?f=elogin" target="_blank"></a>
					</div>
				</div>
				<div class="c">
					<table>
						<tr>
							<td>
								用户名

							</td>
							<td>
								<input name="id" class="i" type="text" value="10001"/>
							</td>
						</tr>
						<tr>
							<td>
								密&nbsp;&nbsp;码

							</td>
							<td>
								<input name="password" class="i" type="password" value="123"/>
								<a href="/login/getpwd.aspx" target="_blank">忘记密码？</a>
							</td>
						</tr>

						<tr>
							<td>
							</td>
							<td>
								<a href="javascript:void(0)">
									<img style="border: none" onclick="doLogin_onclick(); return false;" src="/img/wueren_17.jpg" alt="登录" /></a>&nbsp;&nbsp;
							</td>
						</tr>
					</table>
				</div>
			</div>
		</form>
	</body>
</html>