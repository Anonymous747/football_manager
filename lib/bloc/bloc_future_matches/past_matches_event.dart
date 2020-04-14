import 'package:equatable/equatable.dart';

abstract class PastMatchesEvent extends Equatable {}

class FetchData extends PastMatchesEvent {
  @override
  List<Object> get props => [];
}
