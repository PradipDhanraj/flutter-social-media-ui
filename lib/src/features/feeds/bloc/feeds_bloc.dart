import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/secrets.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/database.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/feed-db-helper/feed_db_helper.dart';
import 'package:flutter_social_media_ui/src/common/utils.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/feeds/repository/model/feeds_model.dart';
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
      //var data = await reelsRepository.loadFeeds(page: event.page, limit: event.limit);
      FeedData? data = await EnvironmentSecretsService.appSecretService();
      emit(state.copyWith(newFeedItems: data?.feed.data, page: event.page, limit: event.limit));
      var dbItems = await DIContainer.DI.get<FeedTableDBHelper>().getAllTableData();
      for (var element in data?.feed.data ?? []) {
        var item = dbItems.where((p0) => p0.contentId == (element.id)).singleOrNull;
        if (item != null) {
          element.isLiked = item.isLiked ?? false;
          element.isWished = item.isWished ?? false;
        }
      }
      emit(
        state.copyWith(
          newFeedItems: data?.feed.data ?? [],
          page: event.page,
          limit: event.limit,
        ),
      );
    } catch (e) {
      print(e);
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
              // contentId: Value(event.feedData.id),
              // userId: Value(event.feedData.userId),
              isLiked: Value(event.feedData.isLiked),
              isWished: Value(event.feedData.isWished),
              // title: Value(event.feedData.title),
              // url: Value(event.feedData.url),
              // username: Value(event.feedData.user.username),
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
              title: Value(event.feedData.title),
              url: Value(event.feedData.url),
              username: Value(event.feedData.user.username),
            ),
          )
              .onError(
            (error, stackTrace) {
              return Future.value(null);
            },
          );
          emit(state.copyWith());
        }

        // switch (event.fromSettings) {
        //   case true:
        //     //var updatedData = value!.copyWith(isLiked: Value(event.isLiked), isWished: Value(event.isWished));
        //     await feedTableDBHelper.updateDataWithWhereCondition(
        //       (p0) => p0.id.isValue(event.feedData.id),
        //       FeedTableCompanion(
        //         id: Value(value!.id),
        //         contentId: Value(value.contentId),
        //         isLiked: Value(event.isLiked),
        //         isWished: Value(event.isWished),
        //       ),
        //     );
        //     break;
        //   default:
        // }
      },
    );
  }
}
