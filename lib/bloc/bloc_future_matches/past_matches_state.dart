import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/models/past_matches_model.dart';

abstract class PastMatchesState extends Equatable {
  const PastMatchesState();
}

class PastMatchesInitialState extends PastMatchesState {
  @override
  List<Object> get props => [];
}

class PastMatchesLoadingState extends PastMatchesState{
  @override
  List<Object> get props => [];
}

class PastMatchesLoadedState extends PastMatchesState {
  final Data data;

  PastMatchesLoadedState({@required this.data});
  
  @override
  List<Object> get props => [data];
}

class PastMatchesErrorState extends PastMatchesState {
  final String message;

  PastMatchesErrorState({@required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'Error $message';
}