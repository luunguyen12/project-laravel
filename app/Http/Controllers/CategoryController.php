<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductType;
use App\Product;
class CategoryController extends Controller
{
    public function getlist()
    {	
    	$theloai=ProductType::all();
    	return view("admin.category.list",compact("theloai"));
    }
    public function getedit($id)
    {
    	$theloai=ProductType::find($id);
    	return view("admin.category.edit",compact("theloai"));
    }
    public function postedit(Request $request,$id)
    {
    	$this->validate($request ,
    		["name"=>"unique:type_products|min:3|max:100"],
    		[
    		"name.unique"=>"tên thể loại đã tồn tại",
    		"name.min"=>"thể loại từ 3 đến 100 ký tự",
    		"name.max"=>"thể loại từ 3 đến 100 ký tự"]);
    		$theloai=ProductType::find($id);
    		$theloai->name=$request->name;
    		$theloai->tag=str_slug($request->name,"-");
    		$theloai->save();
    		return redirect("admin/category/list")->with("thongbao","sửa thành công");
    }
    public function getadd()
    {

    	return view("admin.category.add");
    }
    public function postadd(Request $request)
    {
    	$this->validate($request ,
    		["name"=>"unique:type_products|min:3|max:100"],
    		[
    		"name.unique"=>"tên thể loại đã tồn tại",
    		"name.min"=>"thể loại từ 3 đến 100 ký tự",
    		"name.max"=>"thể loại từ 3 đến 100 ký tự",
    		]
    		);
    	$theloai=new ProductType();
    	$theloai->name=$request->name;
    	$theloai->tag=str_slug($request->name,"-");
    	$theloai->save();
    	return redirect("admin/category/list")->with("thongbao"," thêm thành công");
    }
    public function delete($id)
    {
    	$product=Product::where("id_type",$id);
    	$product->delete();
    	$theloai=ProductType::find($id);
    	$theloai->delete();
    	return redirect("admin/category/list")->with("thông báo","xóa thành công");
    }

}
