import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'localization_state.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(LocalizationState.initial());

  getLang()async{
    var pref = await SharedPreferences.getInstance();
    String code = pref.getString("lang")?? 'en';
    emit(state.copyWith(Locale(code)));
  }

  setLang(Locale l)async{
   if (state.locale.languageCode != l.languageCode) {
    var pref = await SharedPreferences.getInstance();
   
    await pref.setString("lang", l.languageCode);
    
    
    emit(state.copyWith(l));
  } 

  }

}
