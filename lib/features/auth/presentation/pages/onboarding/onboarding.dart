import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          Stack(
            children: [
              SvgPicture.asset('assets/images/bg.svg'),
              Positioned(
                top: 120.5,
                left: 55,
                child: Image.asset('assets/images/coint.png'),
              ),
              Positioned(
                top: 110.5,
                left: 55,
                child: Image.asset('assets/images/man.png'),
              ),
              Positioned(
                top: 168.5,
                left: 260.6,
                child: Image.asset('assets/images/donut.png'),
              ),
            ],
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(children: [

              ],),
              TextWidget(
                text: 'Spend Smarter',
                style: TextStyle(
                  color: theme.textTheme.bodyLarge!.color!,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextWidget(
                text: 'Save More',
                style: TextStyle(
                  height: 0,

                  color: theme.textTheme.bodyLarge!.color!,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              CustomButtonWidget(
                buttonName: 'Get Started',
                textStyle: TextStyle(
                  color: theme.textTheme.displayMedium!.color!,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                onPressed: () {
                  context.go(Path.homepage);
                },
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  vertical: 12,
                  horizontal: 105,
                ),
                child: Row(
                  children: [
                    TextWidget(
                      text: 'Already Have Account?',
                      style: TextStyle(
                        color: theme.textTheme.displaySmall!.color!,
                        fontSize: 13,
                      ),
                    ),
                    TextWidget(
                      text: ' Log In',
                      style: TextStyle(
                        color: theme.textTheme.bodyLarge!.color!,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
