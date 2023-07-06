import 'package:amazonapp/controllers/CashHelper.dart';
import 'package:amazonapp/controllers/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/desserts.dart';
import '../models/pizzas.dart';
import 'dioHelper.dart';

class AmazonCubit extends Cubit<AmazonStates>{
  AmazonCubit():super(InitalAmazonStates());
  static AmazonCubit getCubit(context)=>BlocProvider.of(context);
 AllProducts?allProducts;
  Future<void> getAllProducts({String ?data})async{
    allProducts=null;
    emit(LoadingAmazonStates());
    await DioHelper.getData('search',data:data).then((value){
     allProducts=AllProducts.fromJson(value.data);
    });
    print(allProducts!.data!.products[0].productTitle);
    emit(SuccessAmazonStates());
  }
  Color colorMode=Colors.grey;

  bool dark=true;
  void changeMode({
    bool? Shared
  }){
    if (Shared !=null){
      dark=Shared;
      emit(ChangeModeAmazonStates());
    }
    else{
      dark = !dark;
      CacheHelper.SetData(key: 'Dark', value: true).then((value) {
        emit(ChangeModeAmazonStates());

      });
    }


  }
}