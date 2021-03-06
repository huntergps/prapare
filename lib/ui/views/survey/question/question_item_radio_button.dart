import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prapare/controllers/controllers.dart';
import 'package:prapare/models/fhir_questionnaire/survey/export.dart';
import 'package:prapare/ui/views/survey/answer/answer_items.dart';

class QuestionItemRadioButton extends StatefulWidget {
  const QuestionItemRadioButton({Key key, this.group, this.question})
      : super(key: key);

  final ItemGroup group;
  final Question question;

  @override
  _QuestionItemRadioButtonState createState() =>
      _QuestionItemRadioButtonState();
}

class _QuestionItemRadioButtonState extends State<QuestionItemRadioButton> {
  final UserResponsesController controller = Get.find();
  final RxString activeCode = ''.obs;

  @override
  Widget build(BuildContext context) {
    final List<Answer> answerList = widget.question.answers.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...answerList.map(
          (answer) => AnswerItems(
            group: widget.group,
            question: widget.question,
            answer: answer,
            activeCode: activeCode,
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    final Rx<UserResponse> activeResponse =
        controller.findActiveResponse(widget.question.linkId);
    // returns most recent value, otherwise the default '' remains
    activeCode.value =
        controller.getActiveRadioButtonValue(activeResponse) ?? '';
    super.initState();
  }
}
