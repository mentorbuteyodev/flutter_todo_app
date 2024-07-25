// Important imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todays_plan_2/extensions/extensions.dart';
import 'package:todays_plan_2/services/hive_service_provider.dart';
import 'package:todays_plan_2/services/todo_service_provider.dart';
import 'package:todays_plan_2/settings/dimensions.dart';
import 'package:todays_plan_2/settings/text.dart';
import 'package:todays_plan_2/theme/theme.dart';
import 'package:todays_plan_2/util/progress_display.dart';
import 'package:todays_plan_2/util/text_input_field.dart';
import 'package:todays_plan_2/util/todo_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // get the instance of HiveServiceProvider
    var provider = Provider.of<HiveServiceProvider>(context, listen: false);

    // fetch the to-do items from the Hive database
    provider.getToDo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // get the width of the screen
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double screenWidth = deviceWidth < 600 ? deviceWidth : 600;

    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        surfaceTintColor: kBackgroundColor,
        elevation: 0,
        title: Center(
          child: Text(
            'T O D A Y \'S  P L A N',
            style: toDoTextStyle(),
          ),
        ),
      ),
      body: Consumer<HiveServiceProvider>(
        builder: (context, backEnd, widget) => Center(
          child: Container(
            width: screenWidth,
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
              right: 20,
            ),
            child: Column(
              children: [
                // progress display
                ProgressDisplay(
                  lengthOfTodoList: backEnd.toDoList.length,
                ),

                // 40 pixel
                kFortyH,

                // text input - submit/add button
                TextInputField(
                  addToDo: () => ToDoServiceProvider.addNewToDo(
                    backEnd,
                    context,
                  ),
                  toDoController: ToDoServiceProvider.controllerAddToDo,
                ),

                // 40 pixel
                kFortyH,

                // List of todo
                Expanded(
                  child: backEnd.toDoList.isEmpty
                      ? Center(
                          child: Text(
                            'No Todo\'s, Add Some!',
                            textAlign: TextAlign.center,
                            style: toDoTextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                              color: kSecondaryColors.withOpacity(0.1),
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: backEnd.toDoList.length,
                          itemBuilder: (context, index) => TodoTile(
                            todo: backEnd.toDoList[index].todo
                                .capitalizeSentence(),
                            isComplete: backEnd.toDoList[index].isComplete,
                            deleteToDo: () => backEnd.deleteToDo(index),
                            showToDoDialog: () =>
                                ToDoServiceProvider.showToDoDialog(
                              todo: backEnd.toDoList[index].todo,
                              context: context,
                              setState: setState,
                              index: index,
                              backEnd: backEnd,
                            ),
                            handleCheckbox: (value) =>
                                backEnd.handleCheckBox(index),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
