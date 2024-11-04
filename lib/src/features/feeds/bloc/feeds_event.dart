part of 'feeds_bloc.dart';

@immutable
sealed class ReelsEvent {}

class LoadsFeedsEvent extends ReelsEvent {
  final int page;
  final int limit;
  LoadsFeedsEvent({this.page = 1, this.limit = 10});
}

class UpdateReelsInformationEvent extends ReelsEvent {
  final Datum feedData;
  UpdateReelsInformationEvent(this.feedData);
}
