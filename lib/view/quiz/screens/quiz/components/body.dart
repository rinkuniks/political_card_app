import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:political_card_app/res/colour.dart';
import '../../../constants.dart';
import '../../../controllers/question_controller.dart';
import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  const Body({super.key,
  }) ;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return   Container(
      color: Colors.white,
      child: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 150,
              width: size.width,
              decoration:  BoxDecoration(
                  color: primaryGray,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  )
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Padding(
                //   padding:
                //   EdgeInsets.symmetric(horizontal: kDefaultPadding),
                //   child: ProgressBar(),
                // ),
                const SizedBox(height: kDefaultPadding),
                // Align(
                //   alignment: Alignment.center,
                //   child: Container(
                //
                //     height: 200,
                //     width: size.width/1.2,
                //     decoration: BoxDecoration(
                //         color: lightGray,
                //       borderRadius: BorderRadius.circular(20)
                //     ),
                //     padding: EdgeInsets.all(15),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       children: [
                //         Padding(
                //           padding:
                //           const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                //           child: Obx(
                //                 () => Text.rich(
                //               TextSpan(
                //                 text:
                //                 "Question ${_questionController.questionNumber.value}",
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .titleLarge
                //                     ?.copyWith(color: Colors.black),
                //                 children: [
                //                   TextSpan(
                //                     text: "/${_questionController.questions.length}",
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .titleLarge
                //                         ?.copyWith(color: kSecondaryColor),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //         ),
                //         SizedBox(height: 10,),
                //         Text(
                //           _questionController.questions[index].question,
                //           style: Theme.of(context)
                //               .textTheme
                //               .titleLarge
                //               ?.copyWith(color: kBlackColor),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                ///
                // Divider(thickness: 1.5),
                // SizedBox(height: kDefaultPadding),
                Expanded(
                  child: PageView.builder(
                    // Block swipe to next qn
                    physics: NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                        question: _questionController.questions[index]),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
