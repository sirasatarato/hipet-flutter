import 'package:flutter/material.dart';

class PickableTopic extends StatelessWidget {
  final String name;
  final bool isSelected;

  const PickableTopic(this.name, this.isSelected, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;

    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(isSelected ? accentColor : Colors.transparent, BlendMode.overlay),
              fit: BoxFit.cover,
              image: NetworkImage('https://www.exposureguide.com/media/top-ten-photography-tips-4.jpg'),
            ),
          ),
        ),
        Text(
          name,
          style: Theme.of(context).textTheme.button!.copyWith(
                color: isSelected ? accentColor : Colors.black,
              ),
        ),
      ],
    );
  }
}
