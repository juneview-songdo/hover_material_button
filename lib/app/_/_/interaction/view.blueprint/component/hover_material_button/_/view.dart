import 'package:flutter/material.dart';

import '../../../../../../../../main.dart';
import '_/state_child.dart';
import '_/state_mother.dart';

class NewView extends StatefulWidget {
  NewView({super.key});

  @override
  State<NewView> createState() => StateChild();
}

class NewViewState extends State<NewView> with StateMother {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovering = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: _isHovering ? Colors.transparent : Colors.blue,
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.blue, // 테두리 색상
            width: 1.0, // 테두리 두께
          ),
        ),
        child: TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(
                Colors.transparent), // 호버 시 덮어씌워지는 색 제거
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: _isHovering ? Colors.blue : Colors.white,
              ),
              Text(
                'Add View',
                style: TextStyle(
                    color: _isHovering ? Colors.blue : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                '   /   ',
                style: TextStyle(
                    color: _isHovering ? Colors.blue : Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SvgPicture.asset(
                'assets/view/hover_material_button/feedback-svgrepo-com.svg',
                width: 15,
                height: 15,
                color: _isHovering ? Colors.blue : Colors.white,
              ),
              Gap(5),
              Text(
                'Feedback',
                style: TextStyle(
                    color: _isHovering ? Colors.blue : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

main() async {
  return buildApp(appHome: NewView().center());
}