<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Xcart_ordersFactory {

	private $_ci;

 	function __construct()
    {
    	//When the class is constructed get an instance of codeigniter so we can access it locally
    	$this->_ci =& get_instance();
    	$this->_ci->load->model("xcart_orders_model");

	
    }



	public function getGoldUserOrders($jtStartIndex='0', $jtSorting = 'userid', $jtPageSize = 10 ) {
		
		/*
		 * We select all the elements from the table and join them with the top 10 users who have bought the most.
		 * $jtSorting indicates the sorting criteria
		 * $jtStartIndex and $jtPageSize indicate the maximum page size and the starting element to show
		 * */	
		 
		$sql = 'select *
		from xcart_orders 
		JOIN(SELECT userid 
		from xcart_orders 
		GROUP BY userid 
		ORDER BY COUNT(*) desc LIMIT 10) AS userproduct 
		ON xcart_orders.userid = userproduct.userid 
		order by xcart_orders.';
		$sql.=$jtSorting;
		$sql.= ' LIMIT '.$jtStartIndex.', '.$jtPageSize;
		
		/*
		 * Alternative in case we want the top spenders instead of those who have purchased the most
		$sql = 'select *
		from xcart_orders 
		JOIN(SELECT userid 
		from xcart_orders 
		GROUP BY userid 
		ORDER BY SUM(total) desc LIMIT 10) AS userproduct 
		ON xcart_orders.userid = userproduct.userid 
		order by xcart_orders.';
		$sql.=$jtSorting;
		$sql.= ' LIMIT '.$jtStartIndex.', '.$jtPageSize;*/
		
		$query = $this->_ci->db->query($sql);
	
	return $query;
    }
	
	public function getGoldUserOrdersCount( ) {
	//public function getGoldUserOrders() {
			
		/*
		 * We count the amount of orders the gold users have made
		 * */
		$sql = 'select count(*) 
		from xcart_orders 
		JOIN(SELECT userid 
		from xcart_orders 
		GROUP BY userid 
		ORDER BY COUNT(*) desc LIMIT 10) AS userproduct 
		ON xcart_orders.userid = userproduct.userid';
		
		/*
		 * Alternative for the most spenders instead of those who have purchased the most
		 * 
		 $sql = 'select count(*) 
		from xcart_orders 
		JOIN(SELECT userid 
		from xcart_orders 
		GROUP BY userid 
		ORDER BY SUM(total) desc LIMIT 10) AS userproduct 
		ON xcart_orders.userid = userproduct.userid';
		 * */
		
		$query = $this->_ci->db->query($sql);
		$query2 = $query->row_array();
		$recordCount = $query2['count(*)'];
		
	return $recordCount;
    }

	public function getAllGoldUserOrders( ) {
		
		/*
		 * We select all the elements from the table and join them with the top 10 users who have bought the most.
		 * This will be used to export to Excel
		 * */	
		 
		$sql = 'select *
		from xcart_orders 
		JOIN(SELECT userid 
		from xcart_orders 
		GROUP BY userid 
		ORDER BY COUNT(*) desc LIMIT 10) AS userproduct 
		ON xcart_orders.userid = userproduct.userid 
		order by xcart_orders.userid';
		$query = $this->_ci->db->query($sql);
		return $query;
	}


}



?>
