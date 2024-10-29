part of 'feeds_bloc.dart';

class FeedsState {
  final List<Datum> feedItems;
  final int page;
  final int limit;
  FeedsState({this.feedItems = const [], this.page = 1, this.limit = 10});

  FeedsState copyWith({List<Datum>? feedItems, int? page, int? limit}) {
    var latestFeeds = <Datum>[];
    if (feedItems != null) {
      latestFeeds = [...this.feedItems, ...feedItems];
    }
    return FeedsState(
      feedItems: latestFeeds,
      limit: limit ?? this.limit,
      page: page ?? this.page,
    );
  }
}
