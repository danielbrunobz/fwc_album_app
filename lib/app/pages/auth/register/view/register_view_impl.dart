import 'package:fifa_world_cup_album/app/core/ui/helpers/loader.dart';
import 'package:fifa_world_cup_album/app/pages/auth/register/view/register_view.dart';
import 'package:flutter/material.dart';


import '../../../../core/ui/messages.dart';
import '../register_page.dart';

abstract class RegisterViewImpl extends State<RegisterPage>
    with Messages<RegisterPage>, Loader<RegisterPage>
    implements RegisterView {
  @override
  void initState() {
    widget.presenter.view = this;
    super.initState();
  }

  @override
  void registerError([String? message]) {
    hideLoader();
    showError(message ?? 'Erro ao registrar usuário');
  }

  @override
  void registerSuccess() {
    hideLoader();
    showSucess('Usuário cadastrado com sucesso');
    Navigator.of(context).pop();
  }
}
