import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  double bmiResult = 0;
  String textResult = "";
  bool enable = true;
  String dropdownValue = 'female';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      body: SafeArea(
        top: enable,
        bottom: enable,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 30,right: 30,top: 40,bottom: 0),
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const  Text('YOUR RESULT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                    Text(bmiResult.toStringAsFixed(2),style: const TextStyle(fontSize: 70,fontWeight: FontWeight.bold
                    ),),
                    Visibility(
                      visible: textResult.isNotEmpty,
                      child:
                    Text(textResult,style: TextStyle(fontSize: 20,color: Colors.black.withOpacity(0.4)),),
                    ),

                  ],
                ),
                const  SizedBox(height: 70,),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const  Text('Gender',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600) ,),
                               SizedBox(
                                width: 100,
                                child: TextField(style: TextStyle(),decoration: InputDecoration(
                                  suffixIcon: DropdownButtonFormField(
                                    value: dropdownValue,
                                    onChanged: (newValue){
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    items:<String>[
                                      'male',
                                      'female'
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),

                                ),),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const  Text('Age',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                              Container(
                                width: 100,
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  style: TextStyle(),decoration: InputDecoration(
                                  hintText: '0',

                                ),),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const  SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const   Text('Height',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600) ,),
                              SizedBox(
                                width: 100,
                                child: TextField(controller: _height, keyboardType: TextInputType.number,style: TextStyle(),decoration: InputDecoration(
                                  hintText: '0',
                                  suffixText: 'cm',

                                ),),
                              ),
                            ],
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Weight',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w600) ,),
                              SizedBox(
                                width: 100,
                                child: TextField(controller: _weight,keyboardType: TextInputType.number,style: TextStyle(),decoration: InputDecoration(
                                  hintText: '0',
                                  suffixText: 'kg',
                                ),),
                              ),                          ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 70,),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(onPressed: (){
                    double h = double.parse(_height.text);
                     double w = double.parse(_weight.text);
                     setState(() {
                       bmiResult = (w / (h*h)*10000);
                       if (bmiResult > 25){
                          textResult = "YOU\'RE OVERWEIGHT!";
                       }
                       else if(bmiResult >= 18.5 && bmiResult <= 25) {
                          textResult = "YOU\'RE IN A GREAT SHAPE";
                       }
                       else{
                        textResult = "TIME FOR SOME MORE HEALTHY SNACKS";
                       }
                     });

                    }, child: Text('CALCULATE',style: TextStyle(color: Colors.black),),style:ElevatedButton.styleFrom(backgroundColor: Colors.white,),)),
              ]
          ),
          ),
        ),
      ),
    );
  }
}
