part of 'patient_bloc.dart';

@immutable
abstract class PatientState {}

class PatientInitial extends PatientState {}

class PatientAddSuccess extends PatientState {
  final PatientModel patientInfo;
  PatientAddSuccess({
    required this.patientInfo,
  });
}
