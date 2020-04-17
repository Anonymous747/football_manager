import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/models/leagues_model.dart';

abstract class LeaguesState extends Equatable {
  const LeaguesState();
}

class LeaguesInitialState extends LeaguesState {
  @override
  List<Object> get props => [];
}

class LeaguesLoadedState extends LeaguesState {
  final Leagues leagues;

  LeaguesLoadedState({@required this.leagues});
  
  @override
  List<Object> get props => [this.leagues];
}

class LeaguesErrorState extends LeaguesState {
  final String error;

  LeaguesErrorState({@required this.error}); 
  
  @override
  List<Object> get props => [this.error];
}