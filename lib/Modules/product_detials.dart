import 'package:amazonapp/Modules/mywebview.dart';
import 'package:amazonapp/models/pizzas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../controllers/cubit.dart';
import '../controllers/states.dart';

class ProductDeatiles extends StatelessWidget {
  Product product;

  ProductDeatiles(this.product);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>AmazonCubit(),
      child: BlocConsumer<AmazonCubit,AmazonStates>(
        builder: (context,state){
          return Scaffold(
              appBar: AppBar(
                title: Text('Product Details',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color:HexColor('FF9900')),),
              ),
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Image.network('${product.productPhoto}',),
                      ),
                      SizedBox(height: 20,),
                      Text('${product.productTitle}',style:Theme.of(context).textTheme.bodyText1,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          RatingBar.builder(
                            initialRating:double.parse(product.productStarRating!),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 25,
                            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            unratedColor:Colors.white ,
                            onRatingUpdate: (rating) {

                            },
                          ),
                         SizedBox(width: 30,),
                          Text('${product.productNumRatings} Reviews',style: Theme.of(context).textTheme.bodyText2,),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                         Text('ASIN',style: GoogleFonts.cairo(fontSize: 16,color:HexColor('FF9900')),),
                         SizedBox(width: 20,),
                          Text('${product.asin} ',style:Theme.of(context).textTheme.bodyText2!,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Price',style: GoogleFonts.cairo(fontSize: 16,color:HexColor('FF9900')),),
                          SizedBox(width: 20,),
                          if(product.productOriginalPrice!=null)
                            Text('${product.productOriginalPrice}',style: Theme.of(context).textTheme.bodyText1!.copyWith(decoration: TextDecoration.lineThrough,),),
                            Text(' ${product.productPrice} ',textAlign:TextAlign.center,style:Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20,),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      TextButton(onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>MyWebView(url:product.productUrl!)));
                      },
                          child: Text('For More Details',style: TextStyle(color:HexColor('FF9900')),)),
                      SizedBox(height: 20,)
                    ],),
                ),
              ),
          );
        },
        listener: (context,state){},
      ),
    );
  }
}
