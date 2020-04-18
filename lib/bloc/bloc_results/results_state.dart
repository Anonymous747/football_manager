import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/models/results.dart';

abstract class ResultsState extends Equatable {}

class ResultsInitialState extends ResultsState {
  @override
  List<Object> get props => [];
}

class ResultsLoadedState extends ResultsState {
  final Results results;

  ResultsLoadedState({@required this.results});
  
  @override
  List<Object> get props => [this.results];
}

class ResultsErrorState extends ResultsState {
  final String error;

  ResultsErrorState({@required this.error});
  
  @override
  List<Object> get props => [this.error];
}
