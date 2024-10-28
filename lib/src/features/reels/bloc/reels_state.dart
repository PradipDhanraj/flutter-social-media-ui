part of 'reels_bloc.dart';

class ReelsState {
  final List<Datum> feedItems;
  final int page;
  final int limit;
  ReelsState({this.feedItems = const [], this.page = 1, this.limit = 10});

  ReelsState copyWith({List<Datum>? feedItems, int? page, int? limit}) {
    if (feedItems != null) {
      this.feedItems.addAll(feedItems);
    }
    return ReelsState(
      feedItems: this.feedItems,
      limit: limit ?? this.limit,
      page: page ?? this.page,
    );
  }
}
