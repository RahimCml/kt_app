part of 'patient_bloc.dart';

enum PatientStatus{
  initial,
  loading,
  loaded,
}
@immutable
class PatientState {
    final List<PatientModel> patientInfo;
    final PatientStatus status;
   const PatientState({
    this.patientInfo= const <PatientModel>[],
    this.status = PatientStatus.initial
  });
}