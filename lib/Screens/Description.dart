import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  List Images = [
    'assets/images/meeting_img5.jpg',
    'assets/images/meeting_img6.jpg',
    'assets/images/meeting_img7.jpg'
  ];
  int currentSlide = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  iconSize: 30,
                  color: Color.fromARGB(255, 77, 75, 75),
                  icon: Icon(
                    Icons.chevron_left,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Description',
                  style: TextStyle(
                    color: Color.fromARGB(255, 77, 75, 75),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: 280,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 219, 216, 216),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: const Color.fromARGB(255, 8, 5, 5), width: 1),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 230,
                    child: Stack(
                      children: [
                        CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            enableInfiniteScroll: false,
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentSlide = index;
                              });
                            },
                          ),
                          items: [
                            Image.asset(
                              'assets/images/meeting_img5.jpg',
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/meeting_img5.jpg',
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/meeting_img5.jpg',
                              height: 240,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 28,
                          left: 0,
                          right: 0,
                          child: DotsIndicator(
                            dotsCount: 3,
                            position: currentSlide.toDouble(),
                            decorator: DotsDecorator(
                              color: Colors.grey,
                              activeColor: Colors.blue,
                              size: const Size.square(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.download_rounded),
                      Icon(Icons.bookmark_border),
                      Icon(Icons.heart_broken_sharp),
                      Icon(Icons.qr_code_scanner),
                      Icon(Icons.star_border),
                      IconButton(
                          onPressed: () {
                            final RenderBox box =
                                context.findRenderObject() as RenderBox;
                            final String text = 'Your share message here';
                            Share.share(text,
                                subject: 'Subject of the share',
                                sharePositionOrigin:
                                    box.localToGlobal(Offset.zero) & box.size);
                          },
                          icon: Icon(Icons.share))
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 20, right: 100),
              width: double.infinity,
              height: 40,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    color: Color.fromRGBO(4, 57, 100, 1),
                  ),
                  Text(
                    '1034',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Icon(
                    Icons.heart_broken,
                    color: Color.fromRGBO(4, 57, 100, 1),
                  ),
                  Text(
                    '1034',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Container(
                    height: 23,
                    width: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Color.fromARGB(255, 223, 219, 219)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.blue,
                        ),
                        Icon(Icons.star, size: 15, color: Colors.blue),
                        Icon(Icons.star, size: 15, color: Colors.blue),
                        Icon(Icons.star,
                            size: 15,
                            color: const Color.fromARGB(255, 161, 204, 240)),
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '3.2',
                    style: TextStyle(
                      color: Color.fromRGBO(4, 57, 100, 1),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Actor Name',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 77, 75, 75),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Indian Actress',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 15,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Duration 20 mins',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        color: Colors.grey,
                        Icons.account_balance_wallet,
                        size: 15,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        'Total Average Fees 9,999',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'About',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 77, 75, 75),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Text(
                        'From  cardiovascular health to fitness, flexibility, balance,',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'stress,relief,better sleep,increased cognitive performance,',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'and  more,you  can  reap all  of  these benefits  in  just  one',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'session  out  on  the  waves.  So, you  may  find  yourself',
                        style: TextStyle(
                            fontSize: 14.5,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        'Wondering what are the benefits of going on a surf camp.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
