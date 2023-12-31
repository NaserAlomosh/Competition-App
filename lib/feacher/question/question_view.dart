import 'dart:async';

import 'package:final_project/core/theme/colors/app_colors.dart';
import 'package:final_project/core/theme/styles/app_text_style.dart';
import 'package:final_project/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/core/navigation/app_navigation.dart';
import 'package:final_project/feacher/question/view_model/cubit.dart';
import 'package:final_project/feacher/question/view_model/state.dart';
import '../../core/widgets/back.dart';
import '../result/result.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuestionsCubit(),
      child: const QuestionsWidget(),
    );
  }
}

class QuestionsWidget extends StatefulWidget {
  const QuestionsWidget({Key? key}) : super(key: key);

  @override
  QuestionsWidgetState createState() => QuestionsWidgetState();
}

class QuestionsWidgetState extends State<QuestionsWidget> {
  List<int?> selectedValues = [];
  List<int?> pointsValues = [];
  int totalPoints = 0;
  final PageController _pageController = PageController(initialPage: 0);
  double opacity = 1.0;
  bool allSelected = false;

  @override
  void initState() {
    super.initState();
    context.read<QuestionsCubit>().getQuestions();
  }

  void calculateTotalPoints(int point, int index) {
    while (pointsValues.length <= index) {
      pointsValues.add(0); // Initialize with 0 if the index doesn't exist
    }

    pointsValues[index] = point;
  }

  void calculate() {
    for (var element in pointsValues) {
      if (element != null) {
        totalPoints = totalPoints + element;
      }
    }
  }

  void nextPage() {
    setState(() {
      opacity = 0.0;
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

      setState(() {
        opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => await myOnWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryBlue,
          title: const Text('Questions'),
        ),
        body: BlocConsumer<QuestionsCubit, QuestionsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is QuestionsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is QuestionsSuccess) {
              return Column(
                children: [
                  Expanded(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: opacity,
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount:
                            context.read<QuestionsCubit>().questions.length,
                        itemBuilder: (context, index) {
                          allSelected = selectedValueCheak();

                          print(selectedValues.length);
                          var question =
                              context.read<QuestionsCubit>().questions[index];

                          // Ensure the list has enough items for each question
                          while (selectedValues.length <= index) {
                            selectedValues.add(null);
                          }

                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.0),
                              border: Border.all(
                                color: AppColors.primaryBlue,
                              ),
                            ),
                            height: 200,
                            child: Card(
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      question.question!,
                                      style: AppTextStyles.font22BlackBold,
                                    ),
                                  ),
                                  RadioListTile(
                                    title: Text(
                                      question.answer1!.answer!,
                                      style: AppTextStyles.font20BlacRegular,
                                    ),
                                    value: 1,
                                    groupValue: selectedValues[index],
                                    onChanged: (v) {
                                      setState(() {
                                        calculateTotalPoints(
                                            question.answer1!.point!, index);
                                        selectedValues[index] = v;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text(
                                      question.answer2!.answer!,
                                      style: AppTextStyles.font20BlacRegular,
                                    ),
                                    value: 2,
                                    groupValue: selectedValues[index],
                                    onChanged: (v) {
                                      setState(() {
                                        calculateTotalPoints(
                                            question.answer2!.point!, index);
                                        selectedValues[index] = v;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text(
                                      question.answer3!.answer!,
                                      style: AppTextStyles.font20BlacRegular,
                                    ),
                                    value: 3,
                                    groupValue: selectedValues[index],
                                    onChanged: (v) {
                                      setState(() {
                                        calculateTotalPoints(
                                            question.answer3!.point!, index);
                                        selectedValues[index] = v;
                                      });
                                    },
                                  ),
                                  RadioListTile(
                                    title: Text(
                                      question.answer4!.answer!,
                                      style: AppTextStyles.font20BlacRegular,
                                    ),
                                    value: 4,
                                    groupValue: selectedValues[index],
                                    onChanged: (v) {
                                      setState(() {
                                        calculateTotalPoints(
                                            question.answer4!.point!, index);
                                        selectedValues[index] = v;
                                      });
                                    },
                                  ),
                                  const Expanded(child: SizedBox()),
                                  if (context
                                              .read<QuestionsCubit>()
                                              .questions
                                              .length -
                                          1 ==
                                      index)
                                    if (allSelected)
                                      AppTextButton(
                                          buttonText: 'Submit',
                                          textStyle:
                                              AppTextStyles.font16WhiteSemiBold,
                                          onPressed: () {
                                            calculate();
                                            AppNavigation().pushReplacement(
                                                context,
                                                Result(points: totalPoints));
                                          })
                                    else
                                      AppTextButton(
                                          backgroundColor: AppColors.gray,
                                          buttonText: 'Submit',
                                          textStyle:
                                              AppTextStyles.font16WhiteSemiBold,
                                          onPressed: () {
                                            calculate();
                                            showDialog(
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                icon: const Icon(
                                                  Icons.error,
                                                  color: Colors.red,
                                                  size: 32,
                                                ),
                                                content: Text(
                                                  'All questions are required to be answered',
                                                  style: AppTextStyles
                                                      .font14DarkBlueMedium,
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'Got it',
                                                      style: AppTextStyles
                                                          .font13DarkBlueMedium,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          })
                                  else
                                    const SizedBox(),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          if (_pageController.page! > 0) {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (_pageController.page! <
                              context.read<QuestionsCubit>().questions.length -
                                  1) {
                            nextPage();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Failed to load questions'));
            }
          },
        ),
      ),
    );
  }

  bool selectedValueCheak() {
    for (var element in selectedValues) {
      if (element == null) {
        return false;
      }
    }
    return true;
  }
}
