import 'package:dio/dio.dart';

class DioHelper{
 static Dio ?dio;
 static init(){
  dio=Dio(
   BaseOptions(
    baseUrl: 'https://real-time-amazon-data.p.rapidapi.com/',
    receiveDataWhenStatusError: true,
   )
  );
 }
 static Future<Response> getData(quary,{data})async{
  dio!.options.headers= {
   // 08b7623628msh5a5dbf0162b3746p1d7007jsn9fdd5a79f65a
   'X-RapidAPI-Key': '5f0e01195bmshb6bd2af47cdfd99p135eb1jsnf01bca48b63f',
   'X-RapidAPI-Host': 'real-time-amazon-data.p.rapidapi.com'
  };
  return await dio!.get(quary,queryParameters: {
   'query': data??'All Departments',
   'page': '1',
   'country': 'US'});
 }
}