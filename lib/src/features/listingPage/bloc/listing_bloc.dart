import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/database.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/feed-db-helper/feed_db_helper.dart';
import 'package:flutter_social_media_ui/src/common/utils.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';

part 'listing_event.dart';
part 'listing_state.dart';

class ListingBloc extends Bloc<ListingEvent, ListingState> {
  final CategoryType type;
  ListingBloc(this.type) : super(ListingInitialState()) {
    on<ListingEvent>((event, emit) {});
    on<UpdateDBEvent>(updateDBEvent);
    on<InitialData>(initialDataLoad);
  }

  FutureOr<void> updateDBEvent(UpdateDBEvent event, Emitter<ListingState> emit) async {
    var feedTableDBHelper = DIContainer.DI.get<FeedTableDBHelper>();
    await feedTableDBHelper.getSingleOrNull((p0) => p0.id.isValue(event.id)).then(
      (value) async {
        if (value != null) {
          //var updatedData = value!.copyWith(isLiked: Value(event.isLiked), isWished: Value(event.isWished));
          var result = await feedTableDBHelper.updateDataWithWhereCondition(
            (p0) => p0.id.isValue(event.id),
            FeedTableCompanion(
              id: Value(value.id),
              contentId: Value(value.contentId),
              isLiked: Value(event.isLiked),
              isWished: Value(event.isWished),
            ),
          );
          if (result > 0) {
            add(InitialData());
          }
        }
      },
    );
  }

  FutureOr<void> initialDataLoad(InitialData event, Emitter<ListingState> emit) async {
    await DIContainer.DI
        .get<FeedTableDBHelper>()
        .getAllTableDataWithFilter((p0) => type == CategoryType.isLiked ? p0.isLiked : p0.isWished)
        .then(
      (value) {
        emit(ListingInitialState(type, type == CategoryType.isLiked ? "Liked" : "Wishlist", value));
      },
    );
  }
}
