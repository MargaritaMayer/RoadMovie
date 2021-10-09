import 'package:flutter/material.dart';
import 'package:flutter_application_4/helpers/utils.dart';
import 'package:flutter_application_4/models/category.dart';
import 'package:flutter_application_4/pages/mappage.dart';
import 'package:flutter_application_4/pages/selectedmoviepage.dart';
import 'package:flutter_application_4/helpers/iconhelper.dart';
import 'package:flutter_application_4/widgets/moviecard.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(),
      body: Container(
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Text('Select a movie',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25))),
          Expanded(
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext ctx, int index) {
                return MovieCard(
                    category: categories[index],
                    onCardClick: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MapPage(
                                  // selectedCategory:
                                  // Utils.getMockedCategories()[index],
                                  )));
                    });
              },
            ),
          )
        ]),
      ),
    );
  }
}
