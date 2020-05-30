import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappforedu/Modals/student.dart';
import 'package:flutterappforedu/screens/student_add.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //cupertiano
    return MaterialApp(home: HomeScreen());
  }
}

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {
  List<Student> students = [
    Student.withId(1,"Ergun", "Akilli", 10),
    Student.withId(2,"Ayşe", "Ak", 45),
    Student.withId(3,"Açelya", "Yıldız", 98)
  ];

  Student selectedStudent = Student.withId(0, "", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody()
    );
  }

  Widget buildBody() {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(students[index].firstName +" "+ students[index].lastName),
                  subtitle: Text("Sınavdan aldığı not: "+ students[index].grade.toString() +" "+ students[index].getStatus),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://fastly.4sqi.net/img/user/width960/79503564-TILD1QICMSVEJ1YT.jpg"),
                  ),
                  trailing: buildStatusIcon(students[index].grade),
                  onTap: (){
                    setState((){
                      this.selectedStudent = students[index];
                    });
                  },
                  onLongPress: (){
                    print("Uzun Basıldı");

                  },
                );
              }),
        ),
        Text("Seçili öğrenci "+selectedStudent.firstName ),
        Row(
          children: <Widget>[
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: RaisedButton(
                color: Colors.greenAccent,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Yeni Öğrenci")
                  ],
                ),
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StudentAdd(students)));
                  },
              )
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.black12,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.update),
                      SizedBox(width: 4.0,),
                      Text("Güncelle")
                    ],
                  ),
                  onPressed: (){
                    print("Güncelle");
                  },
                )
            ),
            Flexible(
                fit: FlexFit.tight,
                flex: 2,
                child: RaisedButton(
                  color: Colors.amberAccent,
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.delete),
                      SizedBox(width: 4.0,),
                      Text("Sil")
                    ],
                  ),
                  onPressed: (){
                    print("Sil");
                  },
                )
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if(grade >= 50){
      return Icon(Icons.done);
    } else if(grade >=40) {
      return Icon(Icons.album);
    } else{
      return Icon(Icons.clear);
    }
  }
}
