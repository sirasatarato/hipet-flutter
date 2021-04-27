import 'package:get/get.dart';
import 'package:hipet/src/util/pair.dart';

class TopicController extends GetxController {
  var _topics = <Rx<Pair<String, bool>>>[];

  List<Pair<String, bool>> get topics => _topics.map((e) => e.value).toList();
  set topics(List<Pair<String, bool>> list) => _topics = list.map((e) => e.obs).toList();

  void changeSelectTopic(int index) {
    _topics[index].value = Pair(_topics[index].value.left, !_topics[index].value.right);
  }

  bool isAnyClicked() => _topics.map((e) => e.value.right).contains(true);
}