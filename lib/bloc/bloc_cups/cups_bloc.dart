import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/models/cups_model.dart';
import 'package:football_manager/repositories/matches_repository.dart';

import 'bloc.dart';

class CupsBloc extends Bloc<CupsEvent, CupsState> {
  final MatchRepositoriesImpl repository;
  final String cupName;
  
  CupsBloc({@required this.repository, @required this.cupName});

  @override
  CupsState get initialState => CupsInitialState();

  @override
  Stream<CupsState> mapEventToState(
    CupsEvent event,
  ) async* {
    if (event is FetchCupsEvent) {
      try {
        Cup cup = await repository.getCups(cupName);
        yield CupsLoadedState(cup: cup);
      } catch (e) {
        yield CupsErrorState(error: "$e");
      }
    }
  }
}
