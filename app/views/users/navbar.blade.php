<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
<div class="container-fluid">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>

		<div class="brand">
			<a class="navbar-brand" href="#"><span>{{ trans('translate.app_name') }}</span></a>
			<a class="toogle pull-right"><i class="fa fa-chevron-left"></i> </a>
		</div>		
	</div>

	<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
		<ul class="nav navbar-nav">
			<li>
				<p class="navbar-text">{{ trans('translate.signed_in_as') }} {{ $user->name }}</p>
			</li>
		</ul>
		
		<ul class="nav navbar-nav navbar-right">
			<li>
				<a href="<?php echo URL::to('logout');?>">
					<i class="fa fa-sign-out"></i> {{ trans('translate.logout') }}
				</a>
			</li>
		</ul>
	</div>
</div>
</nav>