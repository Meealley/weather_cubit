// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String description;
  final String icon;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String name;
  final String country;
  final DateTime lastupdated;

  const Weather(
      {required this.description,
      required this.icon,
      required this.temp,
      required this.tempMin,
      required this.tempMax,
      required this.name,
      required this.country,
      required this.lastupdated});

  // factory Weather.fromJson(Map<String, dynamic> json) {
  //   final weather = json['weather'][0];

  //   final main = json['main'];

  //   return weather(
  //     description: weather['description'],
  //     icon: weather['icon'],
  //     temp: main['temp'],
  //     tempMin: main['temp_min'],
  //     tempMax: main['temp_max'],
  //     name: "",
  //     country: "",
  //     lastupdated: DateTime.now(),
  //   );
  // }

  factory Weather.fromJson(Map<String, dynamic> json) {
    final weather = json['weather'][0];
    final main = json['main'];

    // Return an instance of Weather class, not a map.
    return Weather(
      description: weather['description'],
      icon: weather['icon'],
      temp: main['temp'].toDouble(),
      tempMin: main['temp_min'].toDouble(),
      tempMax: main['temp_max'].toDouble(),
      name: json['name'] ?? "", // Add checks for null values
      country: json['sys']['country'] ?? "",
      lastupdated: DateTime.now(),
    );
  }

  factory Weather.initial() {
    return Weather(
      description: '',
      icon: '',
      temp: 100.0,
      tempMax: 210.0,
      tempMin: 90.0,
      name: '',
      country: '',
      lastupdated: DateTime(1970),
    );
  }

  @override
  List<Object> get props {
    return [
      description,
      icon,
      temp,
      tempMin,
      tempMax,
      name,
      country,
      lastupdated,
    ];
  }

  @override
  bool get stringify => true;

  Weather copyWith({
    String? description,
    String? icon,
    double? temp,
    double? tempMin,
    double? tempMax,
    String? name,
    String? country,
    DateTime? lastupdated,
  }) {
    return Weather(
      description: description ?? this.description,
      icon: icon ?? this.icon,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      name: name ?? this.name,
      country: country ?? this.country,
      lastupdated: lastupdated ?? this.lastupdated,
    );
  }
}
