import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_app/core/routing/app_router.dart';
import 'package:mobile_app/features/search/models/hospital.dart';
import 'package:mobile_app/features/search/repository/search_repository.dart';

enum SearchState {
  init,
  request,
  waiting,
  notFound,
  found,
  faild,
}

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState.init);

  String pathologicalCase = '';
  String hospitalClass = '';
  String duration = '';
  int searchAttempt = 0;
  Hospital? hospital;

  void findHospital(BuildContext context) async {
    state = SearchState.waiting;
    context.router.push(const SearchRoute());
    final response = await HttpSearchRepository.getHospital(searchAttempt);

    if (!context.mounted) return;

    searchAttempt++;

    if (response.statusCode == 204) {
      // in case of no hospitals found
      state = SearchState.notFound;
      return;
    } else if (response.statusCode != 200) {
      // in case any thing wrong happens
      state = SearchState.faild;
      context.router.maybePop();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Something went wrong! please try again'),
      ));
      searchAttempt = 0;
      return;
    }

    hospital = Hospital.fromJson(jsonDecode(response.body));
    state = SearchState.found;
  }
}

final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) => SearchNotifier(),
);
