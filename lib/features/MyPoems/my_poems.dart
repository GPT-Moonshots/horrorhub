import 'package:flutter/material.dart';
import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:horrorhub/models/poem_model.dart';
import 'package:horrorhub/services/Database/database.dart';
import 'package:share/share.dart';

class MyPoems extends StatefulWidget {
  final String uid;
  const MyPoems({super.key, required this.uid});

  @override
  State<MyPoems> createState() => _MyPoemsState();
}

class _MyPoemsState extends State<MyPoems> {
  List<PoemModel> _poems = [];

  @override
  void initState() {
    super.initState();
    getPoems();
  }

  Future<List<PoemModel>> getPoems() async {
    List<PoemModel> poems = await DatabaseService(uid: widget.uid).getPoems();
    setState(() {
      _poems = poems;
    });
    return _poems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
            'My Poems',
            style: GoogleFonts.caveat(
              fontSize: 38.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: (_poems.isEmpty)
            ? const Center(
                child: Text('No poems yet'),
              )
            : Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView.builder(
                  itemCount: _poems.length,
                  itemBuilder: (context, index) {
                    return ExpandedTile(
                      leading: Text('${index + 1}.'),
                      title: Column(
                        children: [
                          Text(_poems[index].name),
                          Text(_poems[index].relationship),
                        ],
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Flexible(
                            flex: 8,
                            child: Text(
                              _poems[index].poem,
                              softWrap: true,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              children: [
                                IconButton(
                                  onPressed: () async {
                                    await Share.share(
                                      _poems[index].poem,
                                      subject: 'Love Verses',
                                    );
                                  },
                                  icon: const Icon(Icons.share),
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text('Confirm Deletion'),
                                          content: const Text(
                                              'Are you sure you want to delete this poem?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await DatabaseService(
                                                        uid: widget.uid)
                                                    .deletePoem(
                                                        _poems[index].poemId);
                                                setState(() {
                                                  _poems.removeAt(index);
                                                });
                                              },
                                              child: const Text('Yes'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                // Close the dialog
                                                Navigator.pop(context);
                                              },
                                              child: const Text('No'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      controller: ExpandedTileController(),
                    );
                  },
                ),
              ));
  }
}
