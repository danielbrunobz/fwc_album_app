import 'package:fifa_world_cup_album/app/models/group_stickers.dart';

abstract class StickersRepository {
  Future<List<GroupStickers>> getMyAlbum();
}
