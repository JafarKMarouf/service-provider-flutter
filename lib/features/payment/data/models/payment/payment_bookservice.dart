import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'customer.dart';
import 'expert.dart';

class Bookservice extends Equatable {
	final int? id;
	final int? customerId;
	final int? expertId;
	final int? serviceId;
	final String? deliveryDate;
	final String? deliveryTime;
	final String? location;
	final String? description;
	final String? status;
	final DateTime? createdAt;
	final DateTime? updatedAt;
	final Expert? expert;
	final Customer? customer;

	const Bookservice({
		this.id, 
		this.customerId, 
		this.expertId, 
		this.serviceId, 
		this.deliveryDate, 
		this.deliveryTime, 
		this.location, 
		this.description, 
		this.status, 
		this.createdAt, 
		this.updatedAt, 
		this.expert, 
		this.customer, 
	});

	factory Bookservice.fromMap(Map<String, dynamic> data) => Bookservice(
				id: data['id'] as int?,
				customerId: data['customer_id'] as int?,
				expertId: data['expert_id'] as int?,
				serviceId: data['service_id'] as int?,
				deliveryDate: data['delivery_date'] as String?,
				deliveryTime: data['delivery_time'] as String?,
				location: data['location'] as String?,
				description: data['description'] as String?,
				status: data['status'] as String?,
				createdAt: data['created_at'] == null
						? null
						: DateTime.parse(data['created_at'] as String),
				updatedAt: data['updated_at'] == null
						? null
						: DateTime.parse(data['updated_at'] as String),
				expert: data['expert'] == null
						? null
						: Expert.fromMap(data['expert'] as Map<String, dynamic>),
				customer: data['customer'] == null
						? null
						: Customer.fromMap(data['customer'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'customer_id': customerId,
				'expert_id': expertId,
				'service_id': serviceId,
				'delivery_date': deliveryDate,
				'delivery_time': deliveryTime,
				'location': location,
				'description': description,
				'status': status,
				'created_at': createdAt?.toIso8601String(),
				'updated_at': updatedAt?.toIso8601String(),
				'expert': expert?.toMap(),
				'customer': customer?.toMap(),
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Bookservice].
	factory Bookservice.fromJson(String data) {
		return Bookservice.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Bookservice] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props {
		return [
				id,
				customerId,
				expertId,
				serviceId,
				deliveryDate,
				deliveryTime,
				location,
				description,
				status,
				createdAt,
				updatedAt,
				expert,
				customer,
		];
	}
}
