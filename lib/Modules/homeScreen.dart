import 'package:amazonapp/Modules/product_detials.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../constant.dart';
import '../controllers/cubit.dart';
import '../controllers/states.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../main.dart';
class ProductScreen extends StatelessWidget {
   @override
  Widget build(BuildContext context) {
    return BlocConsumer<AmazonCubit,AmazonStates>(
      builder: (context,state){
        AmazonCubit cubit=AmazonCubit.getCubit(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Amazon',style: GoogleFonts.aBeeZee(fontSize: 20,fontWeight: FontWeight.bold,color:HexColor('FF9900')),),
         actions: [
           IconButton(
             onPressed: (){AmazonCubit.getCubit(context).changeMode();
               },
             icon: Icon(Icons.dark_mode_outlined,color:cubit.colorMode,size: 30,))
         ],
          ),
          body:  Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width:MediaQuery.of(context).size.width*.9,
                    height: 60,
                    child: TextFormField(
                        decoration: InputDecoration(
                         fillColor: HexColor('E6E6E6'),
                          counter: SizedBox(),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none
                          ),
                          //hintText: 'Search',
                          suffixIcon: Icon(Icons.search,color: HexColor('FF9900'),)
                        ),
                      keyboardType: TextInputType.text,
                      onFieldSubmitted:(v){
                          cubit.getAllProducts(data: v.toString());
                      } ,
                    ),
                  ),
                  SizedBox(height: 7,),
                  cubit.allProducts!=null?
                  GridView.count(
                    crossAxisCount:2,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1/1.5,
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    children: List.generate(cubit.allProducts!.data!.products.length, (index){
                      return InkWell(
                        onTap: (){
                          print(cubit.allProducts!.data!.products[index].productStarRating);
                          if(cubit.allProducts!.data!.products[index].productPhoto!='null')
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDeatiles(cubit.allProducts!.data!.products[index])));},
                        child: Card(
                         // color: HexColor('8988989'),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                      CachedNetworkImage(
                                        imageUrl: "${cubit.allProducts!.data!.products[index].productPhoto}",
                                        imageBuilder: (context, imageProvider) => Container(
                                          width: double.infinity,
                                          height: 150,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.contain,
                                                ),
                                          ),
                                        ),
                                        placeholder: (context, url) => Shimmer.fromColors(
                                          baseColor: HexColor('E6E6E6'),
                                          highlightColor: Color(0xFF8D8D8E),
                                          child:Container(
                                              width: double.infinity,
                                              height: 150,
                                          color: HexColor('E6E6E6'),
                                          ) ,
                                        ),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                      CircleAvatar(radius: 20,backgroundColor: Colors.transparent,child: Icon(Icons.favorite,color: Colors.red,),),
                                    ],
                                  ),
                                  SizedBox(height: 7,),
                                  Text('${cubit.allProducts!.data!.products[index].productTitle}',
                                    style: Theme.of(context).textTheme.bodyText1,
                                    maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 10,),
                                  Center(
                                    child: Container(
                                        child: Card(
                                          color: HexColor('FF9900'),
                                          child:   Row(
                                            children: [
                                              if(cubit.allProducts!.data!.products[index].productOriginalPrice!=null) Text('${cubit.allProducts!.data!.products[index].productOriginalPrice}',style: GoogleFonts.alef(color: Colors.white,fontSize: 15,decoration: TextDecoration.lineThrough,),),
                                              Spacer(),
                                              Text('${cubit.allProducts!.data!.products[index].productPrice} ',textAlign:TextAlign.center,style: GoogleFonts.abel(fontSize: 18,color: Colors.white),),
                                            ],
                                          ),)),
                                  ),
                                  SizedBox(height: 7,),
                                ],),
                          ),
                        ),
                      );
                    }),
                  )
                      :
                  Shimmer.fromColors(
                    baseColor: Colors.grey[400]!,
                    highlightColor: Colors.grey[200]!,
                      direction:ShimmerDirection.ltr,
                      enabled: true,
                      child: GridView.count(
                        crossAxisCount:2,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        childAspectRatio: 1/1.5,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                        children: List.generate(6, (index){
                          return Card(
                            color: HexColor('8988989'),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child:  Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    alignment: AlignmentDirectional.topEnd,
                                    children: [
                                     Container(
                                          width: double.infinity,
                                          height: 150,
                                      ),
                                      CircleAvatar(radius: 20,backgroundColor: Colors.transparent,child: Icon(Icons.favorite,color: Colors.red,),),
                                    ],
                                  ),
                                  SizedBox(height: 7,),
                                  Text('',
                                    style: GoogleFonts.actor(fontSize: 16,color: Colors.white),
                                    maxLines: 1,overflow: TextOverflow.ellipsis,),
                                  SizedBox(height: 10,),
                                  Center(
                                    child: Container(
                                        child: Card(
                                          color: HexColor('FF9900'),
                                          child:   Row(
                                            children: [
                                              Text('',style: GoogleFonts.alef(color: Colors.white,fontSize: 15,decoration: TextDecoration.lineThrough,),),
                                              Spacer(),
                                              Text('',textAlign:TextAlign.center,style: GoogleFonts.abel(fontSize: 18,color: Colors.white),),
                                            ],
                                          ),)),
                                  ),
                                  SizedBox(height: 7,),
                                ],),
                            ),
                          );
                        }),
                      ),

                  ),
                ],
              ),
            ),
          ),
        );
      },
      listener: (context,state){},
    );
  }
}

