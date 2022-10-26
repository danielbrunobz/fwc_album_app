import 'package:fifa_world_cup_album/app/core/ui/messages.dart';
import 'package:fifa_world_cup_album/app/models/user_model.dart';
import 'package:fifa_world_cup_album/app/pages/home/view/home_view.dart';
import 'package:flutter/widgets.dart';
import '../../../core/ui/helpers/loader.dart';
import '../home_page.dart';

abstract class HomeViewImpl extends State<HomePage>
    with Loader<HomePage>, Messages<HomePage>
    implements HomeView {
    UserModel? user;

  @override
  void initState() {
  widget.presenter.view = this;
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    widget.presenter.getUserData();
  });
    super.initState();
  }



  @override
  void error(String message) {
    hideLoader();
    showError(message);
  }

  @override
  void logoutSuccess() {
    hideLoader();
    Navigator.of(context).pushNamedAndRemoveUntil('/auth/login', (route) => false);

  }

  @override
  void updateUser(UserModel user) {
  setState(() {
    this.user = user;
  });
  }
  
}