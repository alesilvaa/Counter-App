import 'package:flutter/material.dart';

class counter_functions_screen extends StatefulWidget {
  
  const counter_functions_screen({super.key});

  @override
  State<counter_functions_screen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<counter_functions_screen> {

  int clickCounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  const Text("Counter Functions "),
          actions: [
            IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: (){
              setState(() {
                clickCounter = 0;
              });
            }, 
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
             Text("$clickCounter",
              style: TextStyle( fontSize: 160, fontWeight: FontWeight.w100 ),),
             Text(clickCounter == 1 ? "Click" : "Clicks", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),)
           ],
          ),
         ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.refresh_outlined,
              onPressedVar: (){
                setState(() {
                  clickCounter = 0;
                });
              },  
            ),
            const SizedBox(height: 10,),
            CustomButton(
              icon: Icons.plus_one,
              onPressedVar: (){
                setState(() {
                  clickCounter ++;
                });
              },  
            ),
            const SizedBox(height: 10,),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressedVar: (){
                setState(() {
                  if(clickCounter == 0) return;
                  clickCounter --;
                });
              },  
              )
          ],
        )
        );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final VoidCallback? onPressedVar;
  
  const CustomButton({
    super.key, 
    required this.icon, 
    this.onPressedVar,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 5,
      
      onPressed: onPressedVar,
      child: Icon( icon ),
    );
  }
}