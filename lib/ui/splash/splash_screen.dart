import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pawtify/ui/breeds/provider/breeds_provider.dart';
import 'package:pawtify/ui/home/screens/home_screen.dart';
import 'package:pawtify/ui/shared/app_logo.dart';
import 'package:pawtify/utils/navigator_utils.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<String>_getAppVersion () async{
    final info = await PackageInfo.fromPlatform();
    return info.version;
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    startApp();
  }

  Future<void>startApp() async{
    final breedsProvider = context.watch<BreedsProvider>();
    await breedsProvider.getAllBreeds();
    if (mounted){
      pushAndReplaceToPage(context, HomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration( 
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Color(0xffFFD0B1),
              Color(0xffFFBFD2)
            ],
            stops: [0.43,1]
          )
        ),
        child: SafeArea(
          child: Column(
            children: [
              Spacer(),
              //&logo app
              AppLogo(),
              Spacer(),
              //&Huellas
              SizedBox(
                height: 120,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Image.asset("assets/paw.png",height: 50,),
                        Spacer(),
                        Image.asset("assets/paw.png",height: 50,),
                        Spacer(),
                        Image.asset("assets/paw.png",height: 50,),
                        Spacer(),
                        Image.asset("assets/paw.png",height: 50,),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/paw.png",height: 50,),
                        Spacer(),
                        Image.asset("assets/paw.png",height: 50,),
                        Spacer(),
                        Image.asset("assets/paw.png",height: 50,),
                        Spacer(),
                        Image.asset("assets/paw.png",height: 50,),
                        Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: FutureBuilder<String>(
                  future: _getAppVersion(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                      return Text("version: ${snapshot.data}");
                      }else {
                      return Text("cargando versión...");
                      }
                    
                  }
                ),
              ),
            ],
          ),
        ),

      ),
    );

  }
}

