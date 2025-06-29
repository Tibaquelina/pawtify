import 'package:flutter/material.dart';
import 'package:pawtify/data/impl/app_impl.dart';
import 'package:pawtify/data/impl/secure_storage_impl.dart';
import 'package:pawtify/data/repositories/app_repository.dart';
import 'package:pawtify/data/repositories/secure_storage_repository.dart';
import 'package:pawtify/domain/usecaese/app_use_case.dart';
import 'package:pawtify/ui/breeds/provider/breeds_provider.dart';
import 'package:pawtify/ui/home/provider/home_provider.dart';
import 'package:pawtify/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //*REPOSITORIES
        Provider<AppRepository>(
          create: (_) => AppImpl(),
        ),
        Provider<SecureStorageRepository>(
          create: (_) => SecureStorageImpl()
        ),
        //*USE CASES
        ProxyProvider2<AppRepository, SecureStorageRepository,AppUseCase>(
          update: (_,appRepo, secureRepo, __)  => AppUseCase(appRepo, secureRepo),
        ),
        //*PROVIDERS
        ChangeNotifierProvider(create: (_)=> HomeProvider()),
        ChangeNotifierProxyProvider<AppUseCase, BreedsProvider>(
          create: (_)=> BreedsProvider(
            AppUseCase(AppImpl(), SecureStorageImpl())
          ),
          update: (_, useCase, __) => BreedsProvider(useCase)
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:Colors.deepPurple),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}

