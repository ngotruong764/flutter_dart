import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;
  const QuestionSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 3), // Adjust padding as needed
                    decoration: BoxDecoration(
                      color: data['user_answer'] == data['correct_answer']
                          ? Color.fromARGB(255, 96, 195, 100)
                          : Color.fromARGB(255, 237, 66, 103),
                      borderRadius: BorderRadius.circular(
                          100), // Adjust border radius as needed
                    ),
                    child: Text(
                      ((data['question_index'] as int) + 1).toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        backgroundColor:
                            data['user_answer'] == data['correct_answer']
                                ? Color.fromARGB(255, 96, 195, 100)
                                : Color.fromARGB(255, 237, 66, 103),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          data['user_answer'] as String,
                          style: TextStyle(
                            color: Color.fromARGB(140, 117, 116, 116),
                            fontSize: 17,
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: TextStyle(
                            color: Color.fromARGB(255, 96, 195, 100),
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
