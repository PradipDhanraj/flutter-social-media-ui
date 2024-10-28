part of 'feeds_bloc.dart';

class ReelsState {
  final List<Datum> feedItems;
  final int page;
  final int limit;
  ReelsState({this.feedItems = const [], this.page = 1, this.limit = 10});

  ReelsState copyWith({List<Datum>? feedItems, int? page, int? limit}) {
    var latestFeeds = <Datum>[];
    if (feedItems != null) {
      latestFeeds = [...this.feedItems, ...feedItems];
    }
    return ReelsState(
      feedItems: latestFeeds,
      limit: limit ?? this.limit,
      page: page ?? this.page,
    );
  }
}
