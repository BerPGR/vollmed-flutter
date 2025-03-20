import 'package:flutter/material.dart';
import 'package:vollmed/app/core/utils/text_styles.dart';

class HomeChoiceButton extends StatelessWidget {
  final String title;
  final String image;
  final String to;
  const HomeChoiceButton({super.key, required this.title, required this.image, required this.to});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff0B3B60),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 140,
        width: double.infinity,
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(to);
          },
          splashColor: Colors.white10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Image.asset(image),
              Text(
                title,
                style: TextStyles.h3Bold.merge(TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}