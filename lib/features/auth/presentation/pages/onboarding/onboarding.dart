import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:incomeexpensestracker/config/route/path.dart';
import 'package:incomeexpensestracker/features/auth/presentation/provider/auth_provider.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/button_widget.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/custom_snack_bar.dart';
import 'package:incomeexpensestracker/features/auth/presentation/widget/text_widget.dart';

class Onboarding extends ConsumerWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final state = ref.watch(authNotifierProvider);
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
                buttonName: 'Continue with Google',
                textStyle: TextStyle(
                  color: theme.textTheme.displayMedium!.color!,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                onPressed: state.isLoading
                    ? null
                    : () async {
                        final user = await ref
                            .read(authNotifierProvider.notifier)
                            .signInWithGoogle();

                        // if (user != null) {
                        //   await FirebaseFirestore.instance
                        //       .collection('users')
                        //       .doc(user.uid)
                        //       .set(
                        //         {
                        //           'username': user.displayName,
                        //           'email': user.email,
                        //           'photoURL': user.photoURL,
                        //           'uid': user.uid,
                        //           'createdAt':
                        //               FieldValue.serverTimestamp(),
                        //         },
                        //         SetOptions(merge: true),
                        //       ); // merge keeps existing fields
                        // }

                        if (user != null) {
                          var box = Hive.box('userBox');
                          box.put('name', user.displayName);
                          box.put('email', user.email);
                          box.put('uid', user.uid);
                          box.put('photoUrl', user.photoURL);

                          context.go(Path.homepage);
                          CustomSnackBar.show(
                            context,
                            "Google Sign-In successful",
                          );
                        } else {
                          CustomSnackBar.show(context, "Google Sign-In failed");
                        }
                      },

                // },
                child: state.isLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : null,
              ),
              // Padding(
              //   padding: EdgeInsetsGeometry.symmetric(
              //     vertical: 12,
              //     horizontal: 105,
              //   ),
              //   child: Row(
              //     children: [
              //       TextWidget(
              //         text: 'Already Have Account?',
              //         style: TextStyle(
              //           color: theme.textTheme.displaySmall!.color!,
              //           fontSize: 13,
              //         ),
              //       ),
              //       TextWidget(
              //         text: ' Log In',
              //         style: TextStyle(
              //           color: theme.textTheme.bodyLarge!.color!,
              //           fontSize: 13,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
