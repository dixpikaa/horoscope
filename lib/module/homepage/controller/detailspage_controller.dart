import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:horoscope/api/repository.dart';
import 'package:horoscope/model/model.dart';
import 'package:intl/intl.dart';

class DetailPage extends GetxController{

 // List<Horoscope> pokemonList = <Horoscope>[].obs;
  Rx<Horoscope?> horoscopeDetails = Rx<Horoscope?>(null);
Rx<Horoscope?> WeeklyhoroscopeDetails = Rx<Horoscope?>(null);
Rx<Horoscope?> MonthlyhoroscopeDetails = Rx<Horoscope?>(null);
Rx<Horoscope?> YearlyhoroscopeDetails = Rx<Horoscope?>(null);
RxInt selectedIndex = 0.obs;
  HoroscopeRepository obj = HoroscopeRepository();
  RxBool isloading = false.obs;
  String? horoscopeId;


  @override
  void onInit() {

    if (horoscopeId != null)  {
     fetchHoroscopeDetails(horoscopeId!);
     fetchWeeklyHoroscopeDetails(horoscopeId!);
     fetchMonthlyHoroscopeDetails(horoscopeId!);
     fetchYearlyHoroscopeDetails(horoscopeId!);
    }

    super.onInit();
  }

  void updateSelectedIndex(int index) {
  selectedIndex.value = index;
}

  Future fetchHoroscopeDetails(String name) async {
    try {
      isloading.value = true; 
      var horoscope = await obj.getHoroscope(name);

      horoscopeDetails.value = horoscope;
      print('horoscope is ${horoscopeDetails.value!.horoscope}');
    } finally {
      isloading(false);
    }
  }
  Future fetchWeeklyHoroscopeDetails(String name) async {
    try {
      isloading.value = true; 
      var horoscope = await obj.getWeeklyHoroscope(name);

      WeeklyhoroscopeDetails.value = horoscope;
      print('horoscope is ${WeeklyhoroscopeDetails.value!.horoscope}');
    } finally {
      isloading(false);
    }
  }
  Future fetchMonthlyHoroscopeDetails(String name) async {
    try {
      isloading.value = true; 
      var horoscope = await obj.getMonthlyHoroscope(name);

      MonthlyhoroscopeDetails.value = horoscope;
      print('horoscope is ${WeeklyhoroscopeDetails.value!.horoscope}');
    } finally {
      isloading(false);
    }
  }

  Future fetchYearlyHoroscopeDetails(String name) async {
    try {
      isloading.value = true; 
      var horoscope = await obj.getYearlyHoroscope(name);

      YearlyhoroscopeDetails.value = horoscope;
      print('horoscope is ${WeeklyhoroscopeDetails.value!.horoscope}');
    } finally {
      isloading(false);
    }
  }


}

