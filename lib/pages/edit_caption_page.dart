import 'package:flutter/material.dart';

class EditCaptionPage extends StatefulWidget {
  final Function(String) editCaption;
  final String captionText;
  const EditCaptionPage({
    super.key,
    required this.editCaption,
    required this.captionText,
  });

  @override
  State<EditCaptionPage> createState() => _EditCaptionPageState();
}

class _EditCaptionPageState extends State<EditCaptionPage> {
  final captionController = TextEditingController();

  @override
  void initState() {
    captionController.text = widget.captionText;
    super.initState();
  }

  @override
  void dispose() {
    captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(8),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close, size: 40, weight: 10),
        ),
        centerTitle: true,
        title: Text(
          "Add Caption",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          FilledButton(
            onPressed: () {
              widget.editCaption(captionController.text);
              Navigator.pop(context);
            },
            child: Text(
              "Save",
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: captionController,
          decoration: InputDecoration.collapsed(hintText: ''),
          maxLines: null,
          style: Theme.of(context).textTheme.bodyLarge,
          keyboardType: TextInputType.multiline,
          scrollPadding: EdgeInsets.all(20.0),
          autofocus: true,
        ),
      ),
    );
  }
}
