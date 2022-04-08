
@extends('admin.layout.layout')

@section('content')

    <div class="row">
        <col-md-12 class="col-sm-12 col-xs-12">
            <div class="x_panel">
                <div class="x_title">
                    <h2>Form Design <small>Different form elements</small></h2>
                    <div class="clearfix"></div>
                    <div class="x_content">
                        <br>
     <form action="{{route('product.update',$product->id)}}" id="demo-form2" class="form-horizontal form-label-left" method="post" enctype="multipart/form-data">
        @csrf
        <div class="form-group">
  <label for="" class="control-label col-md-3 col-sm-3 col-xs-12" for="first-name">Category Name <span class="required">*</span></label>
            <div class="col-md-6 col-sm-6 col-xs-12">

                <select name="category_id" id="" class="form-control col-md-7 col-xs-12" required="">
                    <option value="">Category Name</option>
                    @foreach ($categories as $category)
     <option value="{{$category->id}}" @if($product->category_id==$category->id) selected @endif>{{$category->name}}</option>

                    @endforeach

                </select>
            </div>

        </div>
        <div class="form-group">
            <label for="first-name" class="control-label col-md-3 col-sm-3 col-xs-12">Product Name <span class="required"></span></label>

            <div class="col-md-6 col-sm-6 col-xs-12">
      <input type="text" name="name" value="{{$product->name}}" class="form-control col-md-7 col-xs-12" required="">

            </div>

        </div>

        <div class="form-group">
            <label for="first-name" class="control-label col-md-3 col-sm-3 col-xs-12">Product Price <span class="required"></span></label>

            <div class="col-md-6 col-sm-6 col-xs-12">
      <input type="number" name="price" value="{{$product->price}}" class="form-control col-md-7 col-xs-12" required="">

            </div>

        </div>
        <div class="form-group">
            <label for="first-name" class="control-label col-md-3 col-sm-3 col-xs-12">Image <span class="required"></span></label>

            <div class="col-md-6 col-sm-6 col-xs-12">
      <input type="file" name="image" class="form-control col-md-7 col-xs-12" required="">

            </div>

        </div>

<div class="form-group">
    <div class="col-md-3 col-sm-3 col-xs-12"></div>
    <div class="col-md-3 col-sm-3 col-xs-12">
<img src="{{asset('uploads/'.$product->image)}}" style="height:80px;width:80px;" alt="">

    </div>

</div>

        <div class="In_solid"></div>
        <div class="form-group">
            <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                <input type="submit" class="btn btn-success" value="Submit">
            </div>
        </div>


         </form>

                    </div>
                </div>
            </div>
        </col-md-12>
    </div>

@endsection









