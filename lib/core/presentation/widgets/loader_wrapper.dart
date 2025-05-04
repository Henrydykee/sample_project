import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoaderWrapper extends StatelessWidget {
  final bool? isLoading;
  final Widget? view;

  const LoaderWrapper({Key? key, this.isLoading, this.view}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        view!,
        if (isLoading ?? false)
          Scaffold(
            backgroundColor: Colors.transparent,
            body: IgnorePointer(
              ignoring: true,
              child: Container(
                color: Colors.white.withAlpha((0.8 * 255).round()),
                child: const Center(
                  child: SizedBox(
                    height: 40,
                    width: 40,
                    child: _PlatformLoadingIndicator(),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _PlatformLoadingIndicator extends StatelessWidget {
  const _PlatformLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return const CupertinoActivityIndicator(
        color: Colors.black,
        radius: 15,
      );
    } else {
      return const CircularProgressIndicator(
        strokeWidth: 3,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      );
    }
  }
}
