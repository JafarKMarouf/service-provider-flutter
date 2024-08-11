import 'dart:convert';

import 'package:equatable/equatable.dart';

class PaymentData extends Equatable {
  final String? bookServiceId;
  final int? paymentExpertId;
  final String? amount;
  final String? operationNumber;
  final DateTime? updatedAt;
  final DateTime? createdAt;
  final int? id;

  const PaymentData({
    this.bookServiceId,
    this.paymentExpertId,
    this.amount,
    this.operationNumber,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory PaymentData.fromMap(Map<String, dynamic> data) => PaymentData(
        bookServiceId: data['book_service_id'] as String?,
        paymentExpertId: data['payment_expert_id'] as int?,
        amount: data['amount'] as String?,
        operationNumber: data['operation_number'] as String?,
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
        id: data['id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'book_service_id': bookServiceId,
        'payment_expert_id': paymentExpertId,
        'amount': amount,
        'operation_number': operationNumber,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
        'id': id,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentData].
  factory PaymentData.fromJson(String data) {
    return PaymentData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentData] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      bookServiceId,
      paymentExpertId,
      amount,
      operationNumber,
      updatedAt,
      createdAt,
      id,
    ];
  }
}
