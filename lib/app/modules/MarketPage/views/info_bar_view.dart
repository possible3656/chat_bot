import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../data/Constant.dart';

class InfoBarView extends StatelessWidget {
  const InfoBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundColor: Constant.textColor.withOpacity(.2),
                child: Image.asset(
                  'assets/ril.png',
                  scale: 2,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Reliance',
                    style: TextStyle(
                      fontSize: 16,
                      color: Constant.textColor,
                      letterSpacing: 1.1,
                    ),
                  ),
                  Text(
                    'RIL',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1.1,
                      color: Constant.textColor.withOpacity(.5),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'र 2618.75',
                style: TextStyle(fontSize: 16, color: Constant.textColor),
              ),
              const Text(
                '-14.05 (-0.53%)',
                style: TextStyle(fontSize: 12, color: Colors.redAccent),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
