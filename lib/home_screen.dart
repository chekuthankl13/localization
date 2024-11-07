import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:loacalization/lang_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true, 
          children: [
          const  DrawerHeader(child: Text("data")), 
          const SizedBox(height: 5,), 
          ListTile(
            leading:const Icon(Icons.language),
            title: Text(AppLocalizations.of(context)!.language),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const LangScreen()));
            },
          )
          ],
        ),
      ),
      appBar: AppBar(
        
        backgroundColor: Colors.green,
        title: Text(AppLocalizations.of(context)!.apptitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(AppLocalizations.of(context)!.dummy),
      ),
    );
  }
}