import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Represents a clickable text mark.
class Mark {
  /// The keyword or phrase to be recognized inside @{}
  final String mark;

  /// The action to be triggered on click.
  final void Function() onClick;

  Mark(this.mark, this.onClick);
}

/// A custom text widget that makes parts of the text clickable using @{...} syntax.
class MarkupText extends StatelessWidget {
  /// Full text with markable sections like: "Click @{here} for more."
  final String text;

  /// List of marks and their associated actions.
  final List<Mark> marks;

  /// Style for the non-clickable text.
  final TextStyle? textStyle;

  /// Style for clickable marked text.
  final TextStyle? marksStyle;

  /// Text alignment inside the RichText widget.
  final TextAlign textAlign;

  /// Max number of lines to display.
  final int? maxLines;

  /// Text overflow behavior (e.g. ellipsis).
  final TextOverflow? overflow;

  /// Defines the reading direction for the text (e.g., left-to-right or right-to-left).
  /// Useful for supporting internationalization and right-to-left languages.
  final TextDirection? textDirection;

  const MarkupText({
    super.key,
    required this.text,
    this.marks = const [],
    this.textStyle,
    this.marksStyle,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    final spans = <InlineSpan>[];
    final regex = RegExp(r'@\{(.*?)\}');
    int currentIndex = 0;

    final matches = regex.allMatches(text);
    for (final match in matches) {
      final beforeText = text.substring(currentIndex, match.start);
      final markedText = match.group(1);

      if (beforeText.isNotEmpty) {
        spans.add(TextSpan(
          text: beforeText,
          style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
        ));
      }

      final mark = marks.firstWhere(
        (m) => m.mark == markedText,
        orElse: () => Mark(markedText ?? '', () {}),
      );

      spans.add(TextSpan(
        text: markedText,
        style: marksStyle ??
            TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
        recognizer: TapGestureRecognizer()..onTap = mark.onClick,
      ));

      currentIndex = match.end;
    }

    if (currentIndex < text.length) {
      spans.add(TextSpan(
        text: text.substring(currentIndex),
        style: textStyle ?? Theme.of(context).textTheme.bodyMedium,
      ));
    }

    return RichText(
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.clip,
      textDirection: textDirection,
      text: TextSpan(children: spans),
    );
  }
}
