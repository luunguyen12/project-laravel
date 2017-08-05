	@extends("master")
	@section("content")
	<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm {{$loai_sp->name}}</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{url('/')}}">Home</a> / <span> Loại Sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-3">
						<ul class="aside-menu">
						@foreach($loai as $rows)
							<li><a href="product-category/{{$rows->id}}/{{$rows->tag}}.html">{{$rows->name}}</a></li>
						@endforeach
						</ul>
					</div>
					<div class="col-sm-9">
						<div class="beta-products-list">
							<h4>{{$loai_sp->name}}</h4>
							<div class="beta-products-details">
								<p class="pull-left">Tìm Thấy {{ count($sp_theoloai)}} sản phẩm </p>
								<div class="clearfix"></div>
							</div>

							<div class="row">
								@foreach($sp_theoloai as $sp)
								<div class="col-sm-4">
									<div class="single-item">
									@if($sp->promotion_price!=0)
									<div class="ribbon-wrapper">
										<div class="ribbon sale">Sale</div>
									</div>	
									@endif
										<div class="single-item-header">
											<a href="product-detail/{{$sp->id}}/{{$sp->tag}}.html"><img src="public/image/
product/{{$sp->image}}" height="250px;"></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title">{{$sp->name}}p</p>
											<p class="single-item-price" style="font-size: 18px;">
											@if($sp->promotion_price==0)
											<span class="flash-sale">{{number_format($sp->unit_price)}} đồng</span>
											@else
											<span class="flash-del">{{number_format($sp->unit_price)}} đồng</span>
											<span class="flash-sale">{{number_format($sp->promotion_price)}} đồng</span>
											@endif
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="muahang/{{$sp->id}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="product-detail/{{$sp->id}}/{{$sp->tag}}.html">Details <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								@endforeach
								</div>
								<div class="row" style="text-align: right;">
								{{$sp_theoloai->links()}}
								</div>
						</div> <!-- .beta-products-list -->

						<div class="space50">&nbsp;</div>

						<div class="beta-products-list">
							<h4>Sản Phẩm Khác</h4>
							<div class="beta-products-details">
								<p class="pull-left"> Tìm Thấy {{ count($sp_khac)}} sản phẩm   </p>
								<div class="clearfix"></div>
							</div>
							<div class="row">
								@foreach($sp_khac as $rows)
								<div class="col-sm-4">
									<div class="single-item">
									@if($rows->promotion_price!=0)
									<div class="ribbon-wrapper">
										<div class="ribbon sale">Sale</div>
									</div>	
									@endif
										<div class="single-item-header">
											<a href="product-detail/{{$rows->id}}/{{$rows->tag}}.html"><img src="public/image/
product/{{$rows->image}}" height="250px;"></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title">{{$rows->name}}p</p>
											<p class="single-item-price" style="font-size: 18px;">
											@if($rows->promotion_price==0)
											<span class="flash-sale">{{number_format($rows->unit_price)}} đồng</span>
											@else
											<span class="flash-del">{{number_format($rows->unit_price)}} đồng</span>
											<span class="flash-sale">{{number_format($rows->promotion_price)}} đồng</span>
											@endif
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="muahang/{{$rows->id}}"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="product-detail/{{$rows->id}}/{{$rows->tag}}.html">Details <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								@endforeach
								</div>
								
							</div>
							<div class="space40">&nbsp;</div>
							
						</div> <!-- .beta-products-list -->
					</div>
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection