import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();

}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  TextEditingController myController = TextEditingController();
  String name = "Login";
  String name2 = "Sign up";
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  TextEditingController myController1 = TextEditingController();

  @override
  void dispose1() {
    // Clean up the controller when the widget is disposed.
    myController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Retrieve Text Input'),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('$name',style: TextStyle(fontSize: 30,color: Colors.blue),),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextField(
              controller: myController,

              decoration: InputDecoration(

                border: OutlineInputBorder(),
                hintText: 'Enter your email',
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              controller: myController1,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your password',
                hintText: 'Password',


              ),
            ),
          ),

          ElevatedButton(onPressed:(){
            if((myController.text!="")&&(myController1.text!="")) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('Login successfull'),
                  );
                },
              );
            }
            else if((myController.text=="")&&(myController1.text!="")){
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('Enter valid email'),
                  );
                },
              );
            }
            else if((myController.text!="")&&(myController1.text=="")){
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('Enter valid password'),
                  );
                },
              );
            }
            else{
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    // Retrieve the text the that user has entered by using the
                    // TextEditingController.
                    content: Text('Enter valid email and password'),
                  );
                },
              );
            };
          },
            child: Text('$name',style: TextStyle(fontSize: 20,color: Colors.white, ),),
          ),
          SizedBox(
            height: 50,
          ),
          Text('or'),
          TextButton(onPressed:(){
            setState(() {
              if(name == "Sign Up"){
                name = "Login";
                name2="Sign Up";
              }
              else{
                name = "Sign Up";
                name2 = "Login";
              };
            });


          },
            child: Text('$name2',style: TextStyle(fontSize: 16,color: Colors.red),),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}