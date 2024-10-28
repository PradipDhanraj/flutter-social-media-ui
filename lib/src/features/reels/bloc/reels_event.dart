part of 'reels_bloc.dart';

@immutable
sealed class ReelsEvent {}

class LoadsReelsEvent extends ReelsEvent {
  final int page;
  final int limit;
  LoadsReelsEvent({this.page = 1, this.limit = 10});
}
