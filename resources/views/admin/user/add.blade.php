        @extends("admin.layout.index")
        @section("content")
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">User
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
                    <div class="col-lg-7" style="padding-bottom:120px">
                        <form action="admin/user/add" method="POST">
                            <input type="hidden" name="_token" value="{{csrf_token()}}">
                            <div class="form-group">
                                <label>email</label>
                                <input class="form-control" name="email" />
                            </div>
                            <div class="form-group">
                                <label>full_name</label>
                                <input  class="form-control" name="full_name"  required />
                            </div>

                            <div class="form-group">
                                <label>mật khẩu mới</label>
                                <input type="password" class="form-control" name="pass"  placeholder="hãy nhập mật khẩu mới" />
                            </div>
                        
                            <button type="submit" class="btn btn-default">Add</button>
                            <button type="reset" class="btn btn-default">Reset</button>
                            <form>
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->
                </div>
                <!-- /#page-wrapper -->
                @endsection
