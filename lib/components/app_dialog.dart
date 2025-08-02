import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/theme/global_colors.dart';
import '../utils/theme/global_fonts.dart';

class AboutAppDialog extends StatelessWidget {
  final DateTime? lastSync;
  final String appVersion;
  final String mid;
  final String tid;
  final String branchId;
  final String loggedInUser;
  const AboutAppDialog(
      {this.lastSync,
        required this.appVersion,
        required this.mid,
        required this.tid,
        required this.branchId,
        required this.loggedInUser,
        super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      backgroundColor: GlobalColors.white,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: size.width * 0.3,
        color: GlobalColors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              SizedBox(height: size.height * 0.02),
              Image.asset('assets/maxclean/logo_max_clean.jpeg', width: 150),
              SizedBox(height: size.height * 0.04),
              const SizedBox(
                child: Text(
                  "MAXClean Apps",
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: GlobalFonts.fontFamilyJakarta,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "MID : $mid",
                style: const TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta, fontWeight: FontWeight.normal),
              ),
              Text(
                "TID : $tid",
                style: const TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta, fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 15),
              Text(
                "Version $appVersion",
                style: const TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: size.height * 0.05),
              SizedBox(
                child: Text(
                  "User Login : $loggedInUser",
                  style: const TextStyle(
                      fontSize: 15,
                      fontFamily: GlobalFonts.fontFamilyJakarta,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                lastSync == null
                    ? "Last Sync : -"
                    : "Last Sync : ${DateFormat('dd/MM/yyyy HH:mm').format(lastSync!)}",
                style: TextStyle(
                    fontFamily: GlobalFonts.fontFamilyJakarta, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 35),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFB71C1C), // merah tua (dark red)
                      Color(0xFFE53935), // GlobalColors.error
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),

                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Close',
                    style: TextStyle(
                      fontFamily: GlobalFonts.fontFamilyJakarta,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
