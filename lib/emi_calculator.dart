import 'dart:math';

import 'package:flutter/material.dart';

class EmiCalculator extends StatefulWidget {
  const EmiCalculator({super.key});

  @override
  State<EmiCalculator> createState() => _EmiCalculatorState();
}

class _EmiCalculatorState extends State<EmiCalculator> {

  double amount = 15000;
  double interest = 11;
  double time = 12;
  double total = 0;
  double? monThaLyInterest;
  double? toTaLine;
  double? emi;

  void amountCal() {
    monThaLyInterest = interest / 12 / 100;
    emi = amount *
        monThaLyInterest! *
        (pow((1 + monThaLyInterest!), time) /
            (pow((1 + monThaLyInterest!), time) - 1));
    toTaLine = emi! * time - amount;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    amountCal();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 70),
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    color: Colors.black54,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50, bottom: 50),
                  child: Center(
                      child: Text(
                        'EMI Calculator',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      )),
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 5),
                      blurRadius: 20,
                    )
                  ],
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Slider(
                          activeColor: Colors.blueGrey,
                          inactiveColor: Colors.white,
                          value: amount,
                          max: 100000,
                          min: 15000,
                          onChanged: (value) {
                            setState(() {
                              amount = value;
                            });
                            amountCal();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('loan amount',
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                '₹ ${double.parse(
                                  amount.toStringAsFixed(2),
                                )}',
                                style: const TextStyle(color: Colors.blueGrey),
                              )
                            ],
                          ),
                        ),
                        Slider(
                          activeColor: Colors.blueGrey,
                          inactiveColor: Colors.white,
                          value: interest,
                          max: 20,
                          min: 11,
                          onChanged: (value) {
                            setState(() {
                              interest = value;
                            });
                            amountCal();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('rate of interest',
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                '${double.parse(
                                  interest.toStringAsFixed(2),
                                )} %',
                                style: const TextStyle(color: Colors.blueGrey),
                              ),
                            ],
                          ),
                        ),
                        Slider(
                          activeColor: Colors.blueGrey,
                          inactiveColor: Colors.white,
                          value: time,
                          max: 24,
                          min: 12,
                          onChanged: (value) {
                            setState(() {
                              time = value;
                            });
                            amountCal();
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('loan amount',
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                ' ${time.toInt()} month',
                                style: const TextStyle(color: Colors.blueGrey),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 30,
                                left: 10,
                                right: 50,
                                bottom: 30,
                              ),
                              height: 200,
                              width: 200,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(100),
                                ),
                                color: Colors.white,
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(40),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100),
                                  ),
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              'EMI\n₹ ${emi!.round()}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  color: Colors.blueGrey,
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'principal amount ',
                                  style: TextStyle(
                                    color: Color(0xff828589),
                                  ),
                                ),
                              ),
                              Text(
                                '₹ ${amount.toInt()}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                  right: 10,
                                ),
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                              const Expanded(
                                child: Text(
                                  'Total interest ',
                                  style: TextStyle(color: Color(0xff828589)),
                                ),
                              ),
                              Text(
                                '₹ ${toTaLine!.toInt()}',
                                style: const TextStyle(color: Color(0xffffffff)),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            children: [
                              const Expanded(
                                child: Text(
                                  'Total ',
                                  style: TextStyle(color: Color(0xff828589)),
                                ),
                              ),
                              Text(
                                '₹ ${amount.toInt() + toTaLine!.toInt()}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),),
    );
  }
}
