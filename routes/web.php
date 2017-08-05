<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


    Route::get("/","PagesController@getindex");

//backend
Route::get("admin/login","UserController@getlogin");
Route::post("admin/login","UserController@postlogin");
Route::get("admin/logout","UserController@getlogout");

Route::group(["prefix"=>"admin","middleware"=>"adminlogin"],function()
{
	Route::group(["prefix"=>"category"],function()
	{
		Route::get("list","CategoryController@getlist");
		Route::get("edit/{id}","CategoryController@getedit");
		Route::post("edit/{id}","CategoryController@postedit");
		Route::get("add","CategoryController@getadd");
		Route::post("add","CategoryController@postadd");
		Route::get("delete/{id}","CategoryController@delete");
	});
	Route::group(["prefix"=>"product"],function()
	{
		Route::get("list","ProductController@getlist");
		Route::get("edit/{id}","ProductController@getedit");
		Route::post("edit/{id}","ProductController@postedit");
		Route::get("add","ProductController@getadd");
		Route::post("add","ProductController@postadd");
		Route::get("delete/{id}","ProductController@delete");
	});
	Route::group(["prefix"=>"user"],function()
	{
		Route::get("list","UserController@getlist");
		Route::get("edit/{id}","UserController@getedit");
		Route::post("edit/{id}","UserController@postedit");
		Route::get("add","UserController@getadd");
		Route::post("add","UserController@postadd");
		Route::get("delete/{id}","UserController@delete");
	});
	Route::group(["prefix"=>"order"],function()
	{
		Route::get("list","OdersController@getlist");
		Route::get("detail/{id}","OdersController@getorder");	
		Route::get("delete/{id}","OdersController@delete");
	});


});
//font-end

Route::get("product-category/{type}/{tag}","PagesController@getProduct_category");
Route::get("product-detail/{id}/{tag}","PagesController@getProduct_detail");	
Route::get("contact","PagesController@getcontact");
Route::get("about","PagesController@getabout");
Route::get("muahang/{id}","PagesController@muahang");
Route::get('giohang/update/{id}/{qty}-{dk}', ['as'  => 'getupdatecart', 'uses' =>'PagesController@getupdatecart']);
Route::get("giohang","PagesController@giohang");
Route::get("xoa-san-pham/{id}","PagesController@xoa");
Route::get("destroy","PagesController@destroy");
Route::get("dat-hang",
	[
	"as"=>"dathang",
	"uses"=>"PagesController@checkout"
	]);
Route::post("dat-hang",[
	"as"=>"dathang",
	"uses"=>"PagesController@postcheckout"
							]);
Route::get("search",
	[
	'as'=>"search",
	"uses"=>"PagesController@getsearch"]);