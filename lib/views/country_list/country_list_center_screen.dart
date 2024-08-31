import 'package:bloc_news_app/bloc/countries/country_bloc.dart';
import 'package:bloc_news_app/core/constants/app_colors.dart';
import 'package:bloc_news_app/data/model/api/country_list_main.dart';
import 'package:bloc_news_app/widget/app_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CountryListCenterScreen extends StatefulWidget {
  String selectedCountry;

  CountryListCenterScreen({required this.selectedCountry, super.key});

  @override
  State<CountryListCenterScreen> createState() => _CountryListCenterScreenState();
}

class _CountryListCenterScreenState extends State<CountryListCenterScreen> {
  late CountryBloc _countryBloc;
  final double runSpacing = 2;
  final double spacing = 2;
  final columns = 3;
  final TextEditingController _searchTextEditController = TextEditingController();
  late List<Data> _countryData;
  late List<Data> _filterCountryData = [];

  @override
  void initState() {
    _countryBloc = BlocProvider.of(context);
    _countryBloc.add(CountriesFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBG,
      appBar: AppWidgets.getAppBarWithSingleIcon(context, "Select Country", () {
        Navigator.pop(context, widget.selectedCountry);
      }, const Icon(Icons.done_outline_sharp)),
      body: BlocConsumer<CountryBloc, CountryState>(
        builder: (context, state) {
          if (state is CountryInitial) {
            return AppWidgets.getCenterLoadingView();
          } else if (state is CountryError) {
            return AppWidgets.getBuildNoResult(context, "Error on countries data load");
          } else if (state is CountryDataLoaded) {
            if (state.data.data == null) {
              return AppWidgets.getBuildNoResult(context, "Error on countries data load");
            } else {
              _countryData = state.data.data ?? [];
              if (_filterCountryData.isEmpty) {
                _filterCountryData = _countryData;
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AppWidgets.getDefaultSizedBox(context),
                    TextField(
                        controller: _searchTextEditController,
                        onChanged: (value) => _runFilter(value),
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            hintText: 'Search Country...',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.cancel_outlined),
                              color: Colors.grey,
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                _searchTextEditController.clear();
                                _filterCountryData = _countryData;
                              },
                            ))),
                    AppWidgets.getDefaultSizedBox(context),
                    Expanded(child: _countryListView()),
                  ],
                ),
              );
            }
          } else {
            return AppWidgets.getBuildNoResult(context, "Error on countries data load");
          }
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _countryListView() {
    return ListView.separated(
      itemCount: _filterCountryData.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return _countriesListItem(_filterCountryData[index], index);
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 5);
      },
    );
  }

  Widget _countriesListItem(Data countries, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.selectedCountry = _filterCountryData[index].code;
          if (kDebugMode) {
            print("Selected Country -->> ${_filterCountryData[index].name}");
          }
        });
      },
      child: Card(
        color: countries.code == widget.selectedCountry ? AppColors.countrySelectionBorderColor : AppColors.colorBG,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  width: 4.0,
                  color: countries.code == widget.selectedCountry ? AppColors.countrySelectionBorderColor : AppColors.colorBG,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.network(
                  countries.flag,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Text(
              countries.name,
              style: AppColors.blackTextStyle,
            )
          ],
        ),
      ),
    );
  }

  _runFilter(String value) {
    List<Data>? result = [];
    if (value.isEmpty) {
      result = _countryData;
    } else {
      result = _countryData.where((element) => element.name.toLowerCase().contains(value.toLowerCase())).toList();
    }
    setState(() {
      _filterCountryData = result!;
    });
  }
}
