@extends("master")
@section("content")
<div class="inner-header">
	<div class="container">
		<div class="pull-left">
			<h6 class="inner-title">Giỏ Hàng</h6>
		</div>
		<div class="pull-right">
			<div class="beta-breadcrumb font-large">
				<a href="{{url('/')}}">Home</a> / <span>giỏ hàng</span>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
</div>

<div class="container">
	<div id="content">
		
		<div class="table-responsive">
			<!-- Shop Products Table -->
			<table class="shop_table beta-shopping-cart-table" cellspacing="0">
				<thead>
					<tr>
						<th class="product-name">Sản Phẩm</th>
						<th class="product-price">Giá Sản Phẩm</th>
						<th class="product-quantity">Số Lượng</th>
						<th class="product-subtotal">tổng tiền</th>
						<th class="product-remove">xóa </th>
					</tr>
				</thead>
				<tbody>
				<form method="post" action="">
				<input type="hidden" name="_token" value="{!! csrf_token()!!}">
				@foreach($content as $item)
					<tr class="cart_item">
						<td class="product-name">
							<div class="media">
								<img class="pull-left" src="public/image/
product/{{$item->options->img}}" width="100px;">
								<div class="media-body">
									<p class="font-large table-title">{{$item->name}}</p>		
								</div>
							</div>
						</td>

						<td class="product-price">
							<span class="amount">
							@if($item->options->promotion_price==0)
							{!!number_format($item->price)!!} đồng
							@else
								{!!number_format($item->options->promotion_price)!!} đồng
							@endif
							</span>
						</td>
						
					<td class="text-center">                        
                          @if (($item->qty) >1)
                          <a href="{!!url('giohang/update/'.$item->rowId.'/'.$item->qty.'-down')!!}"><span class="glyphicon glyphicon-minus"></span></a> 
                          @else
                            <a href="giohang"><span class="glyphicon glyphicon-minus"></span></a> 
                          @endif
                       		<span> {!!$item->qty!!}</span> 
                        <a href="{!!url('giohang/update/'.$item->rowId.'/'.$item->qty.'-up')!!}"><span class="glyphicon glyphicon-plus-sign"></span></a>
                      </td>
						

						<td class="product-subtotal">
							<span class="amount">
							@if($item->options->promotion_price==0)
							{!!number_format($item->price*$item->qty)!!} đồng	
							@else
							{!!number_format($item->options->promotion_price*$item->qty)!!} đồng	
							</span>
							@endif
						</td>

						<td class="product-remove">
							<a href="{!!url('xoa-san-pham',['id'=>$item->rowId])!!}" class="remove" title="Remove this item"><i class="fa fa-trash-o"></i></a>
						</td>
					</tr>
					@endforeach
					
				</tbody>

				<tfoot>
					<tr>
						<td colspan="6" class="actions">
						
							<a href="destroy" class="beta-btn primary" name="update_cart">delete all cart <i class="fa fa-chevron-right"></i></a> 
							<a href="dat-hang" class="beta-btn primary" name="proceed">thanh toán <i class="fa fa-chevron-right"></i></a>
						</td>
					</tr>
				</tfoot>
				</form>	
			</table>
			<!-- End of Shop Table Products -->
		</div>
		<!-- Cart Collaterals -->
		<div class="cart-collaterals">

		
			<div class="cart-totals pull-right">
				<div class="cart-totals-row"><h5 class="cart-total-title">Tổng</h5></div>
					<div class="cart-totals-row"><span>Tổng Số Lượng:</span> <span>{{$count}}</span></div>
					
					<div class="cart-totals-row"><span>Tổng Tiền:</span> <span>
				<?php    
				$total =0;
        foreach (Cart::content() as $row) 
        {
        	if($row->options->promotion_price==0)
            $total = $total + ($row->qty * $row->price);
        else
        	$total = $total + ($row->qty * $row->options->promotion_price);
        }
        	echo number_format(floatval($total));
        ?>
        	đ
        </span>
				</div>
			
				
			</div>
			<div class="clearfix"></div>
		</div>
		<!-- End of Cart Collaterals -->
		<div class="clearfix"></div>

	</div> <!-- #content -->
</div> 
@endsection