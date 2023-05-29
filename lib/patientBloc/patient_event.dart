part of 'patient_bloc.dart';

@immutable
abstract class PatientEvent {}

class PatientAddEvent extends PatientEvent {
  final String name;
  final String surName;
  final int number;
  final DateTime? dateTime;
  PatientAddEvent({
    required this.name,
    required this.surName,
    required this.number,
    this.dateTime,
  });
}

