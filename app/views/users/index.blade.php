@include('begin')

<header>
	@include('users.navbar')
</header>

<main class="body slide">
	<aside class="sidebar show perfectScrollbar">
		@include('users.sidebar')
	</aside>
	
	<div class="container-fluid">
	<div class="row">
		@yield('content')
		
		@include('assets.modals.modal-crud')
		@include('assets.modals.modal-delete')		
	</div>
	</div>
</main>

@include('end')