import 'package:cryptocurrency/model/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PriceGraph extends StatelessWidget {
  final Coin? c;

   PriceGraph({this.c});

  String formatPrice(double price) {
    if (price >= 1000) {
      return (price / 1000).toStringAsFixed(1) + 'k';
    }
    return price.toStringAsFixed(2);
  }

Widget boxes(String text){
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade700,
      foregroundColor: Colors.white
    ),
    onPressed: (){},
    child: Center(child: Text(text, style: TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold
        
    ),)),
  );
}
 
   Widget views(String txt, String supp){
     return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(txt, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade500

                        ),
                        
                        )
                        ,
                        Text(supp,style:  TextStyle(
                          
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20

                        ),)
                      ],
                    ),
                  );

                
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 11, 28, 53),
      appBar: AppBar(
        foregroundColor: Colors.white,
     backgroundColor: Color.fromARGB(255, 11, 28, 53),
      ),
   
      body: 
           Column(
            children: [
              
              Expanded(
                flex: 5,
              child: ListView(
                
                          
                children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 20),
                     child: Text(c!.name.toString(), style: TextStyle(color: Colors.white,
                                   fontSize: 30, fontWeight: FontWeight.bold
                                   ),),
                   ),
                            
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text("\$${formatPrice(c!.price)}", style: TextStyle(color: Colors.white,
                fontSize: 40, fontWeight: FontWeight.bold
                ),),
              ),
              SizedBox(height: 20,),
                         Expanded(
                          flex: 2,
                          child: Image.asset("images/graph.jpg")),
                           
                    //boxes
                           
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         boxes("1H"),
                          boxes("1D"),
                           boxes("1W"),
                            boxes("1M"),
                             boxes("1Y"),
                        ],
                      ),
                    ),
                          
                                SizedBox(height: 10,),
                  Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text("About ${c!.name.toString()}", style: TextStyle(color: const Color.fromARGB(255, 131, 121, 121),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                    ),),
                  ),
                  SizedBox(height: 20,),
                  views("Rank", c!.id.toString()),
                  SizedBox(height: 10,),
                   views("MarketCap", c!.market_cap.toString()),
                   SizedBox(height: 10,),
                    views("MarketDominance", c!.market_cap_dominance.toString()),
                    SizedBox(height: 10,),
                     views("Percent Change 1hr", c!.percent_change_1h.toString()),
                     SizedBox(height: 10,),
                      views("Volume Change", c!.volume_change_24h.toString()),
                      SizedBox(height: 10,),
                       views("Price", c!.market_cap.toString()),
                             SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                         child: Text( "Introduction", style: TextStyle(color: Colors.white,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 20
                                           ),),
                       ),

                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20),
                         child: Text.rich(
                          
                          TextSpan(
                            style:TextStyle(color: Colors.white),
                          text: "${c!.name.toString()} was the cryptocurrency introduced to the public and was intended to be used as a form of payment outside of legal tender. Since its introduction in 2009, ${c!.name.toString()} popularity has surged, and its blockchain uses have expanded. ${c!.name.toString()} was the cryptocurrency introduced to the public and was intended to be used as a form of payment outside of legal tender. Since its introduction in 2009, ${c!.name.toString()} popularity has surged, and its blockchain uses have expanded."
                         )
                         
                         ),
                       )
                   
                ],
              )
                            )
            
            
         , Expanded(
  flex: 1,
  child: Container(
    height: 40,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(10,), topRight: Radius.circular(10,),  ),
      border: Border.all(
      width: 1,
      color: Colors.grey
    ),
     color: Color.fromARGB(255, 11, 25, 53),
    ),
   
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
        
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text(
                'Your balance',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                   Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    c!.symbol.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold

                    ),
                  ),
                ],
              ),
               Text(
                    '=\$0.00',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 120,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                // Add your buying logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text('Buy', style: TextStyle(color: Colors.black)),
            ),
          ),
        ),
      ],
    ),
  ),
),

            ],
           )
          
    );
  }
}
