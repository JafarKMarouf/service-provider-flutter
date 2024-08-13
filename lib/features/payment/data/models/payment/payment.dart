import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'payment_datum.dart';

class Payment extends Equatable {
  final String? status;
  final List<PaymentDatum>? data;

  const Payment({this.status, this.data});

  factory Payment.fromMap(Map<String, dynamic> data) => Payment(
        status: data['status'] as String?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => PaymentDatum.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data?.map((e) => e.toMap()).toList(),
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
  List<Object?> get props => [status, data];
}
