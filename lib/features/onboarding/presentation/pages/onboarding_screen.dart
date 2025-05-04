import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/presentation/widgets/button.dart';
import 'package:new_project/core/utils/navigation_service.dart';
import 'package:new_project/features/onboarding/data/models/slide_dots.dart';
import 'package:new_project/features/onboarding/data/models/slide_model.dart';
import 'package:new_project/features/onboarding/presentation/pages/select_account_type.dart';
import 'package:new_project/features/onboarding/presentation/pages/slide_item.dart';

class BoardingScreen extends StatefulWidget {
  @override
  _BoardingScreenState createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // PrefUtils.setInsidePages(false); // Uncomment if you're using PrefUtils
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   elevation: 0.0,
      // ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 550,
                    child: PageView.builder(
                      onPageChanged: _onPageChanged,
                      controller: _pageController,
                      itemCount: slideList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SliderImage(slide: slideList[index]),
                              Gap(30),
                       
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  slideList.length,
                                  (i) => SlideDots(isActive: i == _currentPage),
                                ),
                              ),
                              SliderItem(slide: slideList[index]),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                
                ],
              ),
            ),

               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20),
                 child: _currentPage == 2 ? GButton(title: "Get  Started",
                 onTap: ()=> router.push(SelectAccountTypeScreen()
                 ),
                 ) :    Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Skip button (text only)
                    TextButton(
                      onPressed: () {



                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    
                    // Next button (with dark background)
                    ElevatedButton(
                      onPressed: () {
               
                        if (_currentPage < slideList.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:   Color(0xFF333333),
                        foregroundColor: Colors.white,
                      
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                               ),
               ),
          ],
        ),
      ),
    );
  }
}
