import 'package:flutter/material.dart';
import 'package:flutter_application_4/helpers/appcolors.dart';
import 'package:flutter_application_4/helpers/utils.dart';
import 'package:flutter_application_4/models/category.dart';
import 'package:flutter_application_4/pages/mappage.dart';
import 'package:flutter_application_4/widgets/moviecard.dart';

class CategoryListPage extends StatelessWidget {
  List<Category> categories = Utils.getMockedCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.NEXT_COLOR,
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          SizedBox(height: 20),
          const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 0),
              child: Text('    Select a movie:',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontFamily: 'Futura',
                      color: Colors.black,
                      fontSize: 25))),
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
                                    selectedCategory:
                                        Utils.getMockedCategories()[index],
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
