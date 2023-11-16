import 'package:equatable/equatable.dart';

class ExceptionModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ExceptionModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ExceptionModel.fromJson(Map<String, dynamic> json) => ExceptionModel(
        statusCode: json['status_code'],
        statusMessage: json['status_message'],
        success: json['success'],
      );

  @override
  List<Object?> get props => [
        statusCode,
        statusMessage,
        success,
      ];
}
