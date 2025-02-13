part of flutter_mentions;

enum SuggestionPosition { Top, Bottom }

enum SuggestionState { Ready, Found, NotFound, None }

class LengthMap {
  LengthMap({
    required this.start,
    required this.end,
    required this.str,
  });

  String str;
  int start;
  int end;
}

class Mention {
  Mention({
    required this.trigger,
    this.data = const [],
    this.style,
    this.matchAll = false,
    this.suggestionBuilder,
    this.disableMarkup = false,
    this.markupBuilder,
    this.headerBuilder,
  });

  /// A single character that will be used to trigger the suggestions.
  final String trigger;

  /// List of Map to represent the suggestions shown to the user
  ///
  /// You need to provide two properties `id` & `display` both are [String]
  /// You can also have any custom properties as you like to build custom suggestion
  /// widget.
  List<Map<String, dynamic>> data;

  /// Style for the mention item in Input.
  final TextStyle? style;

  /// Should every non-suggestion with the trigger character be matched
  final bool matchAll;

  /// Should the markup generation be disabled for this Mention Item.
  final bool disableMarkup;

  /// Build Custom suggestion widget using this builder.
  final Widget Function(Map<String, dynamic>)? suggestionBuilder;
  final Widget Function(String)? headerBuilder;

  /// Allows to set custom markup for the mentioned item.
  final String Function(
    String trigger,
    int mention,
    String value,
    String? type,
    String? parentId,
  )? markupBuilder;

  Mention copyWith({List<Map<String, dynamic>>? data}) {
    return Mention(
      trigger: trigger,
      data: data ?? this.data,
      style: style,
      matchAll: matchAll,
      suggestionBuilder: suggestionBuilder,
      disableMarkup: disableMarkup,
      markupBuilder: markupBuilder,
      headerBuilder: headerBuilder,
    );
  }
}

class Annotation {
  Annotation({
    required this.trigger,
    this.style,
    this.id,
    this.display,
    this.disableMarkup = false,
    this.markupBuilder,
    this.type,
    this.parentId,
  });

  TextStyle? style;
  int? id;
  String? display;
  String trigger;
  bool disableMarkup;
  String? type;
  String? parentId;
  final String Function(String trigger, int mention, String value, String? type,
      String? parentId)? markupBuilder;
}
