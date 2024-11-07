import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart'as applc;
import 'package:loacalization/bloc_observer.dart';
import 'package:loacalization/cubit/localization_cubit.dart';
import 'package:loacalization/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 Bloc.observer = MyBlocObserver();
  var k =await getCurrentLocale();
  runApp(BlocProvider(
    create: (context) => LocalizationCubit()..setLang(k),
    child: const MainApp(),
  )
  ,);
}

Future<Locale> getCurrentLocale() async{
  var pref = await SharedPreferences.getInstance();
  var code =pref.getString("lang");
  if(code!= null){
return Locale(code);
  }else{
return  PlatformDispatcher.instance.locale;
  }

  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LocalizationCubit, LocalizationState>(
      builder: (context, state) {
        return MaterialApp(
      theme: ThemeData(
        appBarTheme:const AppBarTheme(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white
        )
      ),
      localizationsDelegates:applc.AppLocalizations.localizationsDelegates ,
      supportedLocales: applc.AppLocalizations.supportedLocales,
      locale: state.locale,
      debugShowCheckedModeBanner: false,
      home:const HomeScreen(),
    );
      },
    );
  }
}
