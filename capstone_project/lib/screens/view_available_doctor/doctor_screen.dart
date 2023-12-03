import 'package:capstone_project/constants/color_theme.dart';
import 'package:capstone_project/constants/text_theme.dart';
import 'package:capstone_project/models/list_doctor_model.dart';
import 'package:capstone_project/widgets/doctor_card_widget.dart';
import 'package:capstone_project/widgets/menu_doctor_widget.dart';
import 'package:capstone_project/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Dokter',
                style: ThemeTextStyle().titleMedium.copyWith(
                      fontSize: 20,
                      color: const Color(0xffFBFBFB),
                    ),
              ),
              centerTitle: true,
              background: Container(
                color: ThemeColor().primaryFrame,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: ThemeColor().primaryFrame,
              child: const SearchBarWidget(
                title: 'Cari dokter populer, kulit & kelamin, nutrisi',
              ),
            ),
          ),
          const SliverAppBar(
            backgroundColor: Colors.white,
            toolbarHeight: 40,
            floating: false,
            pinned: true,
            expandedHeight: 0,
            flexibleSpace: MenuDoctor(),
            bottom: PreferredSize(preferredSize: Size.zero, child: Text('')),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 210),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  final doctor = doctors[index];
                  return DoctorCardWidget(
                    doctorName: doctor.doctorName,
                    specialty: doctor.specialty,
                    imageUrl: doctor.imageUrl,
                    rating: doctor.rating,
                    numberOfReviews: doctor.numberOfReviews,
                    price: doctor.price,
                    isOnline: doctor.isOnline,
                    onTap: () {},
                  );
                },
                childCount: doctors.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
