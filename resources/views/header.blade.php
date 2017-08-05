
	<div id="header">
		<div class="header-top">
			<div class="container">
				<div class="pull-left auto-width-left">
					<ul class="top-menu menu-beta l-inline">
						<li><a href="index"><i class="fa fa-home"></i> bắc từ liêm hà nội</a></li>
						<li><a href="index"><i class="fa fa-phone"></i> 0163 296 7751</a></li>
					</ul>
				</div>
		
			</div> <!-- .container -->
		</div> <!-- .header-top -->
		<div class="header-body">
			<div class="container beta-relative">
				<div class="pull-left">
					<a href="index" id="logo"><img src="assets/dest/images/logo-cake.png" width="200px" alt=""></a>
				</div>
				<div class="pull-right beta-components space-left ov">
					<div class="space10">&nbsp;</div>
					<div class="beta-comp">
						<form role="search" id="searchform" action="{{route('search')}}">
					
					        <input type="text" value="" name="tukhoa" id="s" placeholder="Nhập từ khóa..." />
					        <button class="fa fa-search" type="submit" id="searchsubmit"></button>
						</form>
					</div>

					<div class="beta-comp">
						<div class="cart">
							<div class="beta-select"><i class="fa fa-shopping-cart"></i> Giỏ hàng (<?php echo Cart::count();?>) <i class="fa fa-chevron-down"></i></div>
							<div class="beta-dropdown cart-body">
						
						@foreach(Cart::content() as $item)
								<div class="cart-item">
									<div class="media">
			<a class="pull-left" href="product-detail/{{$item->id}}/{{$item->tag}}.html"><img src="public/image/
product/{{$item->options->img}}" alt=""></a>
										<div class="media-body">
											<span class="cart-item-title">{{$item->name}}</span>
											
											<span class="cart-item-amount">{{$item->qty}}*<span>
											@if($item->options->promotion_price==0)
							{!!number_format($item->price*$item->qty)!!} đồng	
							@else
							{!!number_format($item->options->promotion_price*$item->qty)!!} đồng	
							</span>
							@endif
							</span></span>
										</div>
									</div>
								</div>
							@endforeach
								<div class="cart-caption">
									<div class="cart-total text-right">Tổng tiền: 		<?php    
				$total =0;
        foreach (Cart::content() as $row) 
        {
        	if($row->options->promotion_price==0)
            $total = $total + ($row->qty * $row->price);
        else
        	$total = $total + ($row->qty * $row->options->promotion_price);
        }
        	echo number_format(floatval($total));
        ?> <span class="cart-total-value"></span></div>
									<div class="clearfix"></div>
									<div class="center">
										<div class="space10">&nbsp;</div>
										<a href="dat-hang" class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a>
									</div>
								</div>
							</div>
						</div> <!-- .cart -->
					</div>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-body -->
		<div class="header-bottom" style="background-color: #0277b8;">
			<div class="container">
				<a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
				<div class="visible-xs clearfix"></div>
				<nav class="main-menu">
					<ul class="l-inline ov">
						<li><a href="{{url('/')}}">Trang chủ</a></li>
						<li><a >Sản phẩm</a>
							<ul class="sub-menu">
							@foreach($loai_sp as $lsp)
								<li><a href="product-category/{{$lsp->id}}/{{$lsp->tag}}.html">{{$lsp->name}}</a></li>
								@endforeach
							</ul>
						</li>
						<li><a href="about">Giới thiệu</a></li>
						<li><a href="contact">Liên hệ</a></li>
					</ul>
					<div class="clearfix"></div>
				</nav>
			</div> <!-- .container -->
		</div> <!-- .header-bottom -->
	</div> <!-- #header -->