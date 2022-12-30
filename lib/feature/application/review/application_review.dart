import 'package:flutter/material.dart';

import '../../../component/informationbox/information.dart';
import '../../../res/size_resource.dart';
import '../../../style/text_style.dart';
import '../../home/home_header.dart';

class ApplicationReview extends StatefulWidget {
  const ApplicationReview({Key? key}) : super(key: key);

  @override
  State<ApplicationReview> createState() => _ApplicationReviewState();
}

class _ApplicationReviewState extends State<ApplicationReview> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top:SizeResource.xxlargeDp,left: SizeResource.xxxlargeDp,right: SizeResource.xxxlargeDp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: HomeHeader(
                informationList: [
                  Information(key: "Total applied", value: "10"),
                  Information(key: "Positive Result", value: "2"),
                  Information(key: "Ongoing Process", value: "3"),
                ],
              ),
            ),
            SizedBox(
              height: SizeResource.xxxlargeDp,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeResource.xlargeDp),
              child: Text("Applications",style: LegalAidTextStyle.titleBlack,),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(SizeResource.mediumDp))
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeResource.mediumDp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Active",
                      style: LegalAidTextStyle.titleBlack,
                    ),
                    DataTable(
                      columns: const [
                        DataColumn(
                            label: Text('Lawyer Name',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal))),
                        DataColumn(
                            label: Text('Process',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal))),
                        DataColumn(
                            label: Text('Creating Date',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal))),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('Stephen')),
                          DataCell(
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              value: 0.3,
                            ),
                          ),
                          DataCell(Text('29.12.2022')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Stephen')),
                          DataCell(
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              value: 0.3,
                            ),
                          ),
                          DataCell(Text('29.12.2022')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Stephen')),
                          DataCell(
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              value: 0.3,
                            ),
                          ),
                          DataCell(Text('29.12.2022')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Stephen')),
                          DataCell(
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              value: 0.3,
                            ),
                          ),
                          DataCell(Text('29.12.2022')),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeResource.xxlargeDp,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(SizeResource.mediumDp))
              ),
              child: Padding(
                padding: EdgeInsets.all(SizeResource.mediumDp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Finished",
                      style: LegalAidTextStyle.titleBlack,
                    ),
                    DataTable(
                      columns: const [
                        DataColumn(
                            label: Text('Lawyer Name',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal))),
                        DataColumn(
                            label: Text('Process',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal))),
                        DataColumn(
                            label: Text('Creating Date',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.normal))),
                      ],
                      rows: const [
                        DataRow(cells: [
                          DataCell(Text('Stephen')),
                          DataCell(
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              value: 0.3,
                            ),
                          ),
                          DataCell(Text('29.12.2022')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Stephen')),
                          DataCell(
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              value: 0.3,
                            ),
                          ),
                          DataCell(Text('29.12.2022')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Stephen')),
                          DataCell(
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              value: 0.3,
                            ),
                          ),
                          DataCell(Text('29.12.2022')),
                        ]),
                        DataRow(cells: [
                          DataCell(Text('Stephen')),
                          DataCell(
                            LinearProgressIndicator(
                              backgroundColor: Colors.grey,
                              valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.black),
                              value: 0.3,
                            ),
                          ),
                          DataCell(Text('29.12.2022')),
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeResource.xxxlargeDp,
            ),
          ],
        ),
      ),
    );
  }
}
