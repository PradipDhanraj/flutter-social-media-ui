import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/reels/models/reels_model.dart';
import 'package:flutter_social_media_ui/src/features/reels/reels_repo.dart';
part 'reels_event.dart';
part 'reels_state.dart';

class ReelsBloc extends Bloc<ReelsEvent, ReelsState> {
  late ReelsRepository reelsRepository;
  ReelsBloc() : super(ReelsState()) {
    reelsRepository = DIContainer.DI.get<ReelsRepository>();
    on<ReelsEvent>(loadFeedData);
  }

  FutureOr<void> loadFeedData(ReelsEvent event, Emitter<ReelsState> emit) async {
    var data = await reelsRepository.loadFeeds(page: state.page);
    emit(state.copyWith(feedItems: data?.feed.data, page: state.page + 1));
    if (kDebugMode) {
      print(data);
    }
  }
}
