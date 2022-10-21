import 'package:fifa_world_cup_album/app/pages/auth/login/view/login_view.dart';

import '../../../../core/mvp/fwc_presenter.dart';


abstract class LoginPresenter extends FwcPresenter<LoginView> {
  Future<void> login(String email, String password);
}
