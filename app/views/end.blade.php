<script type="text/javascript" src="<?php echo URL::to('public/js/jquery.js');?>"></script>
<script type="text/javascript" src="<?php echo URL::to('public/js/bootstrap.min.js');?>"></script>

	<!-- PARSLEY VALIDATION -->
	<script type="text/javascript" src="<?php echo URL::to('public/vendor/parsley/parsley.js');?>"></script>
	<script>
	if ($('.validateJSForm').length) {
		$('.validateJSForm').parsley();
	}
	</script>
	<!-- END PARSLEY VALIDATION -->
	
	
	<!-- DATA TABLES -->
	<script type='text/javascript' src="<?php echo URL::to('public/vendor/datatables/datatables.min.js');?>"></script>  
	<script type='text/javascript' src="<?php echo URL::to('public/vendor/datatables/datatables-bootstrap.js');?>"></script>    
	<script>
		$('.solsoTable').dataTable();
	</script>
	<!-- END DATA TABLES -->	


	<!-- CKEDITOR -->
    <script type='text/javascript' src="<?php echo URL::to('public/vendor/ckeditor/ckeditor.js');?>"></script>
	<script type='text/javascript' src="<?php echo URL::to('public/vendor/ckeditor/adapters/jquery.js');?>"></script>
	<script>
	function solsoShowEditor() {
		UPLOADCARE_PUBLIC_KEY = "demopublickey";

        if ($('.solsoEditor').length) {
            $( 'textarea.solsoEditor' ).ckeditor({
                uiColor: '#9AB8F3',
                height: 300,
             });
        }
	}
	
	solsoShowEditor();
	</script>	
	<!-- CKEDITOR -->

	
	<!-- CHART.JS -->
	<script type="text/javascript" src="<?php echo URL::to('public/vendor/chart.js/chart.min.js');?>"></script>
	<script>
	@if (isset($label1))
		var barChartClients = {
			labels: [ {{ $label1 }} ],
			datasets: [
				{
					fillColor: "rgba(220,220,220,0.5)",
					strokeColor: "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data: [ {{ $reportClients }} ]
				}
			]
		}
		
		var barChartTickets = {
			labels: [ {{ $label1 }} ],
			datasets: [
				{
					fillColor: "rgba(220,220,220,0.5)",
					strokeColor: "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data: [ {{ $reportTickets }} ]				
				}
			]
		}	
	@endif

	@if (isset($label2))	
		var barChartClientsProjects2 = {
			labels: [ {{ $label2 }} ],
			datasets: [
				{
					fillColor: "rgba(220,220,220,0.5)",
					strokeColor: "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data: [ {{ $reportClients2 }} ]
				},
				{
					fillColor: "rgba(151,187,205,0.5)",
					strokeColor: "rgba(151,187,205,0.8)",
					highlightFill: "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data: [ {{ $reportProjects2 }} ]				
				}
			]
		}
		
		var barChartEstimatesInvoices2 = {
			labels: [ {{ $label2 }} ],
			datasets: [
				{
					fillColor: "rgba(220,220,220,0.5)",
					strokeColor: "rgba(220,220,220,0.8)",
					highlightFill: "rgba(220,220,220,0.75)",
					highlightStroke: "rgba(220,220,220,1)",
					data: [ {{ $reportEstimates2 }} ]				
				},
				{
					fillColor:  "rgba(151,187,205,0.5)",
					strokeColor: "rgba(151,187,205,0.8)",
					highlightFill : "rgba(151,187,205,0.75)",
					highlightStroke : "rgba(151,187,205,1)",
					data : [ {{ $reportInvoices2 }} ]
				}
			]
		}		
	@endif	
	
	window.onload = function(){
		if ($('#reportClients').length) {
			var ctx = document.getElementById("reportClients").getContext("2d");
			window.myBar = new Chart(ctx).Bar(barChartClients, {
				responsive: true
			});
		}
		
		if ($('#reportTickets').length) {
			var ctx = document.getElementById("reportTickets").getContext("2d");
			window.myBar = new Chart(ctx).Bar(barChartTickets, {
				responsive: true
			});		
		}
		
		if ($('#reportClientsProjects2').length) {
			var ctx = document.getElementById("reportClientsProjects2").getContext("2d");
			window.myBar = new Chart(ctx).Bar(barChartClientsProjects2, {
				responsive: true
			});
		}
		
		if ($('#reporEstimatesInvoices2').length) {
			var ctx = document.getElementById("reporEstimatesInvoices2").getContext("2d");
			window.myBar = new Chart(ctx).Bar(barChartEstimatesInvoices2, {
				responsive: true
			});		
		}			
	}	
	</script>
	<!-- END CHART.JS -->
	

	<!-- GROWL -->
	<script type='text/javascript' src="<?php echo URL::to('public/vendor/growl/jquery.growl.js');?>"></script>  
	<!-- END GROWL-->		
	
	
	<!-- PERFECT-SCROLLBAR -->	
	<script type="text/javascript" src="<?php echo URL::to('public/vendor/perfect-scrollbar/perfect-scrollbar.min.js');?>"></script>
	<script>	
		menuSidebarHeight = $('#solso-sidebar').height() + 50;
		sideBarHeight	  = $('.sidebar').height();

		if ( menuSidebarHeight >= sideBarHeight )	{
			$('.perfectScrollbar').perfectScrollbar();
		}	
	</script>	
	<!-- END PERFECT-SCROLLBAR -->		
	
	
	<!-- === SOLUTII SOFT === -->
	<script>
		/* === SETTINGS && MODALS === */
		$( document ).on('click', '.solsoAjax', function(){
			
			var solsoSelector	= $(this);
			var solsoFormData 	= $(solsoSelector).closest('form').serialize();
			var	solsoFormAction	= solsoSelector.attr('data-href');
			var solsoFormMethod	= solsoSelector.attr('data-method');
			var returnTO		= solsoSelector.attr('data-return');

			valid = true;
			
			if (solsoSelector.closest('form').length > 0) {
				valid = solsoSelector.closest('form').parsley().validate();
			}

			if (valid) {
				$.ajax({
					url: 	solsoFormAction,
					type: 	solsoFormMethod,
					data: 	solsoFormData,
					dataType: 'html',
					success:function(data) {
						if (data == 0) {
							$.growl.error({ title: 'ACCESS DENIEND', message: 'ACCESS DENIEND' });
						} else {			
							$('#' + returnTO).html(data);
							
							if ( $(data).find('.table').attr('data-alert') ) {
								var getError = $(data).find('.table').attr('data-alert');
							} else if ( $(data).closest('table').attr('data-alert') ) {
								var getError = $(data).closest('table').attr('data-alert');	
							} else {	
								var getError = $(data).find("[name='solsoStatus']").val();
							}
							
							if ( getError == '1' ) {
								$.growl.notice({ title: solsoSelector.attr('data-message-title'), message: solsoSelector.attr('data-message-success') });
							} else if ( getError == '2' ) {	
								$.growl.warning({ title: solsoSelector.attr('data-message-title'), message: solsoSelector.attr('data-message-warning') });
							} else {
								$.growl.error({ title: solsoSelector.attr('data-message-title'), message: solsoSelector.attr('data-message-error') });
							}
							
							if ( $(data).closest('table').attr('data-alert') ) {
								$('#ajaxTable').html(data);
								$('.solsoTable').dataTable();
							}		

							solsoShowEditor();
						}
					}
				});			
			}
			
			return false;
		});		
		
		$( document ).on('click', '.solsoShowModal', function(){
			modalTitle = $(this).attr('data-modal-title');

			$.ajax({
				url: $(this).attr('data-href'),
				dataType: 'html',
				success:function(data) {
					if (data == 0) {
						$.growl.error({ title: 'ACCESS DENIEND', message: 'ACCESS DENIEND' });
					} else {					
						$('.solsoModalTitle').text(modalTitle.toString());
						$('.solsoShowForm').html(data);
						solsoShowEditor();
					}
				}
			});		
		});
		
		$( document ).on('click', '.solsoSave', function(e){
			e.preventDefault();

			var solsoSelector	= $(this);
			var solsoFormAction = solsoSelector.closest('form').attr('action');
			var solsoFormMethod = solsoSelector.closest('form').attr('method');
			var solsoFormData	= solsoSelector.closest('form').serialize();	
			
			valid = solsoSelector.closest('form').parsley().validate();
			
			if (valid) {
				$.ajax({
					url: 	solsoFormAction,
					type: 	solsoFormMethod,
					data: 	solsoFormData,
					cache: 	false,
					dataType: 'html',
					success:function(data) {
						if (data == 0) {
							$.growl.error({ title: 'ACCESS DENIEND', message: 'ACCESS DENIEND' });
						} else {

							if ( $(data).closest('table').attr('data-alert') ) {
								var getError = $(data).closest('table').attr('data-alert');
							} else if ( $(data).find('.table').attr('data-alert') ) {
								var getError = $(data).find('.table').attr('data-alert');
							} else if ( $(data).closest('form').attr('data-alert') ){	
								var getError = $(data).closest('form').attr('data-alert');
							} else if ( $(data).closest('form').attr('data-alert') ) {	
								var getError = $(data).find('form').attr('data-alert');
							} else {	
								var getError = 0;
							}						

							if ( getError == '1' ) {
								$('#solsoCrudModal').modal('hide');
								$('#ajaxTable').html(data);
								$('.span-' + solsoFormAction.split('/').pop()).text( $('.solsoTable').attr('data-all') );
								$.growl.notice({ title: solsoSelector.attr('data-message-title'), message: solsoSelector.attr('data-message-success') });
							} else if ( getError == '2' )  {	
								$.growl.warning({ title: solsoSelector.attr('data-message-title'), message: solsoSelector.attr('data-message-warning') });
							} else if ( getError == '4' )  {	
								$('.solsoShowForm').html(data);
								$('.span-new-ticket').text( $('.newTickets').attr('data-all') );
								$('.span-new-reply').text( $('.newReplies').attr('data-all') );
								$.growl.notice({ title: solsoSelector.attr('data-message-title'), message: solsoSelector.attr('data-message-success') });
							} else {
								$('.solsoShowForm').html(data);
								$.growl.error({ title: solsoSelector.attr('data-message-title'), message: solsoSelector.attr('data-message-error') });
							}
							
							$('.solsoTable').dataTable();
						}
					}
				});	
			}
			
			return false;
		});			
		
		$( document ).on('click', '.solsoConfirm', function(){
			$("#solsoFormDelete").prop('action', $(this).attr('data-href'));
			
			if ($(this).attr('data-return')) {
				$("#solsoFormDelete").attr('data-return', $(this).attr('data-return'));;
			}
		});
		
		$( document ).on('click', '.solsoDelete', function(e){
			e.preventDefault();
			
			var solsoSelector	= $(this);
			var solsoFormAction = $('#solsoFormDelete').attr('action');
			
			if ($('#solsoFormDelete').attr('data-return')) {
				var returnTO = $('#solsoFormDelete').attr('data-return');
			}	
			
			$.ajax({
				url: 	solsoFormAction,
				type: 	'delete',
				cache: 	false,
				dataType: 'html',
				success:function(data) {
					$('.modal').modal('hide');
					
					if (returnTO) {
						$('#' + returnTO).html(data);
					} else {	
						$('#ajaxTable').html(data);
						$('.solsoTable').dataTable();
						dataRefresh = solsoFormAction.split('/');
						$('.span-' + dataRefresh[5]).text( $('.solsoTable').attr('data-all') );
					}
					
					$.growl.notice({ title: solsoSelector.attr('data-message-title'), message: solsoSelector.attr('data-message-success') });
				}
			});	
			
			return false;
		});				
		
		$('#solsoCrudModal').on('hidden.bs.modal', function () {
			var url      	= window.location.href;			
			var lastSegment = url.split('/').pop();
			var goTO		= '{{ Request::segment(1) }}';
			
			if ( lastSegment == 'admin' || lastSegment == 'dashboard' ){
				goTO = 'ticket';
			}
			
			$.ajax({
				url: 	goTO,
				type: 	'get',
				cache: 	false,
				dataType: 'html',
				success:function(data) {
					$('#ajaxTable').html(data);
					$('.solsoTable').dataTable();
				}
			});
		});
		/* === END MODALS === */

		/* === SIDEBAR === */
		$('.toogle').on('click', function() {
			$('.body').toggleClass('slide');
			$('.sidebar').toggleClass('show');
			$('.toogle i').toggleClass('fa-chevron-left fa-chevron-right');
		});
		/* === END SIDEBAR === */	

		/* === ELEMENTS ===  */
		$('html').on('keypress', '.modal', function(e) {
		   if (e.keyCode == 13) {
			  return false;
		   }
		});		
		/* === END ELEMENTS ===  */
	</script>
	<!-- === END SOLUTII SOFT === -->
	
</body>
</html>