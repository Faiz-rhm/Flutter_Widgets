
import 'package:flutter/material.dart';

class ListWheelScrollViewWidget extends StatefulWidget {
  const ListWheelScrollViewWidget({Key? key}) : super(key: key);

  @override
  State<ListWheelScrollViewWidget> createState() => _ListWheelScrollViewWidgetState();
}

class _ListWheelScrollViewWidgetState extends State<ListWheelScrollViewWidget> {

  final List<Map<String, dynamic>> _listOfWatches = [
    {
      'name': 'Apple Watch',
      'year': '2020',
      'image': 'assets/images/apple_watch.png',
      'price': '\$199.00',
      'oldPrice': '\$299.00',
      'isFavorite': true,
      'material': 'brown leather case',
      'color': Colors.black,
    },
    {
      'name': 'Dan Henry',
      'year': '2019',
      'image': 'assets/images/dan_henry.png',
      'price': '\$159.00',
      'oldPrice': '\$200.00',
      'isFavorite': false,
      'material': 'Leather fashion',
      'color': Colors.red,
    },
    {
      'name': 'Casima',
      'year': '2015',
      'image': 'assets/images/casimas.png',
      'price': '\$299.00',
      'oldPrice': '\$355.00',
      'isFavorite': true,
      'material': 'brown leather case',
      'color': Colors.orange,
    },
    {
      'name': 'Laurent Ferrier',
      'year': '2013',
      'image': 'assets/images/laurent_ferrier.png',
      'price': '\$555.00',
      'oldPrice': '\$699.00',
      'isFavorite': false,
      'material': 'brown leather case',
      'color': Colors.blue,
    },
    {
      'name': 'Ferrier Classic',
      'year': '2012',
      'image': 'assets/images/laurent-ferrier-classic-micro-rotor-white-gold-ice-blue.png',
      'price': '\$299.00',
      'oldPrice': '\$399.00',
      'isFavorite': true,
      'material': 'brown leather case',
      'color': Colors.brown,
    },
    {
      'name': 'Hamilton',
      'year': '2020',
      'image': 'assets/images/hamilton.png',
      'price': '\$159.00',
      'oldPrice': '\$299.00',
      'isFavorite': false,
      'material': 'brown leather case',
      'color': Colors.purpleAccent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('ListWheelScrollView'),
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.black,),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16,),
            const Text('The Collection',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: MediaQuery.of(context).size.height * 0.6,
                diameterRatio: 3.0,
                onSelectedItemChanged: (int index) {
                  setState(() {
                    print('Selected item: $index');
                  });
                },
                children: _listOfWatches.map((e) => Stack(
                  alignment: Alignment.topCenter,
                  children: [
                     InkWell(
                       child: Padding(
                        padding: const EdgeInsets.only(top: 30.0),
                        child: InkWell(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: e['color'],
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Column(
                                children:  [
                                  const SizedBox(height: 230,),
                                  Text(e['name'] + ' ' + e['year'],
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                  const SizedBox(height: 8,),
                                  Text(e['material'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey.shade700
                                    ),
                                  ),
                                  const SizedBox(height: 24,),
                                  Text(e['price'],
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown.shade500
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                                         ),
                     ),
                    SizedBox(
                      height: 240,
                      child:  Image.asset(e['image']),
                    )
                  ],
                ),
                ).toList(),
              )
            )

          ]
        ),
      ),
    );
  }
}