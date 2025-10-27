import 'package:flutter/material.dart';
import 'package:harmony_tube/core/utils/youtube_helper.dart';

class YoutubeIdOrUrlForm extends StatefulWidget {
  const YoutubeIdOrUrlForm({super.key});

  @override
  State<YoutubeIdOrUrlForm> createState() => _YoutubeIdOrUrlFormState();
}

class _YoutubeIdOrUrlFormState extends State<YoutubeIdOrUrlForm> {
  final double fontSize = 12;
  final TextEditingController _textInputController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String submitLabel = "Confirmer";

  @override
  void dispose() {
    _textInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color secondaryColor = Theme.of(context).colorScheme.primaryContainer;
    final Color primaryColor = Theme.of(context).colorScheme.primary;

    void handleInputChanged(String value) {
      print(value);
      _textInputController.text = value;
    }

    YoutubeFormHandler formHandler = YoutubeFormHandler(
      formKey: _formKey,
      textController: _textInputController,
      context: context,
    );

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a Youtube ID or URL';
              }
              return null;
            },
            style: TextStyle(color: primaryColor, fontSize: fontSize),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.link_outlined, color: secondaryColor),
              fillColor: Theme.of(context).colorScheme.primary.withAlpha(25),
              filled: true,
              hintText: 'Enter a Youtube ID or URL',
              hintStyle: TextStyle(color: primaryColor.withValues(alpha: 0.5)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: primaryColor.withAlpha(100),
                  width: 1,
                ),
              ),
            ),

            controller: _textInputController,
            onChanged: handleInputChanged,
            onFieldSubmitted: (value) => formHandler.handleFormSubmit(),
          ),
          SizedBox(height: 5),
          formHandler.SubmitButton(submitLabel),
        ],
      ),
    );
  }
}

class YoutubeFormHandler {
  final GlobalKey<FormState> formKey;
  final TextEditingController textController;
  final BuildContext context;

  YoutubeFormHandler({
    required this.formKey,
    required this.textController,
    required this.context,
  });

  void handleFormSubmit() {
    try {
      if (formKey.currentState!.validate()) {
        final youtubeId = safeExtractYoutubeId(textController.text);

        formKey.currentState!.save();
        print("Form is valid : ${youtubeId}");
      } else {
        print("Form is not valid ");
      }
    } catch (e) {
      print(e);
    }
  }

  Widget SubmitButton(String submitLabel) {
    return ClipRRect(
      child: Ink(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          onTap: () {
            handleFormSubmit();
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              submitLabel,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
