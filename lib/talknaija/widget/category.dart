import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  Category({ this.name, this.icon, this.onTap, this.isActive });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: ClipOval(
        child: InkWell(
          onTap: onTap,
          child: CircleAvatar(
            child: Icon(icon, color: isActive ? Colors.white : Colors.grey),
            radius: 25,
            backgroundColor: !isActive ? Colors.black12 : Theme.of(context).accentColor,
          ),
        ),
      ),
    );

//    return Container(
//      width: 150,
//      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//      decoration: BoxDecoration(
//          borderRadius: BorderRadius.circular(3),
//          gradient: LinearGradient(colors: [
//            Colors.blueAccent,
//            Colors.blue
//          ],begin: FractionalOffset.topLeft,end: FractionalOffset.bottomRight)
//      ),
//      child: InkWell(
//        onTap: this.onTap,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Icon(icon, size: 25,color: Colors.white,),
//            SizedBox(height: 10),
//            Text(name, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 13),)
//          ],
//        ),
//      ),
//    );
//    return InkWell(
//      onTap: this.onTap,
//      child: Container(
//        width: 100,
//        alignment: FractionalOffset.centerLeft,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            Container(
//              padding: EdgeInsets.all(7),
//              child: Icon(icon, color: Theme.of(context).accentColor,),
//              decoration: BoxDecoration(
//                color: isActive ? Theme.of(context).accentColor.withOpacity(.2) : Theme.of(context).textTheme.body1.color.withOpacity(.07),
//                borderRadius: BorderRadius.circular(4),
////                border: Border.all(color: Theme.of(context).accentColor,
////                width: 1,style: BorderStyle.solid)
//              ),
//            ),
//            SizedBox(height: 10),
//            Text(this.name, style: TextStyle(fontSize: 12, color: Theme.of(context).textTheme.body1.color))
//          ],
//        ),
//      ),
//    );
//    return InkWell(
//      onTap: this.onTap,
//      child: Container(
//          width: 120,
//          height: 60,
//          decoration: BoxDecoration(
//              color: isActive
//                  ? Theme
//                  .of(context)
//                  .accentColor
//                  : Theme
//                  .of(context)
//                  .scaffoldBackgroundColor,
//              borderRadius: BorderRadius.all(Radius.circular(3.0))),
//          child: Row(
//            crossAxisAlignment: CrossAxisAlignment.end,
//            mainAxisAlignment: MainAxisAlignment.end,
//            children: <Widget>[
//              Expanded(
//                child: Padding(
//                  padding: const EdgeInsets.all(10.0),
//                  child: Text(
//                    name,
//                    style: TextStyle(fontSize: 12.0),
//                    overflow: TextOverflow.ellipsis,
//                  ),
//                ),
//              ),
//              Container(
//                height: double.infinity,
//                width: 55,
//                child: Align(
//                  alignment: FractionalOffset.bottomCenter,
//                  child: Padding(
//                    padding: const EdgeInsets.only(bottom: 5),
//                    child: Icon(
//                      icon,
//                      size: 50,
//                    ),
//                  ),
//                ),
//              ),
//              SizedBox(width: 5)
//            ],
//          )),
//    );
  }
}
