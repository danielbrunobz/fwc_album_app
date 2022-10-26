import 'package:fifa_world_cup_album/app/pages/home/presenter/home_presenter.dart';
import 'package:fifa_world_cup_album/app/pages/home/view/home_view.dart';
import 'package:fifa_world_cup_album/app/repository/user/user_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePresenterImpl implements HomePresenter {
  final UserRepository userRepository;
  late HomeView _view;

  HomePresenterImpl({
    required this.userRepository,
  });


  @override
  Future<void> getUserData() async {
try {
  _view.showLoader();
  final user = await userRepository.getMe();
  _view.updateUser(user);
} catch (e) {
  _view.error('Erro ao buscar dados do usuário logado');
}
  }

  @override
  Future<void> logout() async {
    _view.showLoader();
    final sp =  await SharedPreferences.getInstance();
    sp.clear();
    _view.logoutSuccess();
  }

  @override
  set view(HomeView view) => _view = view;
  
}