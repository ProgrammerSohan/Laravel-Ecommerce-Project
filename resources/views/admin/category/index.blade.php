@extends('admin.layout.layout')


@section('content')

    <table class="table">
        <thead>
            <tr>
                <th>SL. No</th>
                <th>Category Name</th>
                <th>Parent Category Name</th>
                <th>Create Date</th>
                <th>Action</th>
            </tr>
        </thead>
      <tbody>
        @foreach($categories as $key=>$category)
		<tr>
			<td>{{$key+1}}</td>
			<td>{{$category->name}}</td>
			<td>
				@if($category->category_id)
					{{$category->parent->name}}
				@else
					No parent category
				@endif
			</td>
			<td>{{$category->created_at}}</td>
            <td>
				<a href="{{route('category.edit',$category->id)}}" style="font-size:17px;padding:5px;"><i class="fa fa-edit"></i></a>
				<a href="javaseript::void(0)" style="font-size:17px;padding:5px;" data-id="{{$category->id}}" class="category_delete"><i class="fa fa-trash"></i></a>
			</td>

        </tr>

          @endforeach
      </tbody>
    </table>

@endsection


@push('footer-script')
    <script>
        $('.category_delete').on('click',function(){
            if(confirm('Are you delete this category.')){
                var id = $(this).data('id');
                $.ajax({
                    url:'{{route("category.delete")}}',
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



