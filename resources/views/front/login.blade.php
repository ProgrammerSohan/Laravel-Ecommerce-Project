@extends('front.layout.layout');



@section('content')
    <div class="span9">
        <ul class="breadcrumb">
            <li><a href="">Home</a> <span class="divider"></span> </li>
            <li class="active">Login</li>
        </ul>
        <h3>Login</h3>
        <div class="well">
            @if ($errors->any())
            <div class="alert alert-danger">
                @foreach ($errors->all() as $error )
                <li>{{ $error }}</li>

                @endforeach

            </div>

            @endif

            <form action="{{route('loginCheck')}}" method="post" class="form-horizontal">
                @csrf
            <div class="control-group">
  <label class="control-label" for="input_email" class="control-label">Email <sup>*</sup></label>
         <div class="controls">
            <input type="text" name="email" id="input_email" placeholder="Email">

        </div>
    </div>
        <div class="control-group">
    <label for="password" class="control-label">Password <sup>*</sup> </label>
        <div class="controls">
        <input type="password" name="password" id="password" placeholder="*******">

        </div>
        </div>

 <div class="control-group">
    <div class="controls">
        <input type="submit" value="Login">
    </div>

    </div>

     </form>

        </div>
        <h3>Registration</h3>
        <div class="well">
            <form action="{{route('user_store')}}" method="post" class="form-horizontal">
                @csrf
                <div class="control-group">
        <label for="inputFname1" class="control-label" required>First Name <sup>*</sup></label>
               <div class="controls">
                   <input type="text" id="inputFname1" name="first_name" placeholder="First Name">
               </div>
                </div>

                <div class="control-group">
                    <label for="inputLnam" class="control-label">Last Name <sup>*</sup></label>
               <div class="controls">
  <input type="text" id="inputLnam" name="last_name" placeholder="Last Name" required>
               </div>
                </div>

     <div class="control-group">
        <label for="input_email" class="control-label">Email <sup>*</sup></label>
        <div class="controls">
     <input type="text" id="input_email" name="email" placeholder="Email" required">
        </div>

    </div>
    <div class="control-group">
        <label for="password" class="control-label">Password <sup>*</sup></label>
        <div class="controls">
   <input type="password" name="password" id="password" placeholder="*******" request>
        </div>
    </div>

<div class="control-group">
    <div class="controls">
        <input type="submit" value="Submit">
    </div>
</div>

            </form>
        </div>

    </div>

@endsection










































