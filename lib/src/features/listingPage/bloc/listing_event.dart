part of 'listing_bloc.dart';

@immutable
sealed class ListingEvent {}

class InitialData extends ListingEvent {}

class UpdateDBEvent extends ListingEvent {
  final bool isLiked;
  final bool isWished;
  final int id;
  UpdateDBEvent(
    this.id, {
    this.isLiked = false,
    this.isWished = false,
  });
}
