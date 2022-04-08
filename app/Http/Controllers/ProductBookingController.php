<?php

namespace App\Http\Controllers;

use App\Models\ProductBooking;
use App\Models\Cart;
use Illuminate\Http\Request;
use Session;
use Omnipay\Omnipay;

class ProductBookingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
            $booking_products = ProductBooking::get();
             return view('admin.bookedProducts.index',compact('booking_products'));


    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
       $cart_id = $request->cart_id;
       $data = array();
       $amount = 0;

       foreach($cart_id as $i=>$value){
        $cart = Cart::find($value);
        $amount = $amount + $cart->product->price;
        $data[$i]['user_id'] = $cart->user_id;
        $data[$i]['product_id'] = $cart->product_id;
        $data[$i]['qty'] = $cart->qty;
        $data[$i]['payment_status'] = '0';

       }
     $ProductBooking = ProductBooking::insert($data);
     $bookIds = ProductBooking::orderBy('id', 'desc')->take(count($data))->pluck('id');

     if($ProductBooking){
         Cart::destroy($cart_id);

        if($request->payment_type == 'eway'){
            Session::put('bookIds', $bookIds);
            $url = $this->ewayPayment($amount);
            return response()->json(['type'=>'eway','url'=>$url]);

        }else{
            return response()->json(['type'=>'pay_person']);


        }


     }


    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ProductBooking  $productBooking
     * @return \Illuminate\Http\Response
     */
    public function show(ProductBooking $productBooking)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ProductBooking  $productBooking
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductBooking $productBooking)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ProductBooking  $productBooking
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductBooking $productBooking)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ProductBooking  $productBooking
     * @return \Illuminate\Http\Response
     */
    public function destroy(ProductBooking $productBooking,Request $request)
    {
        $id = $request->id;
        $bookedProduct = ProductBooking::find($id);
        $bookedProduct->delete();



    }
public function ewayPayment($amount){

    $total_amount = $amount;

    $apiKey ='C3AB9CxEPGGnU445GCO3iOvtvmHH2HIu0wKV72KC1vi7W9PWGLQr4HN0ZKkP9SB8w82mn5';
    $apiPassword = 'TT9F6wo8';
    $apiEndpoint = 'Sandbox';
    $client = \Eway\Rapid::createClient($apiKey, $apiPassword, $apiEndpoint);

    // Transaction details
    $transaction = [
        'RedirectUrl' => route('product.bookingSuccess'),
        'CancelUrl' => route('product.bookingFail') ,
        'TransactionType' => \Eway\Rapid\Enum\TransactionType::PURCHASE,
        'Payment' => [
            'TotalAmount' => $total_amount*100,
        ],

    ];
    //Submit data to eWay to get a Shared Page URL
    $response = $client->createTransaction(\Eway\Rapid\Enum\ApiMethod::RESPONSIVE_SHARED, $transaction);

    // check for any errors
    $sharedURL = '';
    if(!$response->getErrors()){
        $sharedURL = $response->SharedPaymentUrl;
    }
    return $sharedURL;


}
public function bookingFail(){
    Session::forget('bookIds');
    return redirect()->route('cart');


}
public function bookingSuccess(){
    $bookIds = Session::get('bookIds');
    ProductBooking::whereIn('id', $bookIds)->update(['payment_status' => '1']);
    Session::forget('bookIds');
    return redirect()->route('cart');

}
public function change_bookingStatus(Request $request){
    $id = $request->id;
    $booking_status = $request->booking_status;
    $booking_product = ProductBooking::where('id',$id)->update(['booking_status'=>$booking_status]);


}



}
