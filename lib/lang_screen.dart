import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:loacalization/cubit/localization_cubit.dart';

class LangScreen extends StatefulWidget {
  const LangScreen({super.key});

  @override
  State<LangScreen> createState() => _LangScreenState();
}

class _LangScreenState extends State<LangScreen> {
  @override
  Widget build(BuildContext context) {
   
    return BlocBuilder<LocalizationCubit, LocalizationState>(
        
      builder: (context, state) {
      var  groupValue = state.locale.languageCode;
        return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.language),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.selectlan,textAlign: TextAlign.center,),
            ],
          ),
          const SizedBox(height: 10,),
          Expanded(child: 
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: languageModel.length,
            itemBuilder: (context, index) {
               var item = languageModel[index];
               return RadioListTile(
                value: item.languageCode,
                 title: Text(item.language),
                subtitle: Text(item.subLanguage),
                 groupValue: groupValue,
                  onChanged: (value) {
                    log("*");

                    BlocProvider.of<LocalizationCubit>(context).setLang(Locale(item.languageCode));
                    groupValue = state.locale.languageCode;
                    // context.read<LocalizationCubit>().setLang(Locale(item.languageCode));
                  },
                  );
            },)
          )
        ],
      ),
    );
      },
    );
  }
}


class LanguageModel {
  String language;
  String subLanguage;
  String languageCode;
  LanguageModel({
    required this.language,
    required this.subLanguage,
    required this.languageCode,
  });
}

List<LanguageModel> get languageModel => [
      LanguageModel(
        language: 'عربي',
        subLanguage: 'Arabic',
        languageCode: 'ar',
      ),
      LanguageModel(
        language: 'English',
        subLanguage: 'English',
        languageCode: 'en',
      ),
      LanguageModel(
        language: 'മലയാളം',
        subLanguage: 'Malayalam',
        languageCode: 'ml',
      ),
    ];