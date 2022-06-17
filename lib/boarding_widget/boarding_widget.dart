import 'package:flutter/material.dart';
import 'package:uicomponent/button/rounded_button.dart';
import 'package:uicomponent/configs/colors.dart';
import 'package:uicomponent/divide/divide.dart';
import 'package:uicomponent/text/my_text.dart';

class ModalBoarding extends StatefulWidget {
  ModalBoarding({Key? key, required this.onBoardingData, required this.onStart})
      : super(key: key);
  List<Map<String, dynamic>> onBoardingData;
  Function() onStart;
  @override
  _ModalBoardingState createState() => _ModalBoardingState();
}

class _ModalBoardingState extends State<ModalBoarding> {
  int currentPage = 0;
  String textSpan = "";

  late List<Widget> pageList;

  PageController controller = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  void initState() {
    pageList = List.generate(widget.onBoardingData.length, (index) {
      return buildBody(widget.onBoardingData[index]);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLast = widget.onBoardingData.length - 1 == currentPage;
    textSpan = widget.onBoardingData[currentPage]['title'];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildHeader(),
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                controller: controller,
                itemCount: widget.onBoardingData.length,
                itemBuilder: (context, index) {
                  return buildBody(widget.onBoardingData[index]);
                },
              ),
            ),
            SizedBox(
              height: 80,
              width: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.onBoardingData.length,
                  (index) => Container(
                    margin: EdgeInsets.only(
                        right:
                            index == widget.onBoardingData.length - 1 ? 0 : 8),
                    child: buildDot(index),
                  ),
                ),
              ),
            ),
            Divide(height: 18),
            SizedBox(
                child: RoundedButton(
              width: 120,
              child: MyText(
                'Start',
                color: ColorTheme.lightTextColor,
                weight: FontWeight.w500,
              ),
              press: widget.onStart,
            )),
            Divide(height: 32)
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Text.rich(TextSpan(children: [
      const WidgetSpan(
          child: Text(
        'you',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Colors.black,
          fontFamily: 'Inter',
        ),
      )),
      WidgetSpan(
        child: Text(
          textSpan,
          style: const TextStyle(
            color: ColorTheme.primary,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            fontFamily: 'Inter',
          ),
        ),
      ),
    ]));
  }

  Widget buildBody(Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Divide(height: 14),
          Expanded(
            child: Image.asset(
              data['path'],
              height: double.infinity,
              // fit: BoxFit.fitHeight,
            ),
          ),
          Divide(height: 16),
          MyText(
            data['desc'],
            fontSize: 24,
            align: TextAlign.center,
            weight: FontWeight.w700,
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot(int index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 8,
      width: 8,
      decoration: BoxDecoration(
        color: currentPage == index ? ColorTheme.primary : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
