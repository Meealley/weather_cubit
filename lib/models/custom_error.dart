// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  final String err;

  const CustomError({this.err = ""});

  @override
  List<Object> get props => [err];

  @override
  bool get stringify => true;
}
