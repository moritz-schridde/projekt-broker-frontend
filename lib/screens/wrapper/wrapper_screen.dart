import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projekt_broker_frontend/screens/crash/crash_screen.dart';
import 'package:projekt_broker_frontend/screens/home/home_screen.dart';
import 'package:projekt_broker_frontend/screens/loading/loading_screen.dart';
import 'package:projekt_broker_frontend/screens/register/register_screen.dart';
import 'package:projekt_broker_frontend/services/backend_service.dart';
import 'package:provider/provider.dart';

import '../../models/user_info.dart';

class WrapperScreen extends StatelessWidget {
  static const routeName = "/wrapper";

  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final backendService = context.read<BackendService>();

      try {
        final UserInfo userInfo = await backendService.callBackend<UserInfo>(
          requestType: RequestType.GET,
          endpoint: "user",
          jsonParser: (json) => UserInfo.fromJson(json),
        );
      } catch (e) {
        // no user
        print('lets go some register, because i have $e');
        switch (e) {
          case 456:
            Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
            break;
          default:
            Navigator.pushReplacementNamed(context, CrashScreen.routeName);
        }
        return;
      }

      // else if user
      print("i like my home");
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });

    return LoadingScreen();
  }
}
