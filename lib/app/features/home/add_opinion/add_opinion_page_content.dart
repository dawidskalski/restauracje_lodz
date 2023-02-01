import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AddOpinionPageContent extends StatefulWidget {
  const AddOpinionPageContent({
    required this.onSave,
    Key? key,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final onSave;

  @override
  State<AddOpinionPageContent> createState() => _AddOpinionPageContentState();
}

class _AddOpinionPageContentState extends State<AddOpinionPageContent> {
  var restaurantName = '';
  var dishName = '';
  var rating = 1.0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Nazwa restauracji'),
              onChanged: (newValue) {
                setState(() {
                  restaurantName = newValue;
                });
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Nazwa dania'),
              onChanged: (newValue) {
                setState(
                  () {
                    dishName = newValue;
                  },
                );
              },
            ),
            const SizedBox(height: 10),
            RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 6,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (newValue) {
                setState(() {
                  rating = newValue;
                });
              },
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.orange),
              child: Text(
                "Ocena $rating",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: restaurantName.isEmpty || dishName.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('restaurants').add({
                        'name': restaurantName,
                        'dishname': dishName,
                        'rating': rating,
                      });
                      widget.onSave();
                    },
              child: const Text('Dodaj'),
            ),
          ],
        ),
      ),
    );
  }
}
