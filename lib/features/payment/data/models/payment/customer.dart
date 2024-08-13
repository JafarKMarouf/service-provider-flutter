import 'dart:convert';

import 'package:equatable/equatable.dart';

class Customer extends Equatable {
	final int? id;
	final String? mobile;

	const Customer({this.id, this.mobile});

	factory Customer.fromMap(Map<String, dynamic> data) => Customer(
				id: data['id'] as int?,
				mobile: data['mobile'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'mobile': mobile,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Customer].
	factory Customer.fromJson(String data) {
		return Customer.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Customer] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [id, mobile];
}
