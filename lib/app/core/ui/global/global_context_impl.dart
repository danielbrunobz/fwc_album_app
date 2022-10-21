import 'package:fifa_world_cup_album/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../repository/auth/auth_repository.dart';
import 'global_context.dart';

class GlobalContextImpl implements GlobalContext {
  final GlobalKey<NavigatorState> navigatorKey;
  final AuthRepository authRepository;
  GlobalContextImpl({
    required this.navigatorKey,
    required this.authRepository,
  });

  @override
  Future<void> loginExpire() async {
    final sp = await SharedPreferences.getInstance();
    sp.clear();
    showTopSnackBar(
      navigatorKey.currentState!.context,
      CustomSnackBar.error(
        message: 'Login expirado',
        backgroundColor: ColorsApp.i.primary,
      ),
      overlayState: navigatorKey.currentState!.overlay,
    );
    navigatorKey.currentState!
        .pushNamedAndRemoveUntil('/auth/login', (route) => false);
  }
}
