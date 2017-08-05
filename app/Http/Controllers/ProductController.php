<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductType;
class ProductController extends Controller
{
    	public function getlist()
    	{
    		$product=Product::all();
    		return view("admin.product.list",compact("product"));
    	}
    	public function getedit($id)
    	{
    		$product=Product::find($id);
    		$category=ProductType::all();
    		return view("admin.product.edit",compact("product","category"));
    	}
    	public function postedit(Request $request,$id)
    	{


    		$product=Product::find($id);
    		$product->name=$request->name;
    		$product->description=$request->description;
    		$product->unit_price=$request->unit_price;
    		$product->promotion_price=$request->promotion_price;
    		$product->unit=$request->unit;
    		$product->tag=str_slug($request->name,"-");
    		$product->product_hot=$request->hot;
    		if($request->hasFile("image"))
    		{
    			$file=$request->file("image");
    			$name=$file->getClientOriginalName();
    			$image=str_random(4)."_".$name;
    			while(file_exists("image/product/".$image))
    			{
    				$img=str_random(4)."_".$name;
    			}
    			$file->move("image/product",$image);
    			unlink("image/product/".$product->image);
    			$product->image=$image;

    		}
    		$product->save();
    		return redirect("admin/product/list")->with("thongbao","sửa thành công");

    		
    	}
    	public function getadd()
    	{
    		$category=ProductType::all();
    		return view("admin.product.add",compact("category"));
    	}
    	public function postadd(Request $request)
    	{
         
    		$product=new Product();
    		$product->name=$request->name;
    		$product->description=$request->description;
    		$product->unit_price=$request->unit_price;
    		$product->promotion_price=$request->promotion_price;
    		$product->unit=$request->unit;
    		$product->tag=str_slug($request->name,"-");
    		$product->product_hot=$request->hot;
    		$product->id_type=$request->category;
    		if($request->hasFile("image"))
    		{
    			$file=$request->file("image");
    			$name=$file->getClientOriginalName();
    			$image=str_random(4)."_".$name;
    			while(file_exists("image/product/".$image))
    			{
    				$img=str_random(4)."_".$name;
    			}
    			$file->move("image/product",$image);
    		
    			$product->image=$image;

    		}
    		else
			{
				$product->image="";
			}
			$product->save();
			 return redirect('admin/product/list')->with("thongbao","Thêm thành công");
    	}
    	public function delete($id)
    	{
   			
    		$product=Product::find($id);
    		$product->delete();
    		return redirect("admin/product/list")->with("thongbao","xóa thành công");
    	}

}
