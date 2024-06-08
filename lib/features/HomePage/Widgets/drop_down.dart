import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> options;
  final Function(String) onSelected;
  final String labelText;
  final FocusNode focusNode;
  final TextEditingController textEditingController;
  const CustomDropdown(
      {super.key,
      required this.options,
      required this.onSelected,
      required this.focusNode,
      required this.labelText,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropDownSearchField(
        textFieldConfiguration: TextFieldConfiguration(
          focusNode: focusNode,
          controller: textEditingController,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          decoration: InputDecoration(
            labelText: labelText,
            border: const OutlineInputBorder(),
          ),
        ),
        suggestionsCallback: (String pattern) {
          List<String> matchedOptions = options
              .where((emotion) =>
                  emotion.toLowerCase().contains(pattern.toLowerCase()))
              .toList();

          if (matchedOptions.isEmpty) {
            return [pattern];
          } else {
            return matchedOptions;
          }
        },
        itemBuilder: (context, data) {
          return ListTile(
            title: Text(data),
          );
        },
        onSuggestionSelected: onSelected,
        displayAllSuggestionWhenTap: false,
      ),
    );
  }
}
