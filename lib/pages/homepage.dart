import 'package:demo1/models/movies_info.dart';
import 'package:demo1/services/api_manager.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<Welcome> _movieModel;


  @override
  void initState() {
    _movieModel = API_Manager().getMovies();
    super.initState();  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home",style: TextStyle(color: Colors.black,fontSize:20,fontWeight:FontWeight.bold),),
        backgroundColor: Colors.white,
        
      ),

      
      body: Container(

        

        child: FutureBuilder<Welcome>(
          
          future:_movieModel,
          // ignore: missing_return
        
          builder:(context, snapshot) {
            if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.search.length,
                    itemBuilder: (context,index) {
                      var  search=snapshot.data.search[index];
                  return Container( 
              height: 100,
              margin: EdgeInsets.all(8),
              
              child: Row(
                
                children: <Widget>[
                  
                  Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child:AspectRatio(aspectRatio: 1,
                    child: Image.network(search.poster,fit: BoxFit.cover,),)
                  ),
                 
                      //Image.network(search.poster),
                      SizedBox(width:16),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(search.title,style: TextStyle(fontSize:15,fontWeight:FontWeight.bold),),
                            Text(search.imdbId),
                            Text(search.year),            ],
                        ),
                      )
                ],
              ),
            );
          });
            }
            else
                return Center(child: CircularProgressIndicator()); 
            
                    },
           ),
        ),
      );
      
    
  }
}