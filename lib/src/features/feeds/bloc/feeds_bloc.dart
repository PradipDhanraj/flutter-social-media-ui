import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/secrets.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/database.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/feed-db-helper/feed_db_helper.dart';
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
    on<UpdateReelsInformationEvent>(updateReelsInformationEvent);
  }

  FutureOr<void> loadFeedData(LoadsFeedsEvent event, Emitter<FeedsState> emit) async {
    try {
      var data = await reelsRepository.loadFeeds(page: event.page, limit: event.limit);
      emit(state.copyWith(newFeedItems: data?.feed.data, page: event.page, limit: event.limit));
    } catch (e) {
      var result = await EnvironmentSecretsService.appSecretService();
      var dbItems = await DIContainer.DI.get<FeedTableDBHelper>().getAllTableData();
      for (var element in result.feed.data) {
        var item = dbItems.where((p0) => p0.contentId == (element.id)).singleOrNull;
        if (item != null) {
          element.isLiked = item.isLiked ?? false;
          element.isWished = item.isWished ?? false;
        }
      }
      emit(
        state.copyWith(
          newFeedItems: result.feed.data,
          page: event.page,
          limit: event.limit,
        ),
      );
    }
  }

  FutureOr<void> updateReelsInformationEvent(UpdateReelsInformationEvent event, Emitter<FeedsState> emit) async {
    var feedTableDBHelper = DIContainer.DI.get<FeedTableDBHelper>();
    await feedTableDBHelper.getSingleOrNull((p0) => p0.contentId.isValue(event.feedData.id)).then(
      (value) async {
        if (value != null) {
          await feedTableDBHelper.updateDataWithWhereCondition(
            (p0) {
              return p0.contentId.isValue(event.feedData.id);
            },
            FeedTableCompanion(
              contentId: Value(event.feedData.id),
              userId: Value(event.feedData.userId),
              isLiked: Value(event.feedData.isLiked),
              isWished: Value(event.feedData.isWished),
            ),
          ).then(
            (value) {
              if (value > 0) {
                emit(state.copyWith());
              }
            },
          ).onError(
            (error, stackTrace) {
              if (kDebugMode) {
                print(error.toString());
              }
            },
          );
        } else {
          await feedTableDBHelper
              .inserData(
            FeedTableCompanion(
              contentId: Value(event.feedData.id),
              userId: Value(event.feedData.userId),
              isLiked: Value(event.feedData.isLiked),
              isWished: Value(event.feedData.isWished),
            ),
          )
              .onError(
            (error, stackTrace) {
              return Future.value(null);
            },
          );
          emit(state.copyWith());
        }
      },
    );
  }
}
