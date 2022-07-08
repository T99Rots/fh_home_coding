import 'package:fh_home_coding/mock_api.dart';
import 'package:fh_home_coding/models/area_model.dart';
import 'package:fh_home_coding/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const FLutterCodingAssignmentApp());
}

class FLutterCodingAssignmentApp extends StatelessWidget {
  const FLutterCodingAssignmentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AreaModel(MockApi())..loadAreas())
      ],
      child: MaterialApp(
        routes: routes,
        initialRoute: '/home',
        title: 'Flutter Home Coding',
        debugShowCheckedModeBanner: false,
        theme: _buildTheme(Brightness.light),
      ),
    );
  }

  ThemeData _buildTheme(brightness) {
    var baseTheme = ThemeData(brightness: brightness);

    return baseTheme.copyWith(
      textTheme: GoogleFonts.openSansTextTheme(baseTheme.textTheme),
    );
  }
}