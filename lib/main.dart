import 'package:apexdmit_noor_alam_abir/data/local/local_storage.dart';
import 'package:apexdmit_noor_alam_abir/domain_infrastructure/core/dependecy_container.dart';
import 'package:apexdmit_noor_alam_abir/presentation/home_feature/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/auth_feature/pages/login_page.dart';


void main() async{
  setup();
  await Hive.initFlutter();
  await Hive.openBox('apexDMIT');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: (GetUserLocalStorageV2().isLogin()==true) ? HomePage() : LoginPage(),
      ),
    );
  }
}
