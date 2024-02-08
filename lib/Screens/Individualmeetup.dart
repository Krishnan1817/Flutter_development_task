import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sawaratask/Screens/Description.dart';

class Meetup extends StatefulWidget {
  const Meetup({Key? key}) : super(key: key);

  @override
  State<Meetup> createState() => _MeetupState();
}

class _MeetupState extends State<Meetup> {
  List<String> MeetingImages = [
    'assets/images/meeting_img1.jpg',
    'assets/images/meeting_img2.jpg',
    'assets/images/meeting_img3.jpg',
  ];

  List TrendingMeet = [
    'assets/images/meeting_img4.jpg',
    'assets/images/meeting_img5.jpg',
    'assets/images/meeting_img6.jpg',
    'assets/images/meeting_img7.jpg',
    'assets/images/meeting_img1.jpg',
  ];

  int _currentSlide = 0;
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var mediaquery = MediaQuery.of(context).size;
    var viewheight = mediaquery.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Icon(Icons.chevron_left,
                size: 30, color: Color.fromARGB(255, 77, 75, 75)),
            SizedBox(width: 10),
            Text(
              'Individual Meetup',
              style: TextStyle(
                color: Color.fromARGB(255, 77, 75, 75),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Container(
          width: double.infinity,
          height: viewheight * 10,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.mic),
                      hintText: 'Search...',
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 11, 131, 229),
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    // color: Colors.amber,
                    height: 245,
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: MeetingImages.length,
                          itemBuilder: (context, index, realIndex) {
                            return Image.asset(
                              MeetingImages[index],
                              fit: BoxFit.cover,
                            );
                          },
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.8,
                            initialPage: 0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentSlide = index;
                              });
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: MeetingImages.map((url) {
                              int index = MeetingImages.indexOf(url);
                              return Container(
                                width: 8,
                                height: 8,
                                margin: EdgeInsets.symmetric(horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _currentSlide == index
                                      ? Color.fromARGB(255, 77, 75, 75)
                                      : Colors.grey,
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 180),
                        child: Text(
                          "Trending Popular People",
                          style: TextStyle(
                              color: Color.fromARGB(255, 77, 75, 75),
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 77, 75, 75),
                                  width: 1,
                                ),
                              ),
                              child: Container(
                                width: 260,
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Container(
                                          height: 33,
                                          width: 33,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Color.fromARGB(
                                                    255, 77, 75, 75),
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(50))),
                                          child: Image(
                                              fit: BoxFit.fill,
                                              image: AssetImage(
                                                  'assets/images/meeting_img1.jpg')),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 32),
                                              child: Text(
                                                'Author',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '1,028 Meetups',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color:
                                          const Color.fromARGB(255, 77, 74, 74),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Color.fromARGB(
                                                      255, 77, 75, 75),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50))),
                                            child: Image(
                                                fit: BoxFit.fill,
                                                image: AssetImage(
                                                    'assets/images/meeting_img4.jpg')),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 30),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 77, 75, 75),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
                                              child: Image(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/images/images2/sample1.png')),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 60),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 77, 75, 75),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
                                              child: Image(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/images/images2/sample2.png')),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 90),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 77, 75, 75),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
                                              child: Image(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/images/images2/sample3.png')),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 120),
                                            child: Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Color.fromARGB(
                                                        255, 77, 75, 75),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(50))),
                                              child: Image(
                                                  fit: BoxFit.fill,
                                                  image: AssetImage(
                                                      'assets/images/images2/sample4.png')),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color.fromARGB(
                                                255, 12, 76, 129),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors
                                                  .transparent, 
                                              elevation:
                                                  0, 
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(
                                                    5), 
                                              ),
                                            ),
                                            child: Text(
                                              'See more',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Top Trending Meetups',
                            style: TextStyle(
                                color: Color.fromARGB(255, 77, 75, 75),
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: TrendingMeet.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Description()),
                                  );
                                },
                                child: Card(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: SizedBox(
                                    width: 150,
                                    child: Image.asset(
                                      TrendingMeet[
                                          index], 
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
