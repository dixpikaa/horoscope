import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope/module/homepage/controller/detailspage_controller.dart';
import 'package:toggle_switch/toggle_switch.dart';

class DetailsPage extends StatefulWidget {
  String? id;
  String? image;

  DetailsPage({Key? key, this.id, this.image}) : super(key: key) {
   
    DetailPage detailController = Get.put(DetailPage());
    detailController.horoscopeId = id; 
  }

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}
class _DetailsPageState extends State<DetailsPage> {
  List<String> labels = ['Daily', 'Weekly', 'Monthly', 'Yearly'];
  DetailPage detailController = Get.put(DetailPage());



  @override
  void initState() {
    super.initState();

    if (widget.id != null) {
       detailController.horoscopeId = widget.id!;
       detailController.updateSelectedIndex(0);
      detailController.fetchHoroscopeDetails(widget.id!);
       detailController.fetchWeeklyHoroscopeDetails(widget.id!);
       detailController.fetchMonthlyHoroscopeDetails(widget.id!);
       detailController.fetchYearlyHoroscopeDetails(widget.id!);
     
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/moons 1.png'),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 15),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/app.png',
                          scale: 1.08,
                        ),
                        Image.asset(
                          'assets/icons/settings.png',
                          scale: 1.08,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Center(
                      child: Column(
                    children: [
                      Image.asset(widget.image!, scale: 7,),
                      SizedBox(height: 5,),
                      Text(
                        widget.id!.toUpperCase(),
                        style: GoogleFonts.vidaloka(
                            fontSize: 26.5,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 241, 241, 241),
                            letterSpacing: 1.5,
                            height: 2.5),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    
                      const Divider(
                        thickness: 0.5,
                        color: const Color.fromARGB(255, 205, 204, 204),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      
                      ToggleSwitch(
                        minWidth: 87,
                        minHeight: 40,
                        totalSwitches: labels.length,
                        customTextStyles: [
                          GoogleFonts.vidaloka(
                            fontSize: 14.5,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 241, 241, 241),
                            letterSpacing: 1,
                          )
                        ],
                        labels: labels,
                        fontSize: 16,
                        activeBgColor: const [Color.fromARGB(255, 9, 28, 43)],
                        inactiveBgColor: Color.fromARGB(255, 88, 114, 133),
                        onToggle: (index) {
                           detailController.updateSelectedIndex(index!);
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                     Obx(
  () {
    if (detailController.isloading.value) {
      
      return const Center(child: Padding(
        padding: EdgeInsets.only(top:60.0),
        child: CircularProgressIndicator( color: Colors.white,),
      ));
    } else if (detailController.selectedIndex == 0) {
      return Text(
        detailController.horoscopeDetails.value?.horoscope ?? 'No horoscope found',
        style: GoogleFonts.viaodaLibre(
          fontSize: 17.5,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 221, 221, 221),
          letterSpacing: 1,
          height: 1.8,
        ),
        textAlign: TextAlign.start,
      );
    } else if (detailController.selectedIndex == 1) {
      return Text(
        detailController.WeeklyhoroscopeDetails.value?.horoscope ?? 'No horoscope found',
        style: GoogleFonts.viaodaLibre(
          fontSize: 17.5,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 221, 221, 221),
          letterSpacing: 1,
          height: 1.8,
        ),
        textAlign: TextAlign.start,
      );} 
      else if (detailController.selectedIndex == 2) {
      return Text(
        detailController.MonthlyhoroscopeDetails.value?.horoscope ?? 'No horoscope found',
        style: GoogleFonts.viaodaLibre(
          fontSize: 17.5,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 221, 221, 221),
          letterSpacing: 1,
          height: 1.8,
        ),
        textAlign: TextAlign.start,
      );}
      else if (detailController.selectedIndex == 3) {
      return Text(
        detailController.YearlyhoroscopeDetails.value?.horoscope ?? 'No horoscope found',
        style: GoogleFonts.viaodaLibre(
          fontSize: 17.5,
          fontWeight: FontWeight.w600,
          color: Color.fromARGB(255, 221, 221, 221),
          letterSpacing: 1,
          height: 1.8,
        ),
        textAlign: TextAlign.start,
      );}  else {
      return SizedBox(); 
    }
  },
),
 SizedBox(height: 20,),

                    ],
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
