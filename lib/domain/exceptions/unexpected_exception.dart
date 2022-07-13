class UnexpectedException implements Exception {

  String? message;

  Duration? duration;

  UnexpectedException([this.message, this.duration]);

  String toString() {
    String result = "UnexpectedException";
    if (duration != null) result = "UnexpectedException after $duration";
    if (message != null) result = "$result: $message";
    return result;
  }
}