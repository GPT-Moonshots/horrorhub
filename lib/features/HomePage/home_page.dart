import 'package:flutter/material.dart';
import 'package:horrorhub/features/HomePage/Widgets/drop_down.dart';
import 'package:horrorhub/features/HomePage/Widgets/sidebar.dart';
import 'package:horrorhub/features/HomePage/Widgets/text_filed.dart';
import 'package:horrorhub/models/poem_model.dart';
import 'package:horrorhub/services/Poems/poems.dart';
import 'package:share/share.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horrorhub/utils/const.dart';

class MyHomePage extends StatefulWidget {
  final String uid;
  const MyHomePage({super.key, required this.uid});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _relationshipController = TextEditingController();
  final TextEditingController _poemTypeController = TextEditingController();
  final TextEditingController _languageController = TextEditingController();
  final FocusNode _poemTypeFocusNode = FocusNode();
  final FocusNode _languageFocusNode = FocusNode();
  String _response = '';
  bool _isLoading = false;
  String _error = '';

  Future<void> _sharePoem() async {
    try {
      await Share.share(
        _response,
        subject: 'Love Verses',
      );
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }

    if (_error.isNotEmpty) {
      // print('Error sharing poem: $_error');
    }
  }

  @override
  void initState() {
    _poemTypeController.text = 'Horror';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 154, 154, 154),
                Color.fromARGB(255, 213, 197, 117)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Horror Hub',
          style: GoogleFonts.caveat(
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Sidebar(
        uid: widget.uid,
      ),
      onDrawerChanged: (isOpened) {
        _poemTypeFocusNode.unfocus();
        _languageFocusNode.unfocus();
      },
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTExtField(
                      textEditingController: _nameController,
                      labelText: 'Name of the person'),
                  const SizedBox(height: 16.0),
                  CustomTExtField(
                      textEditingController: _relationshipController,
                      labelText: 'Relationship'),
                  const SizedBox(height: 16.0),
                  Row(
                    children: [
                      Expanded(
                          child: CustomDropdown(
                        labelText: 'Story Type',
                        options: poemTypes,
                        focusNode: _poemTypeFocusNode,
                        onSelected: (String value) {
                          _poemTypeController.text = value;
                        },
                        textEditingController: _poemTypeController,
                      )),
                      const SizedBox(width: 16.0),
                      Expanded(
                          child: CustomDropdown(
                        labelText: 'Language',
                        focusNode: _languageFocusNode,
                        options: language,
                        onSelected: (String value) {
                          _languageController.text = value;
                        },
                        textEditingController: _languageController,
                      )),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                        _response = '';
                        _error = '';
                      });
                      PoemModel poemModel = PoemModel(
                          name: _nameController.text,
                          relationship: _relationshipController.text,
                          poemType: _poemTypeController.text,
                          poemId: '',
                          poem: '',
                          language: _languageController.text);
                      String? myPoem = await Poem.generatePoem(
                        poemModel,
                        widget.uid,
                      );
                      setState(() {
                        _response = myPoem ?? '';
                        _isLoading = false;
                        _error = "Error generating poem. Please try again.";
                      });
                    },
                    child: const Text('Generate Poem'),
                  ),
                  const SizedBox(height: 16.0),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _response.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.all(1.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'A Special Poem for You:',
                                    style: GoogleFonts.caveat(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    _response,
                                    style: GoogleFonts.caveat(
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _response.isNotEmpty
          ? FloatingActionButton.extended(
              onPressed: _sharePoem,
              label: const Text('Share Poem'),
              icon: const Icon(Icons.share),
            )
          : null,
    );
  }
}
