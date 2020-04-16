import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:football_manager/models/federations_model.dart';

abstract class FederationsState extends Equatable {}

class FederationsInitialState extends FederationsState {
  @override
  List<Object> get props => [];
}

class FederationsLoadingState extends FederationsState {
  @override
  List<Object> get props => [];
}

class FederationsLoadedState extends FederationsState {
  Info info;

  FederationsLoadedState({@required this.info});
  
  @override
  List<Object> get props => [info];
}

class FederationsErrorState extends FederationsState {
  String message;

  FederationsErrorState({@required this.message});
  
  @override
  List<Object> get props => [message];
}
