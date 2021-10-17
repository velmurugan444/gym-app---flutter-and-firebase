import 'package:flutter/material.dart';
import 'package:gym_app/models/resultsdata.dart';
import 'package:firebase_database/firebase_database.dart';

import '../student/workoutimage_screen.dart';

class FetchResultScreen extends StatefulWidget {
  @override
  _FetchResultScreenState createState() => _FetchResultScreenState();
}

class _FetchResultScreenState extends State<FetchResultScreen> {
  List<ResultData> resultData = [];
  TextEditingController _rollnocontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Result"),
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _rollnocontroller,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Enter rollno';
                }
                return null;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    DatabaseReference referenceData =
                        FirebaseDatabase.instance.reference().child("posts");
                    referenceData
                        .orderByChild("studentrollno")
                        .equalTo(_rollnocontroller.text)
                        .once()
                        .then((DataSnapshot dataSnapshot) {
                      resultData.clear();
                      var keys = dataSnapshot.value.keys;
                      var values = dataSnapshot.value;

                      for (var key in keys) {
                        ResultData data = new ResultData(
                          values[key]["image"],
                          values[key]["date"],
                          values[key]["studentrollno"],
                          values[key]["description"],
                          values[key]["height"],
                          values[key]["weight"],
                        );
                        if (!mounted) {
                          return;
                        } else {
                          setState(() {
                            resultData.add(data);
                          });
                        }
                      }
                    });
                  },
                ),
                hintText: 'Enter rollno ',
                hintStyle: TextStyle(
                  letterSpacing: 2,
                  color: Colors.black54,
                ),
                fillColor: Colors.white30,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: resultData.length,
              itemBuilder: (_, index) {
                return SingleChildScrollView(
                  child: Container(
                    child: Card(
                      color: Colors.red.shade200,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.all(20),
                      child: Column(children: [
                        GestureDetector(
                          child: Image.network(
                            resultData[index].image,
                            height: 300,
                            fit: BoxFit.fill,
                          ),
                          onTap: () {
                            String image = resultData[index].image;
                            String day = resultData[index].description;
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) =>
                                        new WorkoutImageScreen(
                                            image: image, day: day)));
                          },
                        ),
                        DataTable(
                          dataRowColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected))
                              return Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.08);
                            return Colors.red.shade200;
                            //Use the default value.
                          }),
                          columns: [
                            DataColumn(
                                label: Text('',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                            DataColumn(
                                label: Text('',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold))),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text(
                                'Date',
                                style: TextStyle(fontSize: 18.0),
                              )),
                              DataCell(Text(
                                resultData[index].date == null
                                    ? ''
                                    : resultData[index].date,
                                style: TextStyle(fontSize: 18.0),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text(
                                'Day',
                                style: TextStyle(fontSize: 18.0),
                              )),
                              DataCell(Text(
                                resultData[index].description == null
                                    ? 'null'
                                    : resultData[index].description,
                                style: TextStyle(fontSize: 18.0),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(
                                Text(
                                  'Height',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              DataCell(Text(
                                resultData[index].height == null
                                    ? ''
                                    : resultData[index].height,
                                style: TextStyle(fontSize: 18.0),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text(
                                'Weight',
                                style: TextStyle(fontSize: 18.0),
                              )),
                              DataCell(Text(
                                resultData[index].weight == null
                                    ? ''
                                    : resultData[index].weight,
                                style: TextStyle(fontSize: 18.0),
                              )),
                            ]),
                          ],
                        ),
                      ]),
                    ),
                  ),
                );
              })
        ]),
      ),
    );
  }
}
