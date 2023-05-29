part of 'now_time_bloc.dart';

@immutable
abstract class NowTimeEvent {}

class UpdateNowTimeEvent extends NowTimeEvent {
  final DateTime nowTime;

  UpdateNowTimeEvent(this.nowTime);
}