import 'package:dio/dio.dart';
import 'package:horoscope/model/model.dart';

class HoroscopeRepository {
  Dio dio = Dio();
  final List<String> zodiacSigns = [
    "aries", "taurus", "gemini", "cancer", "leo", "virgo",
    "libra", "scorpio", "sagittarius", "capricorn", "aquarius", "pisces",
  ];

  Future<Horoscope> getHoroscope(String id) async {
    if (zodiacSigns.contains(id)) {
      try {
        Response response = await dio.get(
          'https://horoscope-astrology.p.rapidapi.com/horoscope?day=today&sunsign=$id',
          options: Options(headers: {
            'x-rapidapi-host': 'horoscope-astrology.p.rapidapi.com',
            'x-rapidapi-key': '531ee799c8mshe9c00229912051cp111347jsn70c96fc11a0e',
          }),
        );

        if (response.statusCode == 200) {
          Horoscope data = Horoscope.fromJson(response.data);
          return data;
        } else {
          throw Exception('Failed to fetch horoscope data for $id');
        }
      } catch (e) {
        print(e);
        throw e;
      }
    } else {
      throw Exception('Invalid zodiac sign id: $id');
    }
  }

  Future<Horoscope> getWeeklyHoroscope(String id) async {
    if (zodiacSigns.contains(id)) {
      try {
        Response response = await dio.get(
          'https://horoscope-astrology.p.rapidapi.com/horoscope?day=week&sunsign=$id',
          options: Options(headers: {
            'x-rapidapi-host': 'horoscope-astrology.p.rapidapi.com',
            'x-rapidapi-key': '531ee799c8mshe9c00229912051cp111347jsn70c96fc11a0e',
          }),
        );

        if (response.statusCode == 200) {
          Horoscope data = Horoscope.fromJson(response.data);
          return data;
        } else {
          throw Exception('Failed to fetch horoscope data for $id');
        }
      } catch (e) {
        print(e);
        throw e;
      }
    } else {
      throw Exception('Invalid zodiac sign id: $id');
    }
  }


  Future<Horoscope> getMonthlyHoroscope(String id) async {
    if (zodiacSigns.contains(id)) {
      try {
        Response response = await dio.get(
          'https://horoscope-astrology.p.rapidapi.com/horoscope?day=month&sunsign=$id',
          options: Options(headers: {
            'x-rapidapi-host': 'horoscope-astrology.p.rapidapi.com',
            'x-rapidapi-key': '531ee799c8mshe9c00229912051cp111347jsn70c96fc11a0e',
          }),
        );

        if (response.statusCode == 200) {
          Horoscope data = Horoscope.fromJson(response.data);
          return data;
        } else {
          throw Exception('Failed to fetch horoscope data for $id');
        }
      } catch (e) {
        print(e);
        throw e;
      }
    } else {
      throw Exception('Invalid zodiac sign id: $id');
    }
  }

  Future<Horoscope> getYearlyHoroscope(String id) async {
    if (zodiacSigns.contains(id)) {
      try {
        Response response = await dio.get(
          'https://horoscope-astrology.p.rapidapi.com/horoscope?day=year&sunsign=$id',
          options: Options(headers: {
            'x-rapidapi-host': 'horoscope-astrology.p.rapidapi.com',
            'x-rapidapi-key': '531ee799c8mshe9c00229912051cp111347jsn70c96fc11a0e',
          }),
        );

        if (response.statusCode == 200) {
          Horoscope data = Horoscope.fromJson(response.data);
          return data;
        } else {
          throw Exception('Failed to fetch horoscope data for $id');
        }
      } catch (e) {
        print(e);
        throw e;
      }
    } else {
      throw Exception('Invalid zodiac sign id: $id');
    }
  }
}
