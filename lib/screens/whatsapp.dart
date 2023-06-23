import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
          backgroundColor:const  Color(0xff05FF00), // Customize the app bar color
          centerTitle: true,
          title: const Text(
            'WhatsApp link-Taluk',
            style:TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), // Customize the text color
              fontWeight: FontWeight.bold, // Make the text bold
            ),
          ),),
      
      resizeToAvoidBottomInset: false,
      
      body: Stack(
        children: [
           
          
          
          
          
         
          Container(
            //width: MediaQuery.of(context).size.width-50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              
              children: [
          
                
          
                    
             const Text("Kodungallur :"),
              TextButton(onPressed: ()=> launchUrl(Uri.parse('https://chat.whatsapp.com/CCkdvebYpVv2pqvrEpImSy'),mode: LaunchMode.externalApplication), child:const Text('https://chat.whatsapp.com/CCkdvebYpVv2pqvrEpImSy',style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic),)),
             const Text("Paravur :"),
              TextButton(onPressed: ()=> launchUrl(Uri.parse('https://chat.whatsapp.com/DzreQWjNqHI7Nn6vY7snDV'),mode: LaunchMode.externalApplication), child:const Text('https://chat.whatsapp.com/DzreQWjNqHI7Nn6vY7snDV',style: TextStyle(color: Colors.blue,fontStyle: FontStyle.italic),))
                
                    
          
              ],
            ),
          ),
        ],
      ),
    );
  }
}