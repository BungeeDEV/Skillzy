import 'package:flutter/material.dart';

class onboardingPage extends StatelessWidget {
  const onboardingPage({
        super.key,
                required this.image,
                required this.textParts,
                required this.subtitle,
    });

    final String image, subtitle;
    final List<Map<String, dynamic>> textParts;

    @override
    Widget build(BuildContext context) {
        return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                children: [
        Image(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.5,
                image: AssetImage(image)),
        buildRichText(textParts),
          const SizedBox(
                height: 20,
          ),
        Text(
                subtitle,
                style: const TextStyle(fontSize: 17),
        textAlign: TextAlign.center,
          )
        ],
      ),
    );
    }
}

RichText buildRichText(List<Map<String, dynamic>> textParts) {
    return RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
            children: textParts.map((part) {
    return TextSpan(
            text: part['text'],
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28,
            color: part['color'],
          ),
        );
      }).toList(),
    ),
  );
}
