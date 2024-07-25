import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_plan_2/model/model.dart';
import 'package:todays_plan_2/services/hive_service_provider.dart';
import 'package:todays_plan_2/settings/text.dart';
import 'package:todays_plan_2/theme/theme.dart';

class ProgressDisplay extends StatefulWidget {
  final int lengthOfTodoList;
  const ProgressDisplay({
    super.key,
    required this.lengthOfTodoList,
  });

  @override
  State<ProgressDisplay> createState() => _ProgressDisplayState();
}

class _ProgressDisplayState extends State<ProgressDisplay> {
  // get the number of completed todo
  int numberOfCompletedTodo() {
    var provider = Provider.of<HiveServiceProvider>(context, listen: false);
    List<ToDoModel> toDoList = provider.toDoList;
    // create todo counter
    int toDoCount = 0;

    // for loop to count the completed todo
    for (int i = 0; i < toDoList.length; i++) {
      // condition to separate the complete and incomplete todo
      if (toDoList[i].isComplete) {
        toDoCount++;
      }
    }

    return toDoCount;
  }

  //  progress message
  String progressMsg() {
    String msg = '';
    setState(() {
      widget.lengthOfTodoList == 0
          ? msg = 'ups! no plan'
          : numberOfCompletedTodo() == widget.lengthOfTodoList
              ? msg = 'good job!👌'
              : msg = 'keep it up👏';
    });

    return msg;
  }

  // progress text
  String progress() {
    String progress = '';
    setState(() {
      widget.lengthOfTodoList == 0
          ? progress = '😒'
          : progress =
              '${numberOfCompletedTodo()} / ${widget.lengthOfTodoList}';
    });

    return progress;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kBackgroundColor,
        border: Border.all(
          color: kSecondaryColors,
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // text display
          SizedBox(
            width: 125,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // text 1
                Text(
                  'Todo Done',
                  style: toDoTextStyle(
                    fontWeight: FontWeight.w800,
                    color: kPrimaryColor,
                  ),
                ),

                // text 2
                Text(
                  progressMsg(),
                  style: toDoTextStyle(
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),

          // progress display
          Container(
            height: 115,
            width: 115,
            decoration: BoxDecoration(
              color: kAccentColorOne,
              borderRadius: BorderRadius.circular(115),
            ),
            child: Center(
              child: Text(
                progress(),
                style: toDoTextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.w900,
                  color: kBackgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
