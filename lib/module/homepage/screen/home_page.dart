import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horoscope/module/homepage/screen/details_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<List<String>> horoscopeList = [
    ['assets/images/aries.png', 'aries'],
    ['assets/images/taurus.png', 'taurus'],
    ['assets/images/gemini.png', 'gemini'],
    ['assets/images/cancer.png', 'cancer'],
    ['assets/images/leo.png', 'leo'],
    ['assets/images/virgo.png', 'virgo'],
    ['assets/images/libra.png', 'libra'],
    ['assets/images/scorpio.png', 'scorpio'],
    ['assets/images/sagitturus.png', 'sagittarius'],
    ['assets/images/capricorn.png', 'capricorn'],
    ['assets/images/aquarus.png', 'aquarius'],
    ['assets/images/pisces.png', 'pisces'],
  ];

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
                    height: 215,
                  ),
                  Text(
                    "HOROSCOPE",
                    style: GoogleFonts.vidaloka(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 228, 226, 224),
                        letterSpacing: 1.5),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "PICK YOUR ZODIAC SIGN",
                    style: GoogleFonts.vidaloka(
                        fontSize: 19,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffBBAA69),
                        letterSpacing: 1.8),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 145,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 35,
                    ),
                    itemCount: horoscopeList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: (){
                              
    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(id: horoscopeList[index][1], image: horoscopeList[index][0])));
   },
                              child: Image.asset(
                                horoscopeList[index][0],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                horoscopeList[index][1],
                                style: GoogleFonts.vidaloka(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 228, 226, 224),
                                    letterSpacing: 1.5),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
