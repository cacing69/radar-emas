import 'dart:developer' as dev;

extension SafeParseList on List<dynamic> {
  List<T> parseEach<T>(
    T Function(Map<String, dynamic> json) parser, {
    String label = 'SafeParseList',
  }) {
    final result = <T>[];
    for (var i = 0; i < length; i++) {
      try {
        result.add(parser(this[i] as Map<String, dynamic>));
      } catch (e, stack) {
        dev.log(
          'Skipping item at index $i',
          name: label,
          error: e,
          stackTrace: stack,
        );
      }
    }
    return result;
  }
}
