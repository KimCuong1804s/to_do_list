import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  String? title;
  String? content;

  ErrorDialog(this.title, this.content);

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
            ],
          ),
        ),
      ),
      const Expanded(child: SizedBox())
    ]);
  }
}
