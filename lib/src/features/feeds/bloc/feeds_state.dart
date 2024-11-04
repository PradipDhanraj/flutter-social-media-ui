part of 'feeds_bloc.dart';

class FeedsState
//extends Equatable
{
  final List<Datum> feedItems;
  final int page;
  final int limit;
  final bool isLoading;
  FeedsState({this.feedItems = const [], this.page = 1, this.limit = 10, this.isLoading = false});

  FeedsState copyWith({List<Datum>? newFeedItems, int? page, int? limit}) {
    var latestFeeds = <Datum>[];
    latestFeeds = [...feedItems, ...(newFeedItems ?? [])];
    return FeedsState(
      feedItems: latestFeeds,
      limit: limit ?? this.limit,
      page: page ?? this.page,
    );
  }
}
