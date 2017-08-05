<!-- Page Content -->
      @extends("admin.layout.index")
      @section("content")
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <small>chi tiết sản phẩm</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
             <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th>ID</th>
                                <th>ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng</th>
                                <th>giá bán</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $rows)
                            <tr class="odd gradeX" align="center">
                                <td>{{$rows->id}}</td>
                                <td><img width="100px;" src="image/product/{{$rows->image}}" alt=""></td>
                                <td>{{$rows->name}}</td>
                                <td>{{$rows->quantity}}</td>
                                <td>{{number_format($rows->promotion_price)}}</td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="">delete</a></td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /#page-wrapper -->

@endsection