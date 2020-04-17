import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/models/cups_model.dart';

abstract class CupsState extends Equatable {}

class CupsInitialState extends CupsState {
  @override
  List<Object> get props => [];
}

class CupsLoadedState extends CupsState {
  final Cup cup;
  
  CupsLoadedState({@required this.cup});

  @override
  List<Object> get props => [this.cup];
}

class CupsErrorState extends CupsState {
  final String error;

  CupsErrorState({@required this.error});
  
  @override
  List<Object> get props => [this.error];
}