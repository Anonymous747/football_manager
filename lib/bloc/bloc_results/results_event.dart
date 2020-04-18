import 'package:equatable/equatable.dart';

abstract class ResultsEvent extends Equatable {}

class FetchResultsEvent extends ResultsEvent {
  @override
  List<Object> get props => [];
}
