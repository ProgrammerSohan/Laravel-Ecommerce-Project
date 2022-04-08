@extends('admin.layout.layout')

@section('content')

    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>SL. No</th>
                <th>Product Name</th>
                <th>Category Name</th>
                <th>Price</th>
                <th>Extra Details</th>
                <th>Image</th>

                <th>Action</th>

            </tr>
        </thead>
        <tbody>
            @foreach ($products as $key=>$product )
                <tr>
                    <td>{{$key+1}}</td>
                    <td>{{$product->name}}</td>
                    <td>
                        @if ($product->category_id)
                        {{$product->category->name}}

                        @endif
                    </td>
                    <td>{{$product->price}}</td>
          <td><button><a href="{{route('product.extraDetails',$product->id)}}">Add</a></button></td>
                    <td> <img style="height:80px;width:80px;" src="{{asset('uploads/'.$product->image)}}" alt="">  </td>
                    <td>
      <a href="{{route('product.edit',$product->id)}}" style="font-size:17px;padding:5px;"><i class="fa fa-edit"></i></a>
      <a href="javascript::void(0)" style="font-size:17px;padding:5px;" data-id="{{$product->id}}" class="delete"> <i class="fa fa-trash"></i></a>


                    </td>

                </tr>
            @endforeach

        </tbody>
    </table>

@endsection

@push('footer-script')
    <script>
        $('.delete').on('click',function(){
            if(confirm('Are you delete this product!')){
                var id= $(this).data('id');
                $.ajax({
                    url:'{{route("product.delete")}}',
                    method:'post',
                    data:{
                        _token: "{{ csrf_token() }}",
                        'id':id
                    },
                    success: function(data){
                        location.reload();

                    }

                });

            }

        });

    </script>

@endpush




