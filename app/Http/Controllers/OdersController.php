<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Customer;
use App\Bill;
use App\BillDetail;
use DB;
class OdersController extends Controller
{
  public function getlist()
  {
  	$bill=Bill::all();  
  	return view("admin.order.list",compact("bill"));
  }
  public function getorder($id)
  {
  	$data = DB::table('bill_detail')
    			 	->join('products', 'products.id', '=', 'bill_detail.id_product')
    			 	
    			 	->where('id_bill',$id)
    			 	->get();
 
   return view('admin.order.detail',compact("data"));
  }

  public function delete($id)
  {

   $theloai=Bill::find($id);
      $theloai->delete();
   return redirect("admin/order/list")->with("thongbao","đã xóa thành công");
  }
}
