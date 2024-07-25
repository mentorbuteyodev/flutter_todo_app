import 'package:hive/hive.dart';

// generate file for Hive type adapter.
part 'model.g.dart';

// Define a HiveType with a unique typeId
@HiveType(typeId: 0)
class ToDoModel {
  // Define a HiveField
  @HiveField(0)
  final String todo;

  // Define a HiveField
  @HiveField(1)
  final bool isComplete;

  // initialize 'todo' and 'isComplete'
  const ToDoModel(this.todo, this.isComplete);

  /*
   create custom equality and hashing methods to accurately compare 
   and identify objects based on their properties 
   within collections like lists or maps.

   What is this code about?

This code helps us keep track of things we need 
to do (like chores or homework) and whether we've finished them or not.

What are == and hashCode?
----------------------------
== is like asking if two things are exactly the same. 
We want to know if two ToDoModel objects are exactly the same, 
so we check if they have the same todo 
(the thing we need to do) and if they are marked as isComplete (finished) or not.
hashCode is like a special code given to each ToDoModel. 
It's used to quickly find things in a big list. 
Imagine each task having its own secret number.


What happens in == and hashCode?
--------------------------------
== checks if two ToDoModel objects have the same todo 
and if they are marked as complete or not. 
If both are true, then they are considered the same.
hashCode combines the hashCode of todo (the task) 
and isComplete (whether it's finished or not) 
to create a unique code for each ToDoModel.


Why is this important?
-----------------------
It helps us find tasks quickly in a big list. 
Imagine a long list of tasks 
- this code helps us find the exact task we're 
looking for without checking each one by one.
So, basically, this code helps us manage our tasks easily and quickly! 🚀



 ^ is used to combine the hash codes of the todo and isComplete properties of the ToDoModel object. XOR-ing the hash codes helps ensure that if either of these properties changes, the resulting hash code will be different, which is important for avoiding hash collisions in hash-based data structures like HashMaps.

In simple terms, ^ combines the bits of the hash codes of todo and isComplete 
in such a way that if any bit is set (1) in only one of the hash codes, 
it will be set in the result, but if the bit is set in both or neither, 
it will be unset (0) in the result. This helps in spreading out the hash codes more evenly, reducing the likelihood of collisions.
  
   */

  @override
  bool operator ==(Object other) {
    // Check if the other object is identical to this one.
    if (identical(this, other)) return true;

    // Check if the other object is of type ToDoModel
    // and if its todo and isComplete properties match those of this object.
    return other is ToDoModel &&
        other.todo == todo &&
        other.isComplete == isComplete;
  }

// Combine the hash codes of the todo and isComplete properties
  // using bitwise XOR to generate a unique hash code for this object.
  @override
  int get hashCode => todo.hashCode ^ isComplete.hashCode;
}
