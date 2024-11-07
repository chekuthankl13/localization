part of 'localization_cubit.dart';

 class LocalizationState extends Equatable {
  final Locale locale;
  const LocalizationState(this.locale);

factory LocalizationState.initial(){
  return const LocalizationState(Locale('en'));
}


LocalizationState copyWith(Locale l){
  return LocalizationState(l);
}
  @override
  List<Object> get props => [locale];
}


