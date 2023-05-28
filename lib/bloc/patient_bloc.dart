import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../models/patient_model.dart';

part 'patient_event.dart';
part 'patient_state.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  PatientBloc() : super(const PatientState()) {
    on<PatientAddEvent>(_onAddPatient);
  }

  FutureOr<void> _onAddPatient(
    PatientAddEvent event,
    Emitter<PatientState> emit,
  ) {
    final result = PatientModel(
      name: event.name,
      surName: event.surName,
      number: event.number,
      dateTime: event.dateTime,
    );
    final patientList = List<PatientModel>.from(state.patientInfo);
    patientList.add(result);
    emit(PatientState(patientInfo: patientList, status: PatientStatus.loaded));

  }
}
