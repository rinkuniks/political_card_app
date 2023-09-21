import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:political_card_app/view/quiz/screens/quiz/components/progress_bar.dart';
import '../../../../../res/colour.dart';
import '../../../constants.dart';
import '../../../controllers/question_controller.dart';
import '../../../models/Questions.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    // it means we have to pass this
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    QuestionController _controller = Get.put(QuestionController());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // const Padding(
              //   padding:
              //   EdgeInsets.symmetric(horizontal: kDefaultPadding),
              //   child: ProgressBar(),
              // ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.center,
                child: Container(

                  // height: 200,
                  width: size.width/1.2,
                  decoration: BoxDecoration(
                      color: lightGray,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 37),
                                child: Text('07  ',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.blue,
                                          letterSpacing: 0.5),
                                      fontSize: 10),),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 37,right: 10),
                                child: Container(
                                  height: 5,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.only(bottom: 37,right: 10),
                                child: Container(
                                  height: 5,
                                  width: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 37),
                                child: Text('05',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.w800,
                                          color: Colors.black,
                                          letterSpacing: 0.5),
                                      fontSize: 10),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                         EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        child: Text.rich(

                          TextSpan(
                            text:
                            "Question ${question.id}",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.w800,
                                    color: Colors.black,
                                    letterSpacing: 0.5),
                                fontSize: 16),
                            children: [
                              TextSpan(
                                text: "/${question.options.length}",
                                style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        letterSpacing: 0.5),
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        question.question,
                        style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: 0.5),
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ),
              // Text(
              //   question.question,
              //   style: Theme.of(context)
              //       .textTheme
              //       .headline6
              //       ?.copyWith(color: kBlackColor),
              // ),
              SizedBox(height: kDefaultPadding / 2),
              ...List.generate(
                question.options.length,
                (index) => Option(
                  index: index,
                  text: question.options[index],
                  press: () => _controller.checkAns(question, index),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          height: 45,
          left: 150,
          child: const Padding(
            padding:
            EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ProgressBar(),
          ),
        ),
      ],
    );
  }
}
