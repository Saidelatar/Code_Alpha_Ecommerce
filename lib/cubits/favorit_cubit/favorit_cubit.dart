import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:music_notes_player_app_setup/const.dart';

part 'favorit_state.dart';

class FavoritCubit extends Cubit<FavoritState> {
  FavoritCubit() : super(FavoritInitial());

  var box = Hive.box(favoritBoxs);



}
