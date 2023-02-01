import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restauracje_lodz/app/features/home/restaurants/cubit/restaurants_cubit.dart';

class RestaurantsPageContent extends StatelessWidget {
  const RestaurantsPageContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RestaurantsCubit()..start(),
      child: BlocBuilder<RestaurantsCubit, RestaurantsState>(
        builder: (context, state) {
          if (state.errorMessage.isNotEmpty) {
            return Center(
              child: Text('Something went wrong: ${state.errorMessage}'),
            );
          }
          if (state.isLoading == true) {
            return const Center(child: CircularProgressIndicator());
          }

          final documents = state.documents;
          return ListView(
            children: [
              for (final document in documents) ...[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange),
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  document['name'],
                                  style: const TextStyle(fontSize: 17),
                                ),
                                Text(document['dishname']),
                              ],
                            ),
                            Text(
                              document['rating'].toString(),
                              style: const TextStyle(fontSize: 17),
                            )
                          ]),
                    ],
                  ),
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
