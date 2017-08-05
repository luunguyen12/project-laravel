   @extends("admin.layout.index")
   @section("content")
   <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Product
                            <small>Edit</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                     
                     
                       @if(count($errors)>0)
                        <div class="alert alert-danger">
                            @foreach($errors->all() as $err)
                            {{ $err}}<br>
                            @endforeach
                        </div>
                        @endif
                    <!-- /.col-lg-12 -->
                    <div class="col-lg-7" style="padding-bottom:120px">
                        <form action="admin/product/edit/{{$product->id}}" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="_token" value="{{csrf_token()}}">

                            <div class="form-group">
                                <label>Name</label>
                                <input class="form-control" name="name" required="" value="{{$product->name}}" />
                            </div>
                            <div class="form-group">
                                <label>Thể loại</label>
                                <select class="form-control" name="category" id="category" required="">
                                @foreach($category as $rows)
                                 <option
                                    @if( $product->product_type->id==$rows->id)
                                         {{"selected"}}
                                    @endif
                                 value="{{$rows->id}}">
                                    {{$rows->name}}
                                  </option>
                                  @endforeach
                                </select>
                            </div>
                            <div class="form-group">
                                <label>unit_Price</label>
                                <input class="form-control" name="unit_price" required="" value="{{($product->unit_price)}}" />
                            </div>
                            <div class="form-group">
                                <label>promotion_Price</label>
                                <input class="form-control" name="promotion_price"  value="{{($product->promotion_price)}}" />
                            </div>
                            <div class="form-group">
                                <label>unit</label>
                                <input class="form-control" name="unit" required="" value="{{$product->unit}}" />
                            </div>
                            <div class="form-group">
                                <label>description</label>
                                <textarea id="demo" class="form-control ckeditor" rows="3" name="description">{!!$product->description!!}</textarea>
                            </div>
                           
                            <div class="form-group">
                                <label>Images</label>
                                <img width="100px;" src="image/product/{{$product->image}}" alt="">
                                <input type="file" name="image">
                            </div>
                          
                         
                            <div class="form-group">
                                <label>product_hot</label>
                                <label class="radio-inline">
                                    <input name="hot" value="1"
                                    @if($product->product_hot==1)
                                        {{"checked"}}
                                    @endif 
                                    type="radio">
                                   nổi bật
                                </label>
                                <label class="radio-inline">
                                    <input name="hot" value="0" 
                                    @if($product->product_hot==0)
                                        {{"checked"}}
                                    @endif
                                      type="radio">không
                                </label>
                            </div>
                            <button type="submit" class="btn btn-default">Edit</button>
                            <button type="reset" class="btn btn-default">reset</button>
                        <form>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->
@endsection