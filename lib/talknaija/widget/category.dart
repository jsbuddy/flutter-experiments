import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String name;
  final IconData icon;

  Category(this.name, this.icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0).copyWith(left: 16.0),
      child: InkWell(
        onTap: () {},
        child: Container(
            width: 80.0,
            height: 80.0,
            decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(3.0))),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Icon(icon),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor.withOpacity(.6),
                      borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(3.0))),
                  child: Center(
                    child: Text(
                      name,
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
