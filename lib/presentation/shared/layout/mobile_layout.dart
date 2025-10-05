import 'package:flutter/material.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/tabletWidgets/custom_appbar.dart';
import 'package:soudbar_kiosk_app/presentation/shared/widgets/tabletWidgets/custom_footer.dart';

class MobileLayout extends StatelessWidget {
  final Widget connectionContent;
  final Widget mediaPlayerContent;
  final Widget mediaContent;

  const MobileLayout({
    super.key,
    required this.connectionContent,
    required this.mediaPlayerContent,
    required this.mediaContent,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: 
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppbar(
              title: 'Soundbar Demo System', 
              subTitle: 'Experience premium audio quality - Compare and test out Bluetooth soundbars'
              // title: 'TESTING FLUTTER', 
              // subTitle: 'testing flutter testing flutter testing flutter'
              ),
              SizedBox(height: 10,),
              Expanded(
                child: Row(
                  children: [
                  Expanded(
                    flex: 4,
                    child: 
                    Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child:  Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xFFDDDDDD), width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child:  Column(
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.bluetooth_rounded),
                                      Text('Connected Soundbars')
                                    ],
                                  ),
                                  connectionContent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Color(0xFFDDDDDD), width: 1),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: mediaPlayerContent,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 5,
                    child:  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Color(0xFFDDDDDD), width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:  Column(
                          children: [
                            Row(
                              children: [
                                Text('Demo Content Library'),
                                SizedBox(width: 1,),
                              ],
                            ),
                            mediaContent
                          ],
                        ),
                      ),
                    ),
                  ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              CustomFooter(
                systemStatus: 'System Active'
              )
            ],
          )
        ),
      ),
    );
  }
}