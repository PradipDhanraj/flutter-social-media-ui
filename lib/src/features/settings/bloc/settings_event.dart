part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

class NavigateToPage extends SettingsEvent {
  final String routeName;
  final dynamic args;
  NavigateToPage(this.routeName, [this.args]);
}
