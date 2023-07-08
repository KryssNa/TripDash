import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripdash/Screens/SplashScreen/splash_scren3.dart';

class SplashScreen2 extends StatelessWidget {
  const SplashScreen2({super.key});
  static String routeName = "/SplashScreen2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(
              height: 460,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage('Assets/images/splash1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),

            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 28.0,right: 28,top: 8),
              child: Text.rich(
                TextSpan(
                  style: GoogleFonts.inter(
                      fontSize: 30,
                      fontWeight: FontWeight.w800
                  ),
                  children: [
                    const TextSpan(
                      text: 'It\'s a big world out there go',
                    ),
                    TextSpan(
                      text: ' explore',
                      style: GoogleFonts.inter(
                          fontSize: 30,
                          color: const Color(0xffff6700),
                          fontWeight: FontWeight.w800
                      ),
                    ),
                  ],
                ),

                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110.0,top:5),
              child: Image.asset('Assets/icons/iconArrow.png',),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0,vertical: 8),
              child: Text(
                'To get the best of your adventure you just need to leave and go where you like. we are waiting for you.',
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff7d848d),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8,
                    width: 24,
                    decoration: BoxDecoration(
                      color: const Color(0xffcae9fe),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 8,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xff0373f3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Container(
                    height: 8,
                    width: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xffcae9fe),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,top: 40,right: 16),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: const Color(0xff0373f3),
                ),
                child: TextButton(
                  onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SplashScreen3()));
                  },
                  child: Text(
                    'Next',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )


    );
  }
}
