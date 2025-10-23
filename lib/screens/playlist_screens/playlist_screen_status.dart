import 'package:flutter/material.dart';

class PlaylistScreenStatus extends StatelessWidget {

  final Widget child;
  bool isError;
  bool isLoading;


  PlaylistScreenStatus({super.key, required this.child,this.isError = false,this.isLoading = true});

  @override
  Widget build(BuildContext context) {
    if (isError && !isLoading)
    {
      return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text("Something went wrong"),
          )
      );
    }
    if(isLoading && !isError)
    {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
    }


      return child;
    }


}


