import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:music_notes_player_app_setup/helper/http_hlper.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  //DioHelper dio = DioHelper();
  var prodctsList = [];

  getproducts() async {
    emit(ProductLoadingState());
    try {
      final response = await ApiManger.getData();
      prodctsList = response.data!.dataM!;

      emit(ProductSuccessState());
    } catch (e) {
      emit(ProductFauler());
    }
  }
}
