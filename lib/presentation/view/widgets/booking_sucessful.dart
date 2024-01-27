import 'package:barcode_widget/barcode_widget.dart';
import 'package:book_moive/presentation/view/widgets/upcoming_moive_appBar.dart';
import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

import '../../../common/constant/appColorConstant.dart';

class BookingSuccessful extends StatefulWidget {
  final String tile;
  const BookingSuccessful({super.key, required this.tile});

  @override
  State<BookingSuccessful> createState() => _BookingSuccessfulState();
}

class _BookingSuccessfulState extends State<BookingSuccessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 35),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [white, orangeColor],
            stops: [0.5, 1],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const UpComingMoiveScreenAppBar(
                title: "Ticket Booking",
              ),
              const SizedBox(height: 20),
              TicketWidget(
                color: Colors.white12,
                width: 350,
                height: 650,
                isCornerRounded: true,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.tile,
                              style: const TextStyle(
                                fontSize: 32,
                              ),
                            ),
                            const SizedBox(height: 28),
                            const Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Release Date',
                                      style: TextStyle(color: black),
                                    ),
                                    Text('06/12/2024'),
                                    SizedBox(height: 28),
                                    Text(
                                      'Time',
                                      style: TextStyle(color: black),
                                    ),
                                    Text('05:30'),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Seat Number',
                                      style: TextStyle(color: black),
                                    ),
                                    Text('51,53'),
                                    SizedBox(height: 28),
                                    Text(
                                      'Mall Name',
                                      style: TextStyle(color: black),
                                    ),
                                    Text('PVR'),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        const Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Location',
                                      style: TextStyle(color: black),
                                    ),
                                    Text(
                                      'Faridabad, Haryana',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Gate',
                                      style: TextStyle(color: black),
                                    ),
                                    Text(
                                      '2H',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Seat',
                                      style: TextStyle(color: black),
                                    ),
                                    Text(
                                      '11B',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Spacer(flex: 2),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Divider(),
                        const SizedBox(height: 10),
                        BarcodeWidget(
                          barcode: Barcode.aztec(), // Barcode type and settings
                          data:
                              'https://pub.dev/packages/barcode_widget', // Content
                          width: 100,
                          height: 100,
                        ),
                        const Text(
                          'ticket ID: 18128239487912',
                          style: TextStyle(
                            color: black,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
