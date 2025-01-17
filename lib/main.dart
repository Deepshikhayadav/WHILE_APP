import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:while_app/repository/firebase_repository.dart';
import 'package:while_app/utils/routes/routes_name.dart';
import 'package:while_app/view_model/profile_controller.dart';
import 'utils/routes/routes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<FirebaseAuthMethods>(create: (_)=>FirebaseAuthMethods(FirebaseAuth.instance)),
      ChangeNotifierProvider<ProfileController>(create: (_)=>ProfileController()),
      StreamProvider(create: (context)=>context.read<FirebaseAuthMethods>().authState, initialData: null)
    ],child: MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: RoutesName.splash,
     onGenerateRoute: Routes.generateRoute,
    ));
  }
}
