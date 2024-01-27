
import 'package:book_moive/presentation/view/seat_status.dart';
import 'package:book_moive/presentation/view/widgets/booking_sucessful.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Data/models/models_ticket_booking/seats_model.dart';
import '../../common/constant/appColorConstant.dart';

class ReservationPage extends StatefulWidget {
  final String tile;
  const ReservationPage({super.key, required this.tile});

  @override
  State<ReservationPage> createState() => _ReservationPageState();
}

class _ReservationPageState extends State<ReservationPage> {
  final items = List<DateTime>.generate(15, (index) {
    return DateTime.utc(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    ).add(Duration(days: index));
  });
  DateTime selectedTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: black,
            size: 20,
          ),
        ),
        title: const Text(
          'Select Seats',
          style: TextStyle(fontSize: 14, color: orangeColor),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SizedBox(
              height: 60,
              child: Stack(
                children: [
                  Positioned(
                    top: -5,
                    width: MediaQuery.of(context).size.width - 60,
                    child: ClipPath(
                      clipper: Clip2(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [orange.withOpacity(0.3), transparent],
                                stops: const [0.35, 1.0],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter)),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -10,
                    width: MediaQuery.of(context).size.width - 60,
                    child: ClipPath(
                      clipper: Clip(),
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        color: orangeColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              ...List.generate(numRow.length, (colIndex) {
                int numCol =
                    colIndex == 0 || colIndex == numRow.length - 1 ? 6 : 8;
                return Padding(
                  padding: EdgeInsets.only(
                      bottom: colIndex == numRow.length - 1 ? 0 : 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...List.generate(numCol, (rowIndex) {
                        String seatNum = '${numRow[colIndex]}${rowIndex + 1}';
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedSeats.contains(seatNum)) {
                                selectedSeats.remove(seatNum);
                              } else if (!reservedSeats.contains(seatNum)) {
                                selectedSeats.add(seatNum);
                              }
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(
                                right: rowIndex == (numCol / 2) - 1 ? 30 : 10),
                            decoration: BoxDecoration(
                                color: reservedSeats.contains(seatNum)
                                    ? black
                                    : selectedSeats.contains(seatNum)
                                        ? orangeColor
                                        : grey,
                                borderRadius: BorderRadius.circular(7.5)),
                          ),
                        );
                      })
                    ],
                  ),
                );
              })
            ],
          ),
          const SizedBox(height: 30),
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SeatStatus(
                color: grey,
                status: 'Available',
              ),
              SizedBox(width: 10),
              SeatStatus(
                color: orangeColor,
                status: 'Selected',
              ),
              SizedBox(width: 10),
              SeatStatus(
                color: black,
                status: 'Reserved',
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 35),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [white, orangeColor],
                stops: [0.5, 1],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const Text(
                  'Select Date and Time',
                  style: TextStyle(
                      color: darkBlack, fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 35),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          items.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTime = items[index];
                                  });
                                },
                                child: Container(
                                  margin: index == 0
                                      ? const EdgeInsets.only(
                                          left: 20, right: 20)
                                      : const EdgeInsets.only(right: 20),
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 12, 8, 8),
                                  decoration: BoxDecoration(
                                      color: DateFormat('d/M/y')
                                                  .format(selectedTime) ==
                                              DateFormat('d/M/y')
                                                  .format(items[index])
                                          ? orangeColor
                                          : black,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    children: [
                                      Text(
                                        DateFormat('MMM').format(items[index]),
                                        style: const TextStyle(
                                            fontSize: 14, color: white),
                                      ),
                                      const SizedBox(height: 8),
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: DateFormat('d/M/y')
                                                        .format(selectedTime) ==
                                                    DateFormat('d/M/y')
                                                        .format(items[index])
                                                ? white
                                                : transparent),
                                        child: Text(
                                          DateFormat('dd').format(items[index]),
                                          style:  TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: DateFormat('d/M/y').format(
                                                          selectedTime) ==
                                                      DateFormat('d/M/y')
                                                          .format(items[index])
                                                  ? black
                                                  : white),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                          availableTime.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTime = DateTime.utc(
                                      selectedTime.year,
                                      selectedTime.month,
                                      selectedTime.day,
                                      int.parse(
                                          availableTime[index].split(':')[0]),
                                      int.parse(
                                          availableTime[index].split(':')[1]),
                                    );
                                  });
                                },
                                child: Container(
                                    margin: index == 0
                                        ? const EdgeInsets.only(
                                            left: 20, right: 20)
                                        : const EdgeInsets.only(right: 20),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: black,
                                        border: Border.all(
                                            width: 2,
                                            color: DateFormat('HH:mm')
                                                        .format(selectedTime)
                                                        .toString() ==
                                                    availableTime[index]
                                                ? orangeColor
                                                : transparent),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Text(
                                      availableTime[index],
                                      style: const TextStyle(
                                          fontSize: 14, color: white),
                                    )),
                              )),
                    ],
                  ),
                ),
                selectedSeats.isNotEmpty
                    ? Column(
                        children: [
                          const SizedBox(height: 35),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Price',
                                      style: TextStyle(
                                          color: black, fontSize: 12),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      '\$${(selectedSeats.length * 43.5).toStringAsFixed(2)}',
                                      style: const TextStyle(
                                          color: black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 50),
                                Expanded(
                                  child: MaterialButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> BookingSuccessful( tile: widget.tile,)));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    color: orangeColor,
                                    height: 66,
                                    child: const Center(
                                      child: Text(
                                        'Book Ticket',
                                        style: TextStyle(
                                            color: black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Clip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, -20, size.width, size.height);
    path.lineTo(size.width, size.height - 5);
    path.quadraticBezierTo(size.width / 2, -25, 0, size.height - 5);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class Clip2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height - 30);
    path.quadraticBezierTo(size.width / 2, -20, 0, size.height - 30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
