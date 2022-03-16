// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_weather.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MainWeatherAdapter extends TypeAdapter<MainWeather> {
  @override
  final int typeId = 0;

  @override
  MainWeather read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MainWeather(
      cityName: fields[0] as String?,
      weatherData: fields[1] as WeatherData,
    );
  }

  @override
  void write(BinaryWriter writer, MainWeather obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.cityName)
      ..writeByte(1)
      ..write(obj.weatherData);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MainWeatherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
