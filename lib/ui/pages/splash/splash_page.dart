import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'splash_presenter.dart';

class SplashPage extends StatelessWidget {
  final SplashPresenter presenter;
  const SplashPage({required this.presenter});

  @override
  Widget build(BuildContext context) {
    presenter.splashPresent();
    return Scaffold(
      body: Builder(
        builder: (context) {
          presenter.navigateToStream.listen((page) {
            if (page?.isNotEmpty == true) {
              Get.offAllNamed(page!);
            }
          });

          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset('lib/ui/assets/nu.png').image,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
