<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Xcart_orders extends CI_Controller {

	public function index()
	{
		$this->load->view('goldUserTable_view');
	}
		
	public function showGoldUsers()
	{
		
		/* Loading helpers and library */
		$this->load->library("Xcart_ordersFactory");
		$this->load->helper('cookie');
		
		/* GET vars for the jTable plugin for sorting and pagination */
		$jtPageSize = $this->input->get('jtPageSize') ? $this->input->get('jtPageSize') : 10;
		$jtSorting = $this->input->get('jtSorting') ? $this->input->get('jtSorting') : 'userid';
		$jtStartIndex= $this->input->get('jtStartIndex') ? $this->input->get('jtStartIndex') : 0;

		/*excecute query*/
		$query = $this->xcart_ordersfactory->getGoldUserOrders($jtStartIndex , $jtSorting , $jtPageSize);
		
		/*If there are results in the query*/
		if ($query->num_rows() > 0) {
			$table = array();
			foreach ($query->result() as $row) {
				$table[] = $row;
			}
	
			/* 
			 * Using cookies that expire every day to save the query needed to fill the number of rows
			 * Required for the 'TotalRecordCount' jTable element
			 *  */
			if (!get_cookie('numrowscookie')) {
				
			    // cookie not set, first visit and calculate number of orders of gold users
				$recordCount = $this->xcart_ordersfactory->getGoldUserOrdersCount();
							
			    // create cookie to avoid hitting this case again
			    $cookie = array(
			        'name'   => 'numrowscookie',
			        'value'  => $recordCount,
			        'expire' => '86500',
			    );
			    set_cookie($cookie);
		}
		else{
			$recordCount = $this->input->cookie('numrowscookie');
		}
		
		//Return result to jTable
		$jTableResult = array();
		$jTableResult['Result'] = "OK";
		$jTableResult['TotalRecordCount'] = $recordCount;
		$jTableResult['Records'] = $table;
		print json_encode($jTableResult);

		return $table;
	}
		
		
	}
}

?>
