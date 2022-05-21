enum AssertionType { invalidNumberOfCircles }

extension AssertionTypeMessage on AssertionType {
  static final Map<AssertionType, String> messages = {
    AssertionType.invalidNumberOfCircles: 'There should be at least one circle',
  };

  String get message => messages[this]!;
}
