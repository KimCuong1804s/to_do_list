import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ConfirmDialog extends StatelessWidget {
  String? title;
  String? content;
  String? textTitle1;
  String? textTitle2;
  Function()? function1;
  Function()? function2;

  ConfirmDialog(this.title, this.content, this.textTitle1, this.textTitle2,
      this.function1, this.function2);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      const Expanded(child: SizedBox()),
      Container(
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 16),
          width: 226,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 42,
                child: Row(
                  children: [
                    Expanded(
                        child: Text(title!,
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                color: Colors.black))),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(content!,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                        color: Colors.black)),
              ),
              const SizedBox(height: 14),
              Container(
                alignment: Alignment.center,
                child: Row(children: [
                  SizedBox(
                    height: 32,
                    width: 92,
                    child: TextButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          function1!();
                          Navigator.pop(context);
                        },
                        child: Text(textTitle1!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.normal)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blueAccent),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    side: const BorderSide(
                                        color: Colors.blueAccent))))),
                  ),
                  const Expanded(child: SizedBox()),
                  SizedBox(
                    height: 32,
                    width: 92,
                    child: TextButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          function2!();
                          Navigator.pop(context);
                        },
                        child: Text(textTitle2!,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.normal)),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16.0),
                                    side: const BorderSide(
                                        color: Colors.blue))))),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
      const Expanded(child: SizedBox())
    ]);
  }
}
