import 'package:get/get.dart';
import 'package:hipet/src/model/topic_model.dart';

class TopicController extends GetxController {
  var _topics = <Rx<Topic>>[
    Topic('assets/images/animal/dog.png', '강아지', false).obs,
    Topic('assets/images/animal/cat.png', '고양이', false).obs,
    Topic('assets/images/animal/hamster.png', '햄스터', false).obs,
    Topic('assets/images/animal/parrat.png', '패럿', false).obs,
    Topic('assets/images/animal/snake.png', '뱀', false).obs,
    Topic('assets/images/animal/bird.png', '새', false).obs,
    Topic('assets/images/animal/fish.png', '물고기', false).obs,
    Topic('assets/images/animal/turtle.png', '거북이', false).obs,
  ];

  List<Topic> get topics => _topics.map((e) => e.value).toList();

  set topics(List<Topic> list) => _topics = list.map((e) => e.obs).toList();

  void changeSelectTopic(int index) {
    var data = _topics[index].value;
    _topics[index].value = Topic(data.imageAsset, data.name, !data.isSelected);
  }

  bool isAnyClicked() => _topics.map((e) => e.value.isSelected).contains(true);

  String binaryTopics() => _topics.map((e) => e.value.isSelected ? '1' : '0').join();
}