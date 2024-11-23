part of 'listing_bloc.dart';

@immutable
sealed class ListingState {}

final class ListingInitialState extends ListingState {
  final List<FeedTableData> data;
  final String title;
  final CategoryType? type;
  ListingInitialState([this.type, this.title = '', this.data = const []]);
}
