import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'payment_bookservice.dart';

class PaymentDatum extends Equatable {
  final int? id;
  final int? bookServiceId;
  final int? paymentExpertId;
  final String? amount;
  final String? operationNumber;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Bookservice? bookservice;

  const PaymentDatum({
    this.id,
    this.bookServiceId,
    this.paymentExpertId,
    this.amount,
    this.operationNumber,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.bookservice,
  });

  factory PaymentDatum.fromMap(Map<String, dynamic> data) => PaymentDatum(
        id: data['id'] as int?,
        bookServiceId: data['book_service_id'] as int?,
        paymentExpertId: data['payment_expert_id'] as int?,
        amount: data['amount'] as String?,
        operationNumber: data['operation_number'] as String?,
        status: data['status'] as String?,
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        bookservice: data['bookservice'] == null
            ? null
            : Bookservice.fromMap(data['bookservice'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'book_service_id': bookServiceId,
        'payment_expert_id': paymentExpertId,
        'amount': amount,
        'operation_number': operationNumber,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'bookservice': bookservice?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentDatum].
  factory PaymentDatum.fromJson(String data) {
    return PaymentDatum.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentDatum] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      bookServiceId,
      paymentExpertId,
      amount,
      operationNumber,
      status,
      createdAt,
      updatedAt,
      bookservice,
    ];
  }
}
