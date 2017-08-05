<?php

namespace App\Http\Controllers;
use App\Slide;
use App\Product;
use Illuminate\Http\Request;
use App\ProductType;
use Cart;
use App\Customer;
use App\Bill;
use App\BillDetail;
class PagesController extends Controller
{
    public function getindex()
    {
         $content=Cart::content();
         $count=Cart::count();
         $total=Cart::total();
    	$slide=Slide::all();
    	$new_product=Product::orderby("id","DESC")->paginate(4);
    	$khuyenmai=Product::where("promotion_price","<>",0)->paginate(8);
    	return view('trangchu',compact("content","total","count","slide","new_product","khuyenmai"));
    }
    public function getProduct_category($type)
    {

        $sp_theoloai=Product::where("id_type",$type)->paginate(6);
        $sp_khac=Product::where("id_type","<>",$type)->paginate(3);
        $loai= ProductType::all();
        $loai_sp=ProductType::where("id",$type)->first();
    	return view("product_category",compact("sp_theoloai","sp_khac","loai","loai_sp"));
    }
    public function getProduct_detail(Request $request)
    {
        $product=Product::where("id",$request->id)->first();
        $sanpham_cungloai=Product::where("id_type",$product->id_type)->paginate(6);
        $product_hot=Product::where("product_hot",1)->take(4)->get();
        $new_product=Product::orderby("id","DESC")->take(4)->get();
    	return view("product_detail",compact("product","sanpham_cungloai","product_hot","new_product"));
    }
    public function muahang($id)
    {
        $product_by=Product::where("id",$id)->first();
        Cart::add(['id' => $id, 'name' =>$product_by->name, 'qty' => 1, 'price' => $product_by->unit_price, 'options' => ['img' => $product_by->image,'promotion_price' => $product_by->promotion_price]]);
        $content=Cart::content();
      return redirect("giohang");
    }
    public function giohang()
    {
        $content=Cart::content();
        $total=Cart::total();
        $count=Cart::count();

        return view("muahang",compact("content","total","count"));
    }
 
    public function xoa($id)
    {
    Cart::remove($id);
    return redirect("giohang");
    }
     public function destroy()
    {
    Cart::destroy();
    return redirect("giohang");
    }
     public function checkout()
    {
         $content=Cart::content();
        return view("checkout",compact("content"));
    }
    public function getupdatecart($id,$qty,$dk)
    {
      if ($dk=='up')
        {
         $qt = $qty+1;
         Cart::update($id, $qt);
         return redirect("giohang");
        } 
      else
        if ($dk=='down') 
            {
             $qt = $qty-1;
             Cart::update($id, $qt);
             return redirect("giohang");
        } 
      else 
        {
         return redirect()->route('getcart');
        }
    }
    public function postcheckout(Request $request)
    {
        
          $total =0;
        foreach (Cart::content() as $row) 
        {
            if($row->options->promotion_price==0)
                 $total = $total + ( $row->qty * $row->price);
                
             else
                    $total = $total + ( $row->qty * $row->options->promotion_price); 
                
        }
            $customer=new Customer();
                $customer->name=$request->name;
                $customer->gender=$request->gender;
                $customer->email=$request->email;
                $customer->address=$request->address;
                $customer->phone_number=$request->phone;
                $customer->note=$request->note;
                $customer->save();
            $bill=new Bill();   
                $bill->id_customer= $customer->id;
                $bill->date_order=date("Y-m-d");
                $bill->total=floatval($total);
                $bill->payment=$request->payment;
                $bill->note=$request->note;
                 $bill->save();
                foreach(Cart::content() as $key=>$value)
                {
                    $bill_detail=new BillDetail();
                    $bill_detail->id_bill=$bill->id;
                    $bill_detail->id_product=$value->id;
                    $bill_detail->quantity=$value->qty;
                  
                    $bill_detail->save();
                }
            Cart::destroy(); 
 return redirect()->back()->with("thongbao","đặt hàng thành công");

    }
    public function getsearch(Request $request)
    {
        $tukhoa=$request->tukhoa;
        $product=Product::where('name','like',"%$tukhoa%")->take(5)->paginate(8);
        return view("search",compact("product","tukhoa"));
    }
    public function getcontact()
    {
    	return view("contact");
    }
     public function getabout()
    {
    	return view("about");
    }
}
