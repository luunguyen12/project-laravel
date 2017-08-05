<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Auth;
class UserController extends Controller
{
    public function getlist()
    {
    	$user=User::all();
    	return view("admin.user.list",compact("user"));
    }
    public function getedit(Request $request,$id)
    {
    	$user=User::find($id);
    	return view('admin.user.edit',compact("user"));
    }
    public function postedit(Request $request,$id)
    {
    
     $user=User::find($id);
    
    	$user->full_name=$request->full_name;
    	if($request->againpass=="on")
    	{
    			$this->validate($request,
    		["pass"=>"min:3|max:100",
    		"againpass="=>"min:3|max:100|same:password"],
    		["pass.min"=>"mật khẩu phải có tối thiểu 3 ký tự",
    		"pass.max"=>"mật khẩu tối đa 100 ký tự",
    		"againpass.min"=>"mật khẩu phải có tối thiểu 3 ký tự",
    		"againpass.max"=>"mật khẩu tối đa 100 ký tự",
    		"againpass.same"=>"mật khẩu chưa khớp"]);
    	}
    	 $user->password=bcrypt($request->pass);
    	 $user->save();
    	 return redirect("admin/user/list")->with("thongbao","sửa thành công");
    }
    public function getadd()
    {
    	
    	return view("admin.user.add");
    }
    public function postadd(Request $request)
    {
    	$this->validate($request,
    		["pass"=>"min:3|max:100",
    		"againpass="=>"min:3|max:100|same:password",
    		"email"=>"unique:users,email",
    		"full_name"=>""],

    		["pass.min"=>"mật khẩu phải có tối thiểu 3 ký tự",
    		"pass.max"=>"mật khẩu tối đa 100 ký tự",
    		"againpass.min"=>"mật khẩu phải có tối thiểu 3 ký tự",
    		"againpass.max"=>"mật khẩu tối đa 100 ký tự",
    		"againpass.same"=>"mật khẩu chưa khớp",
    		"email.unique"=>"tên email đã tồn tại",
    		"full_name.min"=>"full_name có ít nhât 3 ký tự"]);
    	$user=new User();
    	$user->email=$request->email;
		$user->full_name=$request->full_name;
		$user->password=bcrypt($request->pass);
		$user->save();
		return redirect("admin/user/list")->with("thongbao","thêm thành công");
    }
    public function delete($id)
    {
    	$user=User::find($id);
    	$user->delete();
    	return redirect("admin/user/list")->with("thongbao","bạn đã xóa thành công");
    }
    public function getlogin()
    {
        return view("admin.login");
    }
    public function postlogin(Request $request)
    {
       if(Auth::attempt(["email"=>$request->email,"password"=>$request->password]))    
       {
        return redirect("admin/category/list");
       }
       else
       {
        return redirect("admin/login")->with("thongbao","đăng nhập thất bại");
       }
    }
    public function logout()
    {
        Auth::logout();
        return redirect("admin/login");
    }
}
