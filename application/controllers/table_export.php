<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Table_export extends CI_Controller {
 

 
    function index($table_name = "Xcart_orders")
    {
    	//we get the table from the database
        $this->load->library("Xcart_ordersFactory");	
        $query = $this->xcart_ordersfactory->getAllGoldUserOrders();
 
        if(!$query)  return false;
		
		//we load the excel third party app
 		$this->load->library('Excel');

 
        $objPHPExcel = new PHPExcel();
        $objPHPExcel->getProperties()->setTitle("export")->setDescription("none");
 
        $objPHPExcel->setActiveSheetIndex(0);
 
        // Field names in the first row
        $fields = $query->list_fields();
        $col = 0;
        foreach ($fields as $field)
        {
            $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, $field);
            $col++;
        }
 
        // Fetching the table data
        $row = 2;
        foreach($query->result() as $data)
        {
            $col = 0;
            foreach ($fields as $field)
            {
                $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $data->$field);
                $col++;
            }
 
            $row++;
        }
 
        $objPHPExcel->setActiveSheetIndex(0);
 
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
 
        // Sending headers to force the user to download the file
        header('Content-Type: application/vnd.ms-excel');
        header('Content-Disposition: attachment;filename="GoldUser_Orders_'.date('dMy').'.xls"');
        header('Cache-Control: max-age=0');
 
        $objWriter->save('php://output');
    }
 
}
?>