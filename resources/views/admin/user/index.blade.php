
@extends('admin.layout.layout')

@section('content')

    <table class="table table-striped table-bordered">
        <thead>
            <tr>
                <th>SL. No</th>
                <th>Name</th>
                <th>Email</th>
                <th>Created Date</th>
                <th>Action</th>

            </tr>
        </thead>
        <tbody>
            @foreach ($users as $key=>$user )
                <tr>
                    <td>{{$key+1}}</td>
                    <td>{{$user->name}}</td>
                    <td>{{$user->email}}</td>
                    <td>{{$user->created_at}}</td>

                <td>

      <a href="javascript::void(0)" style="font-size:17px;padding:5px;" data-id="{{$user->id}}" class="delete"> <i class="fa fa-trash"></i></a>


                    </td>

                </tr>
            @endforeach

        </tbody>
    </table>

@endsection

@push('footer-script')
    <script>
        $('.delete').on('click',function(){
            if(confirm('Are you delete this user.')){
                var id= $(this).data('id');
                $.ajax({
                    url:'{{route("user.delete")}}',
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












































