import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/models/past_matches_model.dart';
import 'package:football_manager/repositories/matches_repository.dart';

import 'bloc.dart';


class PastMatchesBloc extends Bloc<PastMatchesEvent, PastMatchesState> {
  MatchRepositoriesImpl repository;
  
  PastMatchesBloc({@required this.repository});

  @override
  PastMatchesState get initialState => PastMatchesInitialState();

  @override
  Stream<PastMatchesState> mapEventToState(
    PastMatchesEvent event,
  ) async* {
    if (event is FetchData) {
      yield PastMatchesLoadingState();
      try {
        Data data = await repository.getPastMatches();
        yield PastMatchesLoadedState(data: data);
      } catch (e) {
        yield PastMatchesErrorState(message: "$e");
      }
    }
  }
}
