  
  // using function 
  //child to perant grt data
  // son-father screen
  
  
  import 'package:flutter/material.dart';
import 'package:to_do_app_project/screen/child_to_parent/son_screen.dart';

class FatherScreen extends StatefulWidget {
  const FatherScreen({Key? key}) : super(key: key);

  @override
  State<FatherScreen> createState() => _FatherScreenState();
}

class _FatherScreenState extends State<FatherScreen> {
  dynamic data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Father Screen"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Data: $data",
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // setState(() {});

                // data = await Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const SecondScreen(),
                //   ),
                // );
                // debugPrint("data ----------------->>> $data");

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SonScreen(
                      callback: (val) {
                        debugPrint("val ------------------->> $val");
                        data = val;
                        setState(() {});
                      },
                    ),
                  ),
                );
              },
              child: const Text("Next Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
