import 'package:amazonapp/constant.dart';
import 'package:amazonapp/controllers/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Modules/homeScreen.dart';
import 'controllers/CashHelper.dart';
import 'controllers/dioHelper.dart';
import 'controllers/states.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
 await DioHelper.init();
await CacheHelper.init();
bool? Dark=await CacheHelper.GetData(key: 'Dark');
runApp(MyApp(Dark));
}

class MyApp extends StatelessWidget {
  final bool? Dark;
  MyApp(this.Dark);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>AmazonCubit()..getAllProducts()..changeMode(
            Shared:Dark
        ),)
      ],
      child: BlocConsumer<AmazonCubit,AmazonStates>(
        listener: (context,state){},
        builder:(context,state){
          var cubit=AmazonCubit.getCubit(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme:ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                shadowColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.black),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    systemNavigationBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                    systemNavigationBarIconBrightness: Brightness.dark,
                    statusBarBrightness: Brightness.dark

                ),
                titleSpacing: 20,
              ),
              scaffoldBackgroundColor: Colors.white,
              textTheme: TextTheme(bodyText1:GoogleFonts.actor(fontSize: 16,color: Colors.black),bodyText2: GoogleFonts.abel(fontSize: 16,color: Colors.black)),
            ) ,
            darkTheme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.black,
                elevation: 0,
                shadowColor: Colors.transparent,
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    systemNavigationBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.light,
                    systemNavigationBarIconBrightness: Brightness.light,
                    statusBarBrightness: Brightness.light
                ),
                titleSpacing: 20,
              ),
              scaffoldBackgroundColor: Colors.black,
              textTheme: TextTheme(bodyText1:GoogleFonts.actor(fontSize: 16,color: Colors.white),bodyText2: GoogleFonts.abel(fontSize: 16,color: Colors.white)),
              cardColor: HexColor('313131'),),
            themeMode: AmazonCubit.getCubit(context).dark ?ThemeMode.light :ThemeMode.dark,
            home:ProductScreen(),
          );
        }
      ),
    );
  }

}