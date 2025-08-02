import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_news_app/data/model/api/country_list_main.dart';
import 'package:bloc_news_app/data/repository/news/news_repo_imp.dart';
import 'package:meta/meta.dart';

part 'country_event.dart';

part 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final _newsRepo = NewsRepoImp();

  CountryBloc() : super(CountryInitial()) {
    on<CountriesFetchEvent>(_fetchCountriesData);
  }

  FutureOr<void> _fetchCountriesData(
      CountriesFetchEvent event, Emitter<CountryState> emit) async {
    emit(CountryInitial());
    await _newsRepo
        .getCountriesData()
        .onError((error, stackTrace) => emit(CountryError()))
        .then((value) {
      CountryListMain countriesMain =
          CountryListMain.fromJson(jsonDecode(value));
      emit(CountryDataLoaded(countriesMain));
    });
  }
}
