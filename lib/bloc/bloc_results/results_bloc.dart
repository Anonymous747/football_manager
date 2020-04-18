import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/repositories/matches_repository.dart';

import 'bloc.dart';


class ResultsBloc extends Bloc<ResultsEvent, ResultsState> {
  final String resultName;
  final MatchRepositoriesImpl repository;
  
  ResultsBloc({@required this.repository, @required this.resultName});

  @override
  ResultsState get initialState => ResultsInitialState();

  @override
  Stream<ResultsState> mapEventToState(
    ResultsEvent event,
  ) async* {
    try{
      var data = await repository.getResults(resultName);
      yield ResultsLoadedState(results: data);
    } catch (e) {
      yield ResultsErrorState(error: e);
    }
  }
}
