part of 'patient_bloc.dart';

@immutable
abstract class PatientEvent {}

class PatientAddEvent extends PatientEvent {
  final PatientModel patientModel;

  PatientAddEvent({required this.patientModel});
}

