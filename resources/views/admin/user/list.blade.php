   @extends("admin.layout.index")
   @section("content")
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">Category
                            <small>List</small>
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
                                <th>full name</th>
                                <th>email</th>
                             
                                <th>Delete</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                        @foreach($user as $rows)
                            <tr class="odd gradeX" align="center">
                                <td>{{$rows->id}}</td>
                                <td>{{$rows->full_name}}</td>
                                <td>{{$rows->email}}</td>
                              

                                <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="admin/user/delete/{{$rows->id}}"> Delete</a></td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="admin/user/edit/{{$rows->id}}">Edit</a></td>
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