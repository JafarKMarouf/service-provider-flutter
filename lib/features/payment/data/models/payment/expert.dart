import 'dart:convert';

import 'package:equatable/equatable.dart';

class Expert extends Equatable {
	final int? id;
	final String? mobile;

	const Expert({this.id, this.mobile});

	factory Expert.fromMap(Map<String, dynamic> data) => Expert(
				id: data['id'] as int?,
				mobile: data['mobile'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'mobile': mobile,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Expert].
	factory Expert.fromJson(String data) {
		return Expert.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [Expert] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	List<Object?> get props => [id, mobile];
}
