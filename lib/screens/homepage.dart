import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Popular',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )),
                Text('view all',
                    style: TextStyle(
                      fontSize: 15,
                    ))
              ],
            ),
          ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(20)),
            elevation: 20,
            child: Container(
              height: MediaQuery.of(context).size.height/4,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20))

              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20),) , color: Colors.blue,
                        ),
                        height: MediaQuery.of(context).size.height/4,
                        width: MediaQuery.of(context).size.height/6,

                      ),
                      Center(child: Image.asset('assets/car.png',width: 200,height: 100,)),
                    ],
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Innova 2013',style: TextStyle(
                        fontSize: 18,
                    fontWeight: FontWeight.bold,

                      ),),

                      Text('2021',style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey

                      ),),

                      Text('Automatic 7 seater',style: TextStyle(
                        fontSize: 18,
                          color: Colors.grey

                      ),),

          RatingBar.builder(
            itemSize: 20,
            initialRating: 2,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,

            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {

            },
          ),

                      Text('₹1200/day',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,



                      ),),
                    ],
                  )

                ],
              ),
            ),
          ),),
        ],
      ),
    ));
  }
}
