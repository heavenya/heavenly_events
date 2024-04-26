// ignore_for_file: avoid_print, must_be_immutable

import 'dart:async';

import '../utils/common_imports.dart';

class ShowStoryScreen extends StatefulWidget {
  List data;
  int index;

  ShowStoryScreen(this.data, this.index);

  @override
  State<ShowStoryScreen> createState() => _ShowStoryScreenState();
}

class _ShowStoryScreenState extends State<ShowStoryScreen>
    with TickerProviderStateMixin {
  PageController controller = PageController();
  int _currentPage = 0;
  AnimationController? _animationController;

  Timer? _timer;
  int durationInSeconds = 5;

  @override
  void initState() {
    super.initState();
    _currentPage = widget.index;
    controller = PageController(initialPage: _currentPage);
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: durationInSeconds),
    );
    _animationController!.forward();
    _startTimer();
  }

  @override
  void dispose() {
    controller.dispose();
    _animationController!.dispose();
    _timer!.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: durationInSeconds), (timer) {
      setState(() {
        if (_currentPage == widget.data!.length - 1) {
          Get.back();
        } else {
          _currentPage++;
        }
        controller.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.ease,
        );
        Future.value(const Duration(milliseconds: 500)).then((value) {
          _animationController!.reset();
          _animationController!.forward();
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller,
                itemCount: widget.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: Get.width,
                    height: Get.height,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          width: Get.width,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: AnimatedBuilder(
                            animation: _animationController!,
                            builder: (context, child) {
                              return FractionallySizedBox(
                                alignment: Alignment.centerLeft,
                                widthFactor: _animationController!.value,
                                child: Container(
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 50,
                                width: 50,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                      widget.data[_currentPage]['image']),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.data[_currentPage]['name']}",
                                      style: AppFontStyle.whiteBold14,
                                    ),
                                    const SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      "${widget.data[_currentPage]['min']}",
                                      style: AppFontStyle.whiteSemiBold12,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: Stack(
                          children: [
                            Center(
                              child: Image.asset(
                                  widget.data[_currentPage]['subImage']),
                            ),
                            Container(
                                margin:
                                    EdgeInsets.only(bottom: Get.height * 0.15),
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "${widget.data[_currentPage]['name']}",
                                  textAlign: TextAlign.center,
                                  style: AppFontStyle.whiteSemiBold16,
                                ))
                          ],
                        ))
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
