import 'package:flutter/material.dart';
import 'package:hipet/src/model/topic_model.dart';

class PickableTopic extends StatelessWidget {
  final Topic _topic;

  const PickableTopic(this._topic);

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;
    final filterColor = _topic.isSelected ? accentColor : Colors.transparent;
    final textColor = _topic.isSelected ? accentColor : Colors.black;

    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(_topic.imageAsset),
              colorFilter: ColorFilter.mode(filterColor, BlendMode.overlay),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(
          _topic.name,
          style: Theme.of(context).textTheme.button!.copyWith(color: textColor),
        ),
      ],
    );
  }
}
