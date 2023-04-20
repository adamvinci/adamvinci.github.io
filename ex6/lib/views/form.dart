
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../views_model/click_view_model.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final titleController = TextEditingController();
  final thumbnailController = TextEditingController();

  final key = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    thumbnailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New article"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () =>Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Form(
          key: key,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Photo title"),
                validator: (value) => (value == null || value == "")
                    ? "Title can't be empty"
                    : null,
              ),
              Expanded(
                child: TextFormField(
                  maxLines: null,
                  controller: thumbnailController,
                  decoration:
                  const InputDecoration(labelText: "Photo url"),
                  validator: (value) => (value == null || value == "")
                      ? "Content can't be empty"
                      : null,
                ),
              ),
              ElevatedButton(
                child: const Text("Create Photo"),
                onPressed: () {
                  if (key.currentState!.validate()) {
                    final viewModel = Provider.of<ClickViewModel>(
                      context,
                      listen: false,
                    );
                    viewModel.add( thumbnailController.text,titleController.text);
                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
