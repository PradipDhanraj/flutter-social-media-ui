import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_media_ui/src/common/app_navigation.dart';
import 'package:flutter_social_media_ui/src/common/services/db-service/feed-db-helper/feed_db_helper.dart';
import 'package:flutter_social_media_ui/src/common/utils.dart';
import 'package:flutter_social_media_ui/src/dependency_injection.dart';
import 'package:flutter_social_media_ui/src/features/feeds/repository/model/feeds_model.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<SettingsEvent>((event, emit) {});
    //on<NavigateToPage>(navigateToPage);
    on<NavigateToPage>(navigateToPageFuction);
  }

  FutureOr<void> navigateToPage(NavigateToPage event, Emitter<SettingsState> emit) async {
    var args = event.args as List;
    if (args.last as CategoryType == CategoryType.isWished) {
      await DIContainer.DI.get<FeedTableDBHelper>().getAllTableData().then(
        (value) {
          var lst = value.where((element) => element.isWished == true).toList();
          var argsList = [...args, lst];
          AppNavigation.navigateTo(event.routeName, arguments: argsList);
        },
      );
    }
    if (args.last as CategoryType == CategoryType.isLiked) {
      await DIContainer.DI.get<FeedTableDBHelper>().getAllTableData().then(
        (value) {
          var lst = value.where((element) => element.isLiked == true).toList();
          var argsList = [...args, lst];
          AppNavigation.navigateTo(event.routeName, arguments: argsList);
        },
      );
    }
  }

  FutureOr<void> navigateToPageFuction(NavigateToPage event, Emitter<SettingsState> emit) async{
    var args = event.args as List;
    if (args.last as CategoryType == CategoryType.isWished) {
      await DIContainer.DI.get<FeedTableDBHelper>().getAllTableData().then(
        (value) {
          var lst = value.where((element) => element.isWished == true).toList();
          var argsList = [...args, lst];
          AppNavigation.navigateTo(event.routeName, arguments: argsList);
        },
      );
    }
    if (args.last as CategoryType == CategoryType.isLiked) {
      await DIContainer.DI.get<FeedTableDBHelper>().getAllTableData().then(
        (value) {
          var lst = value.where((element) => element.isLiked == true).toList();
          var argsList = [...args, lst];
          AppNavigation.navigateTo(event.routeName, arguments: argsList);
        },
      );
    }
  }
}
