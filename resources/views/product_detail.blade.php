@extends("master")
@section("content")
<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Sản phẩm</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="{{url('/')}}">Trang chủ</a> / <span>Thông tin chi tiết sản phẩm</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">

					<div class="row">
						<div class="col-sm-4">
							<img src="public/image/
product/{{$product->image}}" alt="">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
								<p class="single-item-title">{{$product->name}}</p>
								<p class="single-item-price">
									@if($product->promotion_price==0)
											<span class="flash-sale">{{number_format($product->unit_price)}} đồng</span>
											@else
												<span class="flash-del">{{number_format($product->unit_price)}} đồng</span>
												<span class="flash-sale">{{number_format($product->promotion_price)}} đồng</span>
												@endif

								</p>
							</div>

							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<div class="single-item-desc">
								<p>{!!$product->description!!}</p>
							</div>
							<div class="space20">&nbsp;</div>

							<p>Số lượng:</p>
							<div class="	single-item-options">
								
								<select class="wc-select" name="color">
									
									<option value="1">1</option>
									
								</select>
								<a class="add-to-cart" href="muahang/{{$product->id}}"><i class="fa fa-shopping-cart"></i></a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">Mô Tả</a></li>
							
						</ul>

						<div class="panel" id="tab-description">
							<p>{!!$product->description!!}</p>
						</div>
						
					</div>
					<div class="space50">&nbsp;</div>
					<div class="beta-products-list">
						<h4>Sản phẩm cùng loại</h4>

						<div class="row">
						@foreach($sanpham_cungloai as $rows)
							<div class="col-sm-4">
								<div class="single-item">
									<div class="single-item-header">
										<a href="product-detail/{{$rows->id}}/{{$rows->tag}}.html"><img src="public/image/
product/{{$rows->image}}" style="height: 150px;"></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title">{{$rows->name}}</p>
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
						<div class="rows">{{$sanpham_cungloai->links()}}</div>
					</div> <!-- .beta-products-list -->
				</div>
				<div class="col-sm-3 aside">
					<div class="widget">
						<h3 class="widget-title">sản phẩm hot</h3>
						<div class="widget-body">
@foreach($product_hot as $rows)

							<div class="beta-sales beta-lists">
								<div class="media beta-sales-item">
									<a class="pull-left" href="product-detail/{{$rows->id}}/{{$rows->tag}}.html"><img src="public/image/
product/{{$rows->image}}" alt=""></a>
									<div class="media-body">
										{{$rows->name}}
										<span class="beta-sales-price">
												@if($rows->promotion_price==0)
												{{number_format($rows->unit_price)}} đ
												@else
												{{number_format($rows->promotion_price)}} đ
													@endif
										</span>
									</div>
								</div>		
							</div>
@endforeach
						</div>
					</div> <!-- best sellers widget -->
					<div class="widget">
						<h3 class="widget-title">sản phẩm mới</h3>
						<div class="widget-body">
@foreach($new_product as $rows)

							<div class="beta-sales beta-lists">
								<div class="media beta-sales-item">
									<a class="pull-left" href="product-detail/{{$rows->id}}/{{$rows->tag}}.html"><img src="public/image/
product/{{$rows->image}}" alt=""></a>
									<div class="media-body">
										{{$rows->name}}
										<span class="beta-sales-price">
												@if($rows->promotion_price==0)
												{{number_format($rows->unit_price)}} đ
												@else
												{{number_format($rows->promotion_price)}} đ
													@endif
										</span>
									</div>
								</div>		
							</div>
@endforeach
						</div>
					</div> <!-- best sellers widget -->
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
@endsection