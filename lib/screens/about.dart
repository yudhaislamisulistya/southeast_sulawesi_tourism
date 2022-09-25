import 'package:bella_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:accordion/accordion.dart';
import 'package:accordion/accordion_section.dart';
import 'package:accordion/controllers.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    final _headerStyle = const TextStyle(
        color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
    final _contentStyleHeader = const TextStyle(
        color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
    final _contentStyle = const TextStyle(
        color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
    final _loremIpsum =
        '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
    final _introduction =
        '''Aplikasi in sebuah aplikasi yang dirancang untuk menampilkan informasi parawisata didaerah sulawesi tenggarah. Aplikasi ini dibuat untuk memenuhi tugas akhir dari penelitian saya''';
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
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "About",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: colorAccent),
                    ),
                    Row(
                      children: [
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
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Parawisata Sultra",
                  style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: colorAccent,
                      letterSpacing: 2.0),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Accordion(
                  paddingListTop: 0,
                  paddingListBottom: 0,
                  maxOpenSections: 2,
                  headerBackgroundColorOpened: Colors.black54,
                  scaleWhenAnimating: true,
                  openAndCloseAnimation: true,
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: true,
                      leftIcon: const Icon(Icons.insights_rounded,
                          color: Colors.white),
                      headerBackgroundColor: Colors.black54,
                      headerBackgroundColorOpened: colorPrimary,
                      header: Text('Introduction', style: _headerStyle),
                      content: Text(_introduction, style: _contentStyle),
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
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: true,
                      leftIcon: const Icon(Icons.map, color: Colors.white),
                      headerBackgroundColor: Colors.black54,
                      headerBackgroundColorOpened: colorPrimary,
                      header: Text('Bagaiamana Cara Lihat Map ?',
                          style: _headerStyle),
                      content: Text(_loremIpsum, style: _contentStyle),
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
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: true,
                      leftIcon: const Icon(Icons.room, color: Colors.white),
                      headerBackgroundColor: Colors.black54,
                      headerBackgroundColorOpened: colorPrimary,
                      header: Text('Cara Mencari Destinasi Wisata ?',
                          style: _headerStyle),
                      content: Text(_loremIpsum, style: _contentStyle),
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
                  headerPadding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
                  sectionClosingHapticFeedback: SectionHapticFeedback.light,
                  children: [
                    AccordionSection(
                      isOpen: true,
                      leftIcon: const Icon(Icons.app_settings_alt,
                          color: Colors.white),
                      headerBackgroundColor: Colors.black54,
                      headerBackgroundColorOpened: colorPrimary,
                      header: Text('Tentang Aplikasi', style: _headerStyle),
                      content: Text(_loremIpsum, style: _contentStyle),
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
