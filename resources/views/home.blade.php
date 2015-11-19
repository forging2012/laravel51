<!DOCTYPE html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	@if(url(Request::getRequestUri()) == 'http://note.mango.im')
		<meta name="description" content="芒果笔记，记录生活和技术(PHP And Laravel)">
	@endif
	<meta name="author" content="Roy">
	<link rel="icon" href="{{asset('favicon.ico')}}">

	<title>@yield('title')芒果笔记</title>

	<!-- Bootstrap core CSS -->
	<link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="{{ asset('home-assets/css/blog.css') }}" rel="stylesheet">

	<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
	<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
	<script src="{{ asset('home-assets/js/ie-emulation-modes-warning.js') }}"></script>

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!--[if lt IE 9]>
	<script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body>

<div class="blog-masthead">
	<div class="container">
		<nav class="blog-nav">
			<a class="blog-nav-item active" href="{{url('/')}}">Home</a>
			<a class="blog-nav-item" href="{{url('/about')}}">About</a>
		</nav>
	</div>
</div>

<div class="container">

	<div class="blog-header">
		<h1 class="blog-title">芒果笔记</h1>
		<p class="lead blog-description">记录生活和技术。</p>
	</div>

	<div class="row">

		@yield('content')

		<div class="col-sm-3 col-sm-offset-1 blog-sidebar">
			<div class="sidebar-module sidebar-module-inset">
				<h4>Sponsor</h4>
				<p>阿里云9折优惠码：<strong>DXGS73</strong></p>
			</div>

			<div class="sidebar-module">
				{{--{{var_dump($categories)}}--}}
				<ul class="list-unstyled">
					<h4>Categories</h4>
					@foreach($categories as $category)
						<li>
							<a href="{{url('category/'.$category->id)}}">@if($category->pid) &nbsp;&nbsp;&nbsp;— @endif
								{{ $category->name }}</a>
						</li>
					@endforeach
				</ul>
			</div>

			<div class="sidebar-module">
				<h4>Elsewhere</h4>
				<ol class="list-unstyled">
					<li><a href="https://github.com/mangoim" target="_blank">GitHub</a></li>
				</ol>
			</div>

		</div><!-- /.blog-sidebar -->

	</div><!-- /.row -->

</div><!-- /.container -->

<footer class="blog-footer">
	<p>Made with ❤ code base Laravel5.1 and Bootstrap By <a href="http://mango.im" title="芒果网" target="_blank">mango.im</a></p>
	<p>
		<a href="#">Back to top</a>
	</p>
</footer>

<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="{{ asset('home-assets/js/ie10-viewport-bug-workaround.js') }}"></script>
</body>
</html>
