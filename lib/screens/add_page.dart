// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:todo_rest/services/todo_service.dart';

import 'package:todo_rest/utils/snack_bar.dart';
import 'package:todo_rest/widgets/custom_text_field.dart';

class AddTodoPage extends StatefulWidget {
  final Map? todo;

  const AddTodoPage({
    Key? key,
    this.todo,
  }) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  Map get body {
    final title = titleController.text;
    final description = descriptionController.text;

    return {
      "title": title,
      "description": description,
      "is_completed": false,
    };
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> editData() async {
    final todo = widget.todo;
    if (todo == null) {
      return;
    }

    final id = todo['_id'];
    final isSuccess = await TodoService.updateTodo(id, body);

    if (isSuccess) {
      showSnackBar(context, message: "Edited data successfully", isSuccess: true);
    } else {
      showSnackBar(context, message: "Failed to edit", isSuccess: false);
    }
  }

  Future<void> submitData() async {
    final isSuccess = await TodoService.addTodo(body);

    if (isSuccess) {
      showSnackBar(context, message: "Added to list", isSuccess: true);
      titleController.text = "";
      descriptionController.text = "";
    } else {
      showSnackBar(context, message: "Failed to add to list", isSuccess: false);
    }
  }

  bool isEdit = false;

  @override
  void initState() {
    super.initState();

    final todo = widget.todo;
    if (widget.todo != null) {
      isEdit = true;

      final title = todo?['title'];
      final description = todo?['description'];

      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Edit TODO" : 'Add TODO')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          CustomTextField(
            controller: titleController,
            hintText: "Title",
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: descriptionController,
            hintText: "Description",
            minLines: 3,
            maxLines: 10,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: isEdit ? editData : submitData,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.tealAccent),
            child: Text(
              isEdit ? "Edit Item" : "Add Item",
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
