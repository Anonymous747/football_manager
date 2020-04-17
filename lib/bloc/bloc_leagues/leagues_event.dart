import 'package:equatable/equatable.dart';

abstract class LeaguesEvent extends Equatable {}

class FetchLeaguesEvent extends LeaguesEvent {
  @override
  List<Object> get props => [];
}