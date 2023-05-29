import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'now_time_event.dart';
part 'now_time_state.dart';

class NowTimeBloc extends Bloc<NowTimeEvent, DateState> {
  NowTimeBloc() : super(DateState()) {
    on<UpdateNowTimeEvent>(_addTime);
  }
  FutureOr<void> _addTime(
    UpdateNowTimeEvent event,
    Emitter<DateState> emit,
  ) {
      final DateTime result = event.nowTime;
      print('sadaddasda $result');
      emit(DateState( nowTime: result));
    }
}
