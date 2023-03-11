import 'package:flutter/material.dart';
class ApplicationCard extends StatelessWidget {
  final String id;
  final String name;
  final String job;
  final String image;
  final String status;
  const ApplicationCard({
    Key? key,
    required this.id,
    required this.name,
    required this.job,
    required this.image,
    required this.status
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _statusColor = Colors.black;
    bool _show = false;
    switch(this.status){
      case 'Pending':
        _statusColor = Colors.amber;
        _show =true;
        break;
      case 'Accepted':
        _statusColor = Colors.green;
        break;
      case 'Denied':
        _statusColor = Colors.red;
        break;
    }

    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.all(10),
        // height: 100,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: Colors.black,
                width: 1,
                style: BorderStyle.solid
            )
        ),
        child:
            Container(
              height:90,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            this.image,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        // width: 200,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              this.name,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis ,
                            ),
                            Text(
                              this.job,
                              style: TextStyle(fontSize: 12),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis ,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          decoration: BoxDecoration(
                            color: _statusColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Pending",style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                          )),
                        ),

                        _show ?
                        GestureDetector(
                          onTap: (){

                          },
                            child: Text("cancel",
                              style: TextStyle(color: Colors.red),
                            ))
                            : Text(""),
                      ],
                    ),
                  )
                  
                ],
              ),
            ),
      ),
    );
  }
}
