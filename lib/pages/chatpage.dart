import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';



class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE9F0F9),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
Navigator.pop(context);
          },
        ),
        title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/avtr.png'), 
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('JOHN DOE', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),
                Text('Online', style: TextStyle(color: Color(0xffA40DEE), fontSize: 12)),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {

            },
          ),
        ],
      ),
      body:
       Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(10),
              children: [
                _buildMessage("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took.", false),
                _buildMessage('Lorem Ipsum Is Simply Dummy', true),
                _buildMessage('Lorem Ipsum Is Simply Dummy', false),
                _buildMessage('Lorem Ipsum Is Simply Dummy', true),
                _buildMessage('Lorem Ipsum Is Simply Dummy', false),
                _buildMessage('Lorem Ipsum Is Simply Dummy', true),
                _buildMessage('Lorem Ipsum Is Simply Dummy', false),
                _buildMessage('Lorem Ipsum Is Simply Dummy', true),
                 _buildMessage('Lorem Ipsum Is Simply Dummy', false),
                _buildMessage('Lorem Ipsum Is Simply Dummy', true),

              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildMessage(String message, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Wrap(
        
        children: [
         !isUser? const CircleAvatar(
              backgroundImage: AssetImage('assets/avtr.png'), 
            ):const SizedBox(),
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          margin: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: isUser ? const Color.fromARGB(255, 255, 255, 255) : const Color(0xff122E57),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15),
              topRight: const Radius.circular(15),
              bottomLeft: isUser ? const Radius.circular(15) : Radius.zero,
              bottomRight: isUser ? Radius.zero : const Radius.circular(15),
            ),
          ),
          child: Text(
            message,
            style:GoogleFonts.montserrat(fontSize: 14, color: isUser ? Colors.black : Colors.white)
          ),
        ),
         isUser? const CircleAvatar(
              backgroundImage: AssetImage('assets/avt2.jpg'), 
            ):const SizedBox(),
        ]
      ),
    );
  }

  Widget _buildMessageInput() {
    return Column(
      
      children: [

        Container(
          
          decoration: BoxDecoration(
              color:const Color.fromARGB(255, 255, 255, 255) ,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(50),
                topRight: const Radius.circular(50),

              ),
            ),

          child: Row(
            children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 244, 244, 244),
                  child: IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.keyboard),
                    onPressed: () {
                     SystemChannels.textInput.invokeMethod('TextInput.show');
                    
                    },
                  ),
                          ),
                ),
              const Expanded(
                child: Column(
                  children: [
                    // Expanded(
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/avtr.png'), 
                      // ),
                    ),
                    SizedBox(height: 50,)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Color.fromARGB(255, 244, 244, 244),
                  child: IconButton(
                    color: Colors.black,
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                     SystemChannels.textInput.invokeMethod('TextInput.hide');
                    
                    },
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ],
    );
  }
}
