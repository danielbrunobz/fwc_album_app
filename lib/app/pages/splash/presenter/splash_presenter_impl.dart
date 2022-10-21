import 'package:fifa_world_cup_album/app/pages/splash/presenter/splash_presenter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/splash_view.dart';

class SplashPresenterImpl implements SplashPresenter {
  late final SplashView _view;

  @override
  Future<void> checkLogin() async {
    _view.showLoader();

    final sp = await SharedPreferences.getInstance();
    final accessToken = sp.getString('accessToken');

    _view.logged(accessToken != null);
  }

  @override
  set view(view) => _view = view;
}
