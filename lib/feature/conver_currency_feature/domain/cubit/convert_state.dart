part of 'convert_cubit.dart';

@immutable
abstract class ConvertState {}

class ConvertInitial extends ConvertState {}
class ConvertLoading extends ConvertState {}
class ConvertError extends ConvertState {}
class ConvertDone extends ConvertState {}
class HistoricalLoading extends ConvertState {}

