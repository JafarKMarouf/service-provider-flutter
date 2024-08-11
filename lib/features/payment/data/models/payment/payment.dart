import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'payment_data.dart';

class Payment extends Equatable {
  final String? status;
  final PaymentData? data;
  final String? message;

  const Payment({this.status, this.data, this.message});

  factory Payment.fromMap(Map<String, dynamic> data) => Payment(
        status: data['status'] as String?,
        data: data['data'] == null
            ? null
            : PaymentData.fromMap(data['data'] as Map<String, dynamic>),
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data?.toMap(),
        'message': message,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Payment].
  factory Payment.fromJson(String data) {
    return Payment.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Payment] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, data, message];
}
