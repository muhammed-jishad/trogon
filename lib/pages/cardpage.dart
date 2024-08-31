import 'package:carousel_slider/carousel_slider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogon/pages/chatpage.dart';
class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  CarouselSliderController buttonCarouselController = CarouselSliderController();
int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
         preferredSize: const Size.fromHeight(130.0),
        child: AppBar(
          leading: GestureDetector(
            onTap: (){
              Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => ChatScreen()),
);
            },
            child: Container(margin: const EdgeInsets.all(10),padding: const EdgeInsets.only(left: 10),  decoration: BoxDecoration(border: Border.all(
                color: Colors.white,
              ),borderRadius: BorderRadius.circular(100)), child: const Icon(Icons.arrow_back_ios,color: Colors.white,),),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 139, 0, 204),
            title: Text('Flash Card',style:GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight:FontWeight.w600 )),
            shape:  const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
         bottom: Radius.elliptical(
              // MediaQuery.of(context).size.width, 80.0),
              200, 80.0),

        ),
            ),
            ),
      ),
    body: SingleChildScrollView(
      child: Column(children: [
        const SizedBox(height:50 ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
    
          children: [
        Text("Everyday Phrases",style:GoogleFonts.poppins(color: Colors.black,fontSize: 20,fontWeight:FontWeight.w600 ) ,),
        Column(
      children: <Widget>[
      SizedBox(
        height: 200.0,
        child: Stack(
          children: <Widget>[
            Center(
              child: SizedBox(
                height: 50,
                width: 50,
                child: CircularProgressIndicator(
                  value: index / 15,
                   backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.purple),
                ),
              ),
            ),
            Center(child: Padding(padding: const EdgeInsets.fromLTRB(5,0,0,0), child: Text("$index/15"))),
          ],
        ),
      ),
      ],
    ),
        ],),
    CarouselSlider.builder(
       carouselController: buttonCarouselController,
      itemCount: 15,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
      SizedBox(
                height: 400,
                width: 250,
                child: FlipCard(
                  // flipOnTouch: false,
                  // key: cardKey,
                  direction: FlipDirection.HORIZONTAL,
                  front: Card(
                    color: Colors.purple,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Obvio",
                             style:GoogleFonts.poppins(color: Colors.white,fontSize: 40,fontWeight:FontWeight.w500 ) 
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.volume_up_rounded,color: Colors.white,),
                              const SizedBox(width: 10,),
                              Text(
                            "Obvio",
                             style:GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight:FontWeight.w200 ) 
                          ),
                            ],
                          ),
                          const SizedBox(height: 5,),
                          SizedBox(
                            height: 50,
                            width: 50,
                            child: Container(
decoration: BoxDecoration(
  color: Colors.white,
  border: Border.all(
    ),borderRadius: BorderRadius.circular(10)
),
  
                                  child: const Icon(Icons.arrow_forward_ios,weight: 1.0,),
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                  back:  Card(
                    color: Colors.purple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Meaning of Obvio",
                          style:GoogleFonts.poppins(color: Colors.white,fontSize: 16,fontWeight:FontWeight.w300 ) 
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      options: CarouselOptions(
        pageSnapping:false,
        height: 300,
        aspectRatio: 2.0,
        enlargeCenterPage: false,
        viewportFraction: 0.7,
        initialPage: 0,
        enableInfiniteScroll: false,
        reverse: false,
        autoPlay: false,

       )
    ),
    
    const SizedBox(height: 70,),
    
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      OutlinedButton(
      onPressed: (){
        setState(() {
          index<=0?index:index--;
        });
    buttonCarouselController.previousPage(
              duration: const Duration(milliseconds: 300), curve: Curves.linear);
          },
      style: ButtonStyle(
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side:const BorderSide(
            color: Colors.purple,
            width: 1,
            style: BorderStyle.solid
          ),)),
      ),
      child: const Text("Previous",style: TextStyle(color: Colors.black),),
    ),
     OutlinedButton(
      onPressed: (){
        setState(() {
          index>=15?index:index++;
        });
    buttonCarouselController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.linear);
          },
          
      style: ButtonStyle(
      shape: MaterialStateProperty.all( RoundedRectangleBorder(side:const BorderSide(
            color: Colors.purple,
            width: 1,
            style: BorderStyle.solid
          ),  borderRadius: BorderRadius.circular(10.0))),
      ),
      child: const Text("Next",style: TextStyle(color: Colors.black),),
    ),
      ],
    )
      ],),
    )
    
    );
  }
}