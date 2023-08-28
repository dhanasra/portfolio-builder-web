import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ClickableRichText extends StatelessWidget {
  final List spans;
  final double fontSize;
  
  const ClickableRichText({
    super.key,
    required this.spans,
    this.fontSize = 14
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: spans
            .map(
              (e) => TextSpan(
                text: e['text'],
                recognizer: e['onClick']!=null ? (TapGestureRecognizer()..onTap = e['onClick']) : null,
                style: e['onClick'] != null
                    ? Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: fontSize,
                      height: 1.4,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                    )
                    : Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: fontSize,
                      height: 1.4,
                    )
              ),
            )
            .toList(),
      ),
    );
  }
}
