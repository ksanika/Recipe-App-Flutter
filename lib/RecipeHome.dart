import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'DetailRecipe.dart';

class RecipeHome extends StatefulWidget {
  @override
  _RecipeHomeState createState() => _RecipeHomeState();
}

class _RecipeHomeState extends State<RecipeHome> {


 

  final String url = "https://www.themealdb.com/api/json/v1/1/search.php?s=all";

List recipedata ;



  @override 
  void initState() {
    super.initState();
    this.getJsonData();
  }

  Future getJsonData() async
  {
    var response = await http.get(
    url
    );

    setState(() {
      var convertojson= json.decode(response.body)['meals'];
  recipedata = convertojson;
    });
    
  }

  _getDetailRecipe(recipetofetch) 
  {
    Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context)
                            {
                              return new DetailRecipe(recipetofetch);
                            })
                          );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipes",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        backgroundColor: Colors.white,
      ),
     body: ListView.builder(
       itemBuilder: (context , index)
       {
         return Card(
           child: Row(
             children: [
               Expanded(
               child : Card(
                 elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                     
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(recipedata[index]['strMealThumb']),
                              // width: 100.0,
                              // height: 100.0,
                              fit: BoxFit.fill,
                              height: 250.0,
                            ),
                          ),
                      ),
                      //Text(recipedata[index]['strMeal']),
                      RaisedButton(
                        child: Text(recipedata[index]['strMeal']),
                        onPressed: (){
                        
                         _getDetailRecipe(recipedata[index]);
                        }
                      ),
                    ],
                  ),
                ),
               ),
               ),
             ],
           ),
         );
       },
        itemCount: recipedata == null ? 0 : recipedata.length,
     ),
    );
  }
}