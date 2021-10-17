import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/models/workoutmodel.dart';
import 'package:gym_app/screens/student/workoutimage_screen.dart';

class WorkoutStatusScreen extends StatefulWidget {
  final String rollno;
  WorkoutStatusScreen({this.rollno});
  @override
  _WorkoutStatusScreenState createState() => _WorkoutStatusScreenState();
}

class _WorkoutStatusScreenState extends State<WorkoutStatusScreen> {
  List<Workoutmodel> dataList = [];
  @override
  @override
  void initState() {
    super.initState();
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child("posts");
    referenceData
        .orderByChild("studentrollno")
        .equalTo(widget.rollno)
        .once()
        .then((DataSnapshot dataSnapshot) {
      dataList.clear();
      var keys = dataSnapshot.value.keys;
      var values = dataSnapshot.value;

      for (var key in keys) {
        Workoutmodel data = new Workoutmodel(
          values[key]["image"],
          values[key]["date"],
          values[key]["description"],
          values[key]["height"],
          values[key]["weight"],
        );
        if (!mounted) {
          return;
        } else {
          setState(() {
            dataList.add(data);
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Workout Status"),
          actions: [],
        ),
        body: dataList.length == 0
            ? Center(
                child: Text(
                  "No Datas Available",
                  style: TextStyle(fontSize: 30),
                ),
              )
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (_, index) {
                  return Container(
                    child: Card(
                      color: Colors.red.shade200,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      margin: EdgeInsets.all(20),
                      child: Column(children: [
                        GestureDetector(
                          child: Image.network(
                            dataList[index].image,
                            height: 300,
                            fit: BoxFit.fill,
                          ),
                          onTap: () {
                            String image = dataList[index].image;
                            String day = dataList[index].description;
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
                                dataList[index].date == null
                                    ? ''
                                    : dataList[index].date,
                                style: TextStyle(fontSize: 18.0),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text(
                                'Day',
                                style: TextStyle(fontSize: 18.0),
                              )),
                              DataCell(Text(
                                dataList[index].description == null
                                    ? 'null'
                                    : dataList[index].description,
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
                                dataList[index].height == null
                                    ? ''
                                    : dataList[index].height,
                                style: TextStyle(fontSize: 18.0),
                              )),
                            ]),
                            DataRow(cells: [
                              DataCell(Text(
                                'Weight',
                                style: TextStyle(fontSize: 18.0),
                              )),
                              DataCell(Text(
                                dataList[index].weight == null
                                    ? ''
                                    : dataList[index].weight,
                                style: TextStyle(fontSize: 18.0),
                              )),
                            ]),
                          ],
                        ),
                      ]),
                    ),
                  );
                }));
  }
}
