import 'package:flutter/foundation.dart';

import 'response_type.dart';

/// represents the class that is passed back from the user
class UserResponse {
  UserResponse({
    @required this.surveyCode,
    @required this.questionCode,
    @required this.answerCode,
    @required this.responseType,
  });

  /// specifies the survey
  String surveyCode;

  /// specifies the question
  String questionCode;

  /// specifies the answer
  String answerCode;

  /// union class of the type of responses allowed
  ResponseType responseType;
}