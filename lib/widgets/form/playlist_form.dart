import 'package:flutter/material.dart';

import 'input_text_form.dart';

class PlaylistForm extends StatefulWidget {
  const PlaylistForm({super.key});

  @override
  State<PlaylistForm> createState() => _PlaylistFormState();
}

class _PlaylistFormState extends State<PlaylistForm> {
  final _formKey = GlobalKey<FormState>();
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // On force le focus quand le widget est prêt
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 12,
        children: [
          PlaylistInput().titleInput(
            context,
            _focusNode,
            _formKey,
            _titleController,
          ),   PlaylistInput().descriptionInput(
            context,
            FocusNode(),
            _formKey,
            _descriptionController,
          ),
        ],
      ),
    );
  }



}

class PlaylistInput {
  Widget titleInput(
    BuildContext context,
    FocusNode focusNode,
    GlobalKey<FormState> formKey,
    TextEditingController titleController,
  ) {

    return TextFieldStyled(
      context,
      focusNode,
      formKey,
      "Titre",
      "Titre de la playlist",
      titleController,
    );
  }

  Widget descriptionInput(
    BuildContext context,
    FocusNode focusNode,
    GlobalKey<FormState> formKey,
    TextEditingController descriptionController,
  ) {
    return MultiTextFieldStyled(
      context,
      focusNode,
      formKey,
      "Description",
      "Description de la playlist",
      descriptionController,
       1,
       5,
    );
  }
}
