import 'package:flutter/material.dart';

class WidestButton extends StatelessWidget {
  final String text;
  final String? imageAsset;
  final bool isColored;

  const WidestButton(this.text, {this.imageAsset, this.isColored = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        color: isColored ? Theme.of(context).accentColor : Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          imageAsset != null
              ? Image.asset(
            imageAsset!,
            fit: BoxFit.cover,
            width: 16,
            height: 16,
          ) : SizedBox(width: 16),
          Expanded(
            child: Center(
              child: Text(
                  text,
                  style: Theme.of(context).textTheme.button!.copyWith(
                    color: isColored ? Colors.white : Colors.black,
                  ),
              ),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}
