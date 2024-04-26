import 'package:equatable/equatable.dart';

import 'datum_service.dart';

class Service extends Equatable {
	final String? status;
	final int? count;
	final List<DatumService>? data;

	const Service({this.status, this.count, this.data});

	factory Service.fromJson(Map<String, dynamic> json) => Service(
				status: json['status'] as String?,
				count: json['count'] as int?,
				data: (json['data'] as List<dynamic>?)
						?.map((e) => DatumService.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'status': status,
				'count': count,
				'data': data?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [status, count, data];
}
