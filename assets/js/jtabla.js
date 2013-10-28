$(document).ready(function () {

    //Prepare jTable
	$('#Xcart_ordersContainer').jtable({
		animationsEnabled: true,
		loadingAnimationDelay: 500,
		title: 'Table of gold users\' orders',
		paging: true,
		pageSize: 10,
		sorting: true,
		defaultSorting: 'userid ASC',
		actions: {
			listAction: '/xcart_orders/showGoldUsers',
			createAction: '',
			updateAction: '',
			deleteAction: ''
		},
		fields: {
			orderid: {
				title: 'ORDER ID',
				key: true,
				create: false,
				edit: false,
				list: true,
				width: '20%'
			},
			userid: {
				title: 'USER ID',
				width: '30%'
			}
		},
		toolbar: {
			hoverAnimation: true,
			hoverAnimationDuration: 60,
			hoverAnimationEasing: undefined, 
		    items: [{
		        icon: '/assets/img/excel.png',
		        text: 'Export to Excel',
		        click: function () {
		            window.location = '/table_export';
		        }
		    }]
		}
	});

	//Load person list from server
	$('#Xcart_ordersContainer').jtable('load');

});
		
