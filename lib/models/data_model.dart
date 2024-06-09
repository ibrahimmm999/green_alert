// ignore_for_file: depend_on_referenced_packages

import 'package:equatable/equatable.dart';

class DataModel extends Equatable {
  final int id;
  final double uv;
  final double ph;
  final double humidity;

  const DataModel({
    required this.id,
    required this.uv,
    required this.ph,
    required this.humidity,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      uv: json['uv']?.toDouble() ?? 0.0,
      ph: json['ph']?.toDouble() ?? 0.0,
      humidity: json['humidity']?.toDouble() ?? 0.0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        uv,
        ph,
        humidity,
      ];
}
