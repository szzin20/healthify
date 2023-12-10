import 'package:flutter/material.dart';

class ListArticleWidget extends StatelessWidget {
  const ListArticleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 18.0,
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Rekomendasi Dokter',
              ),
              Text(
                'Lihat Semua',
              ),
            ],
          ),
          ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: const Image(
                          image: AssetImage('assets/images/doctor.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height:
                            80, 
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Color(0xFF005E61),
                                Colors.transparent,
  
                              ],
                            ),
                            borderRadius: BorderRadius.circular(8.0)),
                      ),
                    ),
                    Positioned(
                      child: Text('Pentingnya Menjaga Kesehatan Kulit'),
                      bottom: 20,
                      left: 20,
                      right: 126,
                    ),
                    Positioned(
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined),
                          SizedBox(
                            width: 2,
                          ),
                          Text('245k'),
                        ],
                      ),
                      bottom: 10,
                      right: 20,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
