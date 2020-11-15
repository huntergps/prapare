import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/commands/abstract_command.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';

class ToggleCheckboxCommand extends AbstractCommand {
  Future<void> execute(
      {@required Rx<UserResponse> rxUserResponse, bool newValue}) async {
    // create new UserResponse class with different value property
    final UserResponse newResponse = rxUserResponse.value;
    newResponse.responseType.value =
        newValue ?? !newResponse.responseType.value;

    // update the stream with the new class
    responsesController.updateUserResponse(rxUserResponse, newResponse);

    // ensure ActiveResponse value matches the new boolean
    responsesController
        .setCheckboxActiveBooleanByAnswers(newResponse.questionCode);

    // check validator to see if survey is complete
    surveyController.validateIfSurveyIsCompleted(newResponse.surveyCode);
  }
}