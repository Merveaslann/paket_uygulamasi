import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_page.dart';
import 'own_travels_page.dart';
import '../widgets/styles.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 160,
            decoration: const BoxDecoration(
              color: Colors.deepPurple,
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  color: Color(0x34000000),
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: const Color(0xFF30B2A3),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: Container(
                        width: 70,
                        height: 70,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          'images/akademi.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            FirebaseAuth.instance.currentUser?.email ?? "",
                            style: GoogleFonts.getFont(
                              'Lexend Deca',
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                            child: Text(
                              'Hakkınızda..',
                              style: GoogleFonts.getFont(
                                  'Lexend Deca',
                                  color: const Color(0xFFFFEC20),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
            child:  Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OwnTravelsPage(),
                      ),
                    );
                  },
                  child: Material(
                    color: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFDBE2E7),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 4, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Seyahatlerim',
                              style: GoogleFonts.getFont(
                                'Lexend Deca',
                                color: const Color(0xFF090F13),
                                fontWeight: FontWeight.normal,
                                fontSize: 14,
                              ),
                            ),
                            CustomButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              buttonSize: 46,
                              icon: const Icon(
                                Icons.chevron_right_rounded,
                                color: Color(0xFF95A1AC),
                                size: 20,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const OwnTravelsPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              )
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 40),
            child: CustomButton2(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    )
                );
              },
              text: 'Çıkış',
              options: CustomButton2Options(
                width: 110,
                height: 50,
                color: const Color(0xFFDBE2E7),
                textStyle: GoogleFonts.getFont(
                  'Lexend Deca',
                  color: const Color(0xFF090F13),
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                elevation: 0,
                borderSide: const BorderSide(color: Color(0xFFDBE2E7), width: 1),
                borderRadius: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
