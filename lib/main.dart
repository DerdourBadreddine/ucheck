import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:ucheck/core/utils/app_router.dart';
import 'package:ucheck/features/navigation_bar/view_model/cubit/navigation_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://hlepvedspymbjldkcomq.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhsZXB2ZWRzcHltYmpsZGtjb21xIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIyNzU0OTAsImV4cCI6MjAyNzg1MTQ5MH0.cuBginHS65YOnI-sWaWLtXhgKK_xXK3BQ7vRBqVaBJg');
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
            scaffoldBackgroundColor: Colors.white,
            textTheme: GoogleFonts.interTextTheme(),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            radioTheme: ThemeData.light().radioTheme.copyWith(
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Color(0xff5174DB);
                }
                return Color(0xffE5E3EE);
              }),
            )),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
