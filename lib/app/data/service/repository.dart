abstract class Repository {
  void getCurrentWeatherByCoordinate({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  void getDailyWeatherByCoordinate({
    required Function() beforeSend,
    required Function(dynamic data) onSuccess,
    required Function(dynamic erro) onError,
    required String lat,
    required String lon,
  });

  void getCoordinateByCityName();
}
