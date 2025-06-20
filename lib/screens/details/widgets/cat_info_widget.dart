import 'package:catbreeds/models/cat_entity.dart';
import 'package:catbreeds/screens/details/widgets/rating_widget.dart';
import 'package:flutter/material.dart';

class CatInfoWidget extends StatelessWidget {
  final CatEntity cat;

  const CatInfoWidget({super.key, required this.cat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Column(
        children: [
          Text(cat.temperament),
          SizedBox(height: 25),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text.rich(
                    TextSpan(
                      text: cat.description,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      children: [
                        TextSpan(
                          text: " Their usual",
                          children: [
                            TextSpan(
                              text: ' weight is ${cat.weight.metric} Kilograms',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        TextSpan(
                          text: " and their",
                          children: [
                            TextSpan(
                              text: ' life span is ${cat.lifeSpan} years.',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),
                  RatingWidget(text: "Affection", rating: cat.affectionLevel),
                  RatingWidget(text: "Intelligence", rating: cat.intelligence),
                  RatingWidget(text: "Energy", rating: cat.energyLevel),
                  RatingWidget(text: "Adaptability", rating: cat.adaptability),
                  RatingWidget(
                    text: "Child Friendly",
                    rating: cat.childFriendly,
                  ),
                  RatingWidget(text: "Grooming", rating: cat.grooming),
                  RatingWidget(text: "Shedding", rating: cat.sheddingLevel),
                  RatingWidget(text: "Social Needs ", rating: cat.socialNeeds),
                  RatingWidget(
                    text: "Stranger Friendly",
                    rating: cat.strangerFriendly,
                  ),
                  RatingWidget(text: "Dog Friendly", rating: cat.dogFriendly),
                  RatingWidget(
                    text: "Hypoallergenic",
                    rating: cat.hypoallergenic,
                  ),
                  RatingWidget(text: "Health Issues", rating: cat.healthIssues),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
