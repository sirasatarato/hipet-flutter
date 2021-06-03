import 'package:get/get.dart';
import 'package:hipet/src/mixin/api_core.dart';
import 'package:hipet/src/model/post_model.dart';

class PostController extends GetxController with ApiCore {
  final _posts = <Post>[].obs;

  List<Post> get posts => _posts;

  // PostController() {
  //   dio.get('api/post').then((response) => print(response.data));
  //   update();
  // }
}
