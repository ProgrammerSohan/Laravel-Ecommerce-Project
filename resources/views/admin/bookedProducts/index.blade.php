@extends('admin.layout.layout')

@section('content')
<table class="table table-striped table-bordered">
    <thead>
            <tr>
        <th>S.no</th>
        <th>Product Name</th>
        <th>User Name</th>
        <th>Qty</th>
        <th>Total Amount</th>
        <th>Payment Status</th>
        <th>Booking Status</th>
        <th>Action</th>
    </tr>
    </thead>
    <tbody>
        @foreach ($booking_products as $key=>$booking_product)
            <tr>
                <td>{{$key+1}}</td>
                <td>{{$booking_product->product->name}}</td>
                <td>{{$booking_product->user->name}}</td>
                <td>{{$booking_product->qty}}</td>
                <td>{{$booking_product->qty * $booking_product->product->price}}</td>
                <td>{{$booking_product->payment_status}}</td>

                <td>
                    @php
                        $book_status = $booking_product->booking_status;
                    @endphp
                      <select class="book_status" data-id="{{$booking_product->id}}">
         <option value="0" @if($book_status == '0') selected @endif>In Progress</option>
        <option value="1" @if($book_status == '1') selected @endif>Booking Cancel</option>
       <option value="2" @if($book_status == '2') selected @endif>Booked</option>


                      </select>
                  </td>

                <td>
                    <a href="javascript::void(0)" style="font-size:17px;" data-id="{{$booking_product->id}}" class="delete"><i class="fa fa-trash"></i></a>

                </td>


            </tr>

        @endforeach

    </tbody>

</table>


@endsection

@push('footer-script')
<script>
    $('.delete').on('click',function(){
        if(confirm('Are you delete this product.')){
            var id = $(this).data('id');
            $.ajax({
           url:'{{route("booking.product.delete")}}',
           data:{
                'id':id

           },
           success: function(data){
               location.reload();
           }

            });

        }

    });
$('.book_status').on('change',function(){
    var booking_status = $(this).val();
    var id = $(this).data('id');
    $.ajax({
        url:'{{route("booking.product.status")}}',
        data: {
            'booking_status':booking_status,
            'id':id,
        }

    });


});


</script>

@endpush















