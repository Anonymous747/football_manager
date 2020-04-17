import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/repositories/matches_repository.dart';

import 'bloc.dart';


class LeaguesBloc extends Bloc<LeaguesEvent, LeaguesState> {
  final MatchRepositoriesImpl repository;
  final String leaguesName;

  LeaguesBloc({@required this.repository, @required this.leaguesName});

  @override
  LeaguesState get initialState => LeaguesInitialState();

  @override
  Stream<LeaguesState> mapEventToState(
    LeaguesEvent event,
  ) async* {
    try {
      var data = await repository.getLeagues(leaguesName);
      yield LeaguesLoadedState(leagues: data);
    } catch (e) {
      yield LeaguesErrorState(error: e);
    }
  }
}
