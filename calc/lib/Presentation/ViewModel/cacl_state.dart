part of 'cacl_cubit.dart';

@immutable
abstract class CaclState {}

class CaclInitial extends CaclState {}

class ClearState extends CaclState {}

class DeleteState extends CaclState {}

class InputUserState extends CaclState {}
