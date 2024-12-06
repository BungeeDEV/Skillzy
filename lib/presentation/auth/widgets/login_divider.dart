import 'package:flutter/material.dart';

class loginDivider extends StatelessWidget {
  const loginDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Oder fortfahren mit',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 24.0),
      ],
    );
  }
}