import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/secrets.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/feeds/models/feeds_model.dart';
import 'package:flutter_social_media_ui/src/features/feeds/repository/feeds_repo.dart';
part 'feeds_event.dart';
part 'feeds_state.dart';

class FeedsBloc extends Bloc<ReelsEvent, FeedsState> {
  late ReelsRepository reelsRepository;
  late ScrollController feedController;
  // late StreamController<ApiResponse<List<Feed>>> _movieListController;
  // StreamSink<ApiResponse<List<Feed>>> get movieListSink => _movieListController.sink;
  // Stream<ApiResponse<List<Feed>>> get movieListStream => _movieListController.stream;

  FeedsBloc() : super(FeedsState()) {
    // _movieListController = StreamController<ApiResponse<List<Feed>>>();
    feedController = ScrollController();
    feedController.addListener(() {
      if (feedController.offset >= feedController.position.maxScrollExtent && !feedController.position.outOfRange) {
        Future.delayed(
          Duration.zero,
          () {
            add(LoadsFeedsEvent(
              page: state.page + 1,
            ));
          },
        );
      }
    });
    reelsRepository = DIContainer.DI.get<ReelsRepository>();
    on<LoadsFeedsEvent>(loadFeedData);
  }

  FutureOr<void> loadFeedData(LoadsFeedsEvent event, Emitter<FeedsState> emit) async {
    try {
      var data = await reelsRepository.loadFeeds(page: event.page, limit: event.limit);
      emit(state.copyWith(feedItems: data?.feed.data, page: event.page, limit: event.limit));
    } catch (e) {
      var result = await EnvironmentSecretsService.appSecretService();
      emit(
        state.copyWith(
          feedItems: result.feed.data,
          page: event.page,
          limit: event.limit,
        ),
      );
    }
  }
}
