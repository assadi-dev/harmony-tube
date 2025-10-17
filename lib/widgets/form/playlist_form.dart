import 'package:flutter/material.dart';
import 'package:harmony_tube/config/app_config.dart';

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
    final playlistInput = PlaylistInput(
      context: context,
      formKey: _formKey,
      titleController: _titleController,
      descriptionController: _descriptionController,);


    return Form(
      key: _formKey,
      child: Column(
        spacing: 12,
        children: [
          playlistInput.titleInput(
            _focusNode,
            _titleController,
          ), playlistInput.descriptionInput(
            FocusNode(),
            _descriptionController,
          ),
          playlistInput.submitButton()
        ],
      ),
    );
  }



}

class PlaylistInput {
  final BuildContext context;
  final GlobalKey<FormState> formKey;
  final TextEditingController titleController;
  final TextEditingController descriptionController;

  PlaylistInput(
      {required this.context, required this.formKey, required this.titleController, required this.descriptionController});


  void _submitValues() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      String title = titleController.text;
      String description = descriptionController.text;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Formulaire valide : $title | $description")),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }
  }

  Widget titleInput(
    FocusNode focusNode,
    TextEditingController titleController,
  ) {

    return TextFieldStyled(
      context,
      focusNode,
      formKey,
      "Titre",
      "Titre de la playlist",
      titleController,
        (value)=> PlaylistInputValidator.titleValidator(value)
    );
  }

  Widget descriptionInput(
    FocusNode focusNode,
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
      null
    );
  }


  Widget submitButton() {
    return SizedBox(
      width: double.infinity,
        child: ElevatedButton(
        key: const Key("playlist_submit_button"),
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(border_button),
          ),
        ),

        child: const Text("Créer"),
        onPressed:_submitValues


    ));
  }



}


class PlaylistInputValidator {

 static String?  titleValidator(String? value){
    if(value == null || value.isEmpty){
      return "Veuillez renseigner ce champ";
    }
    return null;

  }

}