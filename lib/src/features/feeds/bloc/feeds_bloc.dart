import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/repository/feeds_repo.dart';
part 'feeds_event.dart';
part 'feeds_state.dart';

class FeedsBloc extends Bloc<ReelsEvent, FeedsState> {
  late ReelsRepository reelsRepository;
  // late StreamController<ApiResponse<List<Feed>>> _movieListController;
  // StreamSink<ApiResponse<List<Feed>>> get movieListSink => _movieListController.sink;
  // Stream<ApiResponse<List<Feed>>> get movieListStream => _movieListController.stream;

  FeedsBloc() : super(FeedsState()) {
    // _movieListController = StreamController<ApiResponse<List<Feed>>>();
    reelsRepository = DIContainer.DI.get<ReelsRepository>();
    on<LoadsFeedsEvent>(loadFeedData);
  }

  FutureOr<void> loadFeedData(LoadsFeedsEvent event, Emitter<FeedsState> emit) async {
    var data = await reelsRepository.loadFeeds(page: event.page, limit: event.limit);
    emit(state.copyWith(feedItems: data?.feed.data, page: event.page, limit: event.limit));
    if (kDebugMode) {
      print(data);
    }
  }
}
