import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../models/patient_model.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  PatientBloc() : super(PatientInitial()) {
    on<PatientEvent>((event, emit) {
      if(event is PatientAddEvent) {
        final result = event.patientModel;
        if(result is PatientModel) {
        print('2');
          emit(PatientAddSuccess(patientInfo: result));
        }
      }
    });
  }
}
