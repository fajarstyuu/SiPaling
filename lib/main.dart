import 'package:sipaling/ExpansionPanelList.dart';
import 'package:sipaling/InptKelas.dart';
import 'package:sipaling/TranskripMhs.dart';
import 'package:sipaling/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:sipaling/informasiPerwalian.dart';
import 'package:sipaling/inputKelas.dart';
import 'package:sipaling/role.dart';
import 'package:sipaling/schedulemhs.dart';
import 'package:sipaling/template/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SiPaling Undip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        appBar: MyNavbar(),
        body: Informasiperwalian(),
      ),
    );
  }
}
