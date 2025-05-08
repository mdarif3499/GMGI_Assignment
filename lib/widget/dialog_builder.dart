import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class DialogBuilder {
  final BuildContext context;
  late AnimationController _controller;
  late Animation<double> _animation;

  DialogBuilder(this.context);

  void showLoadingIndicator() {
    showPlatformDialog(
      context: context,
      androidBarrierDismissible: false,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: const EdgeInsets.symmetric(horizontal: 130),
        contentPadding: const EdgeInsets.only(top: 10.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0))),
        content: Builder(
          builder: (context) {
            // Get available height and width of the build area of this widget. Make a choice depending on the size.
            var height = MediaQuery.of(context).size.height;
            var width = MediaQuery.of(context).size.width;
            return Container(
              height: 100,
              width: width - 300,
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  // Cupertino activity indicator with custom radius and disabled animation.
                  DialogWidget(),
                  // Image.asset(
                  //   'assets/ic_launcher.png', // Replace with your image asset
                  //   width: 60,
                  //   height: 60,
                  // ),
                  // // CupertinoActivityIndicator(
                  // //     radius: 20.0, color: activeColor),
                  SizedBox(height: 10),
                  Text(
                    'Loading...',
                    style: TextStyle(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void hideOpenDialog() {
    Navigator.pop(context);
  }
}

class DialogWidget extends StatefulWidget {
  const DialogWidget({Key? key}) : super(key: key);

  @override
  State<DialogWidget> createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Create an animation controller
    _controller = AnimationController(
      vsync: this, // vsync is set to this for performance reasons
      duration: const Duration(milliseconds: 1000), // Set the duration of the animation
    );

    // Create a Tween for the rotation angle
    _animation = Tween<double>(
      begin: 0, // Start rotation angle
      end: 2 * 3.141, // End rotation angle (2 * pi for a full circle)
    ).animate(_controller);

    // Repeat the animation indefinitely
    _controller.repeat();
  }

  String? appName, packageName, version, buildNumber;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          // Use Transform.rotate to rotate the Image based on the animation value
          return Transform.rotate(
            angle: _animation.value,
            child: Image.asset(
              'assets/ic_launcher.png', // Replace with your image asset
              width: 50,
              height: 50,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    if (_controller != null) _controller.dispose();
    super.dispose();
  }
}

