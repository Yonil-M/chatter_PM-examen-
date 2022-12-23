import 'package:chatter/pages/calls_page.dart';
import 'package:chatter/pages/contacts_page.dart';
import 'package:chatter/pages/messages_page.dart';
import 'package:chatter/pages/notification_page.dart';
import 'package:chatter/screens/screens.dart';
import 'package:chatter/temas.dart';
import 'package:chatter/app.dart';
import 'package:chatter/widget/glowing_action_buttom.dart';
import 'package:chatter/widget/widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ValueNotifier<int> pageIndex=ValueNotifier(0);
  final ValueNotifier<String> title=ValueNotifier('Messages');

  final pages=const [
    MessagesPage(),
    NotificationPage(),
    CallsPage(),
    ContactsPage(),
  ];

  final pageTitles=const[
    'Mensajes',
    'Notificaciones',
    'Llamadas',
    'Contactos',
  ];

  void _onNavigationItemSelected(index){
    title.value=pageTitles[index];
      pageIndex.value=index;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: title,
          builder: ( BuildContext context,String value, _) {
          return Text(value,style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          );
          },
        ),
        leadingWidth: 54.0,
        leading: Align(
          alignment: Alignment.centerRight,
          child: IconBackground(
            icon: Icons.search, 
            onTap: () {
              print('TODO Search');
            },
            ),
        ),

        actions: [Padding(
          padding: const EdgeInsets.only(right:24.0),
          child: Hero(
            tag: 'hero-profile-picture',
            child: Avatar.small(url: context.currentUserImage,
            onTap: () {
              Navigator.of(context).push(ProfileScreen.route);
            },
            ),
          ),
        )],
      ),

      body: ValueListenableBuilder(
        valueListenable: pageIndex, 
        builder: (BuildContext context,int value, _) {
          return pages[value];
        },),
      bottomNavigationBar: _BottomNavigatorBar(
      onItemSelected:_onNavigationItemSelected
      ),
    );
  }

  
}// pantalla principal

class _BottomNavigatorBar extends StatefulWidget {
  const _BottomNavigatorBar({
    Key? key,
    required this.onItemSelected
  }) : super(key: key);

  final ValueChanged<int> onItemSelected;

  @override
  State<_BottomNavigatorBar> createState() => _BottomNavigatorBarState();
}

class _BottomNavigatorBarState extends State<_BottomNavigatorBar> {
  var selectedIndex=0;

  void handleItemSelected(int index){
    setState(() {
      selectedIndex=index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness=Theme.of(context).brightness;
    return Card(
      color: (brightness==Brightness.light)? Colors.transparent:null,
      elevation: 0,
      margin:const EdgeInsets.all(0),
      child: SafeArea(
        top: false,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0,left: 8.0,right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[
            _NavigationBarItem(
              index: 0,
              lable: 'Mensajes',
              icon: CupertinoIcons.bubble_left_bubble_right_fill,
              isSelected: (selectedIndex==0),
              onTap: handleItemSelected,
            ),
    
            _NavigationBarItem(
              index: 1,
              lable: 'Notificaciones',
              icon: CupertinoIcons.bell_solid,
              isSelected: (selectedIndex==1),
               onTap:handleItemSelected,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GlowingActionButton(
                color: AppColors.secondary, 
                icon: CupertinoIcons.add, 
                onPressed: () {
                  showDialog(
                    context:context , 
                    builder: (BuildContext context)=>const Dialog(
                      child: AspectRatio(
                        aspectRatio: 8/7,
                        child: ContactsPage(),
                        ),
                    ),
                    );
                },
                ),
            ),
    
            _NavigationBarItem(
              index: 2,
              lable: 'Llamadas',
              icon: CupertinoIcons.phone_fill,
              isSelected: (selectedIndex==2),
               onTap: handleItemSelected,
            ),
    
            _NavigationBarItem(
              index: 3,
              lable: 'Contactos',
              icon: CupertinoIcons.person_2_fill,
              isSelected: (selectedIndex==3),
               onTap: handleItemSelected,
            ),
            
          ],),
        ),
        
        ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  const _NavigationBarItem({Key? key,
  required this.index,
  required this.lable,
  required this.icon,
  this.isSelected=false,
  required this.onTap,
  }):super(key: key);

  
  final int index;
  final String lable;
  final IconData icon;
  final bool isSelected;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
       onTap(index);
      },
      child: SizedBox(
       
        width: 70.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,size: 20.0,
            color: isSelected? AppColors.secondary:null,),
            SizedBox(
              height: 12.0,
              child: Text(lable,style:isSelected? const TextStyle(
                fontSize: 11.0,color: AppColors.secondary,fontWeight:FontWeight.bold) :
              const TextStyle(fontSize: 11.0),)),
          ],
        ),
      ),
    );
  }
}