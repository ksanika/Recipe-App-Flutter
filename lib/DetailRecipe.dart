import 'package:flutter/material.dart';

class DetailRecipe extends StatelessWidget {
  DetailRecipe(this.recipeindex);
  final  recipeindex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes",
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
             Row(
          children: [
             Expanded(
            child:  ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(recipeindex['strMealThumb']),
                              // width: 100.0,
                              // height: 100.0,
                              fit: BoxFit.fill,
                              height: 250.0,
                            ),     
                          ),
          ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(10.0),
          child:Text(recipeindex['strMeal'],
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            ),
            ),
        ),
        Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Category",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      recipeindex['strCategory'],
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                  ),
                ],
              ),
       SizedBox(height: 50),
                 Row(
                children: [
                  Expanded(
                    child: Text(
                      "Video",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      recipeindex['strYoutube'],
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                  ),
                ],
              ),

                SizedBox(height: 50),
                 Row(
                children: [
                  Expanded(
                    child: Text(
                      "Tags",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      recipeindex['strTags'] == null ? "No tags found " :  recipeindex['strTags'],
                      style: TextStyle(
                        fontSize: 18.0
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}