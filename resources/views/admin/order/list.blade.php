   @extends("admin.layout.index")
   @section("content")
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            <small>danh sách người mua</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    @if(session("thongbao"))
                    <div class="alert alert-success">
                        {{session("thongbao")}}
                    </div>
                    @endif
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th>ID</th>
                                <th>tên </th>
                                <th>email</th>
                                <th>giới tính</th>
                                <th>địa chỉ</th>
                                <th>điện thoại</th>
                                <th>note</th>
                                <th>ngày mua</th>
                                <th>tổng tiền</th>
                                <th>Delete</th>
                                <th>chi tiết</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($bill as $rows)
                            <tr class="odd gradeX" align="center">
                                <td>{{$rows->customer->id}}</td>
                                <td>{{$rows->customer->name}}</td>
                                 <td>{{$rows->customer->email}}</td>
                                <td>{{$rows->customer->gender}}</td>
                                <td>{{$rows->customer->address}}</td>
                                <td>{{$rows->customer->phone_number}}</td>
                                <td>{{$rows->note}}</td>
                                <td>{{$rows->created_at}}</td>
                                <td>{{number_format($rows->total)}}</td>
                                <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="admin/order/delete/{{$rows->id}}"> Delete</a></td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="admin/order/detail/{{$rows->id}}">chi tiết</a></td>
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