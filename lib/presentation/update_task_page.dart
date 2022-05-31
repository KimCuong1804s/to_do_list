import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/business/task_validator.dart';
import 'package:to_do_list/presentation/widgets/confirm_dialog.dart';

import 'widgets/error_dialog.dart';

class UpdateTaskPage extends StatefulWidget {
  UpdateTaskPage({Key? key, this.passedContent}) : super(key: key);

  String? passedContent;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _UpdateTaskState();
  }
}

class _UpdateTaskState extends State<UpdateTaskPage> {
  final controller = TextEditingController();
  var didChangeTextValue = false;

  @override
  initState() {
    super.initState();
    controller.text = widget.passedContent ?? "";
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            HapticFeedback.lightImpact();
            if (didChangeTextValue) {
              showDialog(context: context, builder: (context) {
                return ConfirmDialog('Your task has not been save', 'Do you want to continue?', 'Yes', 'No', () {
                  Navigator.pop(context);
                }, () {
                  print("dissmiss alert");
                });
              });
            } else {
              Navigator.pop(context);
            }
          },
        ),
        title:
            Text(widget.passedContent == null ? "Add New Task" : "Update Task"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  child: TextField(
                      minLines: 5,
                      maxLines: null,
                      controller: controller,
                      onChanged: (value) {
                        didChangeTextValue = true;
                      },
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "Write something")),
                ),
                const Divider(height: 1, color: Color(0xffd2d2d2)),
                Container(
                  height: 80,
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      var content = controller.text;
                      var validatorResult =
                          TaskValidator.validateContent(content);
                      if (validatorResult != null) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorDialog('Failed', 'Your content can not be empty.');
                            });
                      } else {
                        Navigator.pop(context, content);
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blue)),
                    child: Text(widget.passedContent == null ? "Add" : "Update",
                        style: const TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
