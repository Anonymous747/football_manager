import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/models/federations_model.dart';
import 'package:football_manager/repositories/matches_repository.dart';

import 'bloc.dart';

class FederationsBloc extends Bloc<FederationsEvent, FederationsState> {
  MatchRepositoriesImpl repository;

  FederationsBloc({@required this.repository});
  
  @override
  FederationsState get initialState => FederationsInitialState();

  @override
  Stream<FederationsState> mapEventToState(
    FederationsEvent event,
  ) async* {
    if (event is FetchDataEvent) {
      yield FederationsLoadingState();
      try {
        Info data = await repository.getFederations();
        yield FederationsLoadedState(info: data);
      } catch (e) {
        yield FederationsErrorState(message: "$e");
      }
    }
  }
}
