// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api, unused_local_variable

import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:bella_app/constants.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    const headerStyle = TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
    const contentStyleHeader = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
    const contentStyle = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
    const caraLihatMap = '''Silahkan mengunjungi halaman dashboard atau map dan melihat melihat informasi pada map yang telah disediakan.''';
    const tentangAplikasi = '''Aplikasi ini berjalan pada android minimal versi API 28.''';
    const introduction = '''Aplikasi in sebuah aplikasi yang dirancang untuk menampilkan informasi parawisata didaerah sulawesi tenggarah. Aplikasi ini dibuat untuk memenuhi tugas akhir dari penelitian saya''';
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "About",
                      style: TextStyle(fontWeight: FontWeight.bold, color: colorAccent),
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.pin_drop,
                          color: colorPrimary,
                          size: 16,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text("Kendari, ID"),
                        SizedBox(
                          width: 2.0,
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: colorPrimary,
                          size: 10,
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  "Parawisata Sultra",
                  style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: colorAccent, letterSpacing: 2.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Accordion(
                  paddingListTop: 0,
                  paddingListBottom: 0,
                  maxOpenSections: 2,
                  headerBackgroundColorOpened: Colors.black54,
                  scaleWhenAnimating: true,
                  openAndCloseAnimation: true,
                  headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: true,
                      leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
                      headerBackgroundColor: Colors.black54,
                      headerBackgroundColorOpened: colorPrimary,
                      header: const Text('Introduction', style: headerStyle),
                      content: const Text(introduction, style: contentStyle),
                      contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                    ),
                  ],
                ),
                Accordion(
                  paddingListTop: 0,
                  paddingListBottom: 0,
                  maxOpenSections: 2,
                  headerBackgroundColorOpened: Colors.black54,
                  scaleWhenAnimating: true,
                  openAndCloseAnimation: true,
                  headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: true,
                      leftIcon: const Icon(Icons.map, color: Colors.white),
                      headerBackgroundColor: Colors.black54,
                      headerBackgroundColorOpened: colorPrimary,
                      header: const Text('Bagaiamana Cara Lihat Map ?', style: headerStyle),
                      content: const Text(caraLihatMap, style: contentStyle),
                      contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                    ),
                  ],
                ),
                Accordion(
                  paddingListTop: 0,
                  paddingListBottom: 0,
                  maxOpenSections: 2,
                  headerBackgroundColorOpened: Colors.black54,
                  scaleWhenAnimating: true,
                  openAndCloseAnimation: true,
                  headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: true,
                      leftIcon: const Icon(Icons.app_settings_alt, color: Colors.white),
                      headerBackgroundColor: Colors.black54,
                      headerBackgroundColorOpened: colorPrimary,
                      header: const Text('Tentang Aplikasi', style: headerStyle),
                      content: const Text(tentangAplikasi, style: contentStyle),
                      contentHorizontalPadding: 20,
                      contentBorderWidth: 1,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
