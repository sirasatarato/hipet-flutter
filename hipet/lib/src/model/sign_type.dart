import 'package:hipet/src/pages/sign/phone_page.dart';
import 'package:hipet/src/pages/sign/pick_topic_page.dart';

enum SignType {
  PHONE,
  GOOGLE,
  FACEBOOK,
}

extension SignTypeExtension on SignType {
  getNextPage() {
    switch(this) {
      case SignType.PHONE:
        return PhonePage();
      case SignType.GOOGLE:
      case SignType.FACEBOOK:
        return PickTopicPage();
    }
  }
}