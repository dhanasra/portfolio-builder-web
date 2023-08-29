
import 'package:flutter/material.dart';
import 'package:portfolio_builder_ai/constants/colors_const.dart';
import 'package:portfolio_builder_ai/extensions/int_ext.dart';
import 'package:portfolio_builder_ai/extensions/string_ext.dart';
import 'package:portfolio_builder_ai/network/models/resume_schema.dart';
import 'package:portfolio_builder_ai/presentation/templates/widgets/text_container.dart';
import 'package:portfolio_builder_ai/presentation/templates/widgets/timeline_item.dart';
import 'package:portfolio_builder_ai/widgets/e_button.dart';
import 'package:portfolio_builder_ai/widgets/input_field.dart';




class TemplateView extends StatefulWidget {
  final ResumeSchema schema;
  const TemplateView({
    super.key,
    required this.schema  
  });

  @override
  State<TemplateView> createState() => _TemplateViewState();
}

class _TemplateViewState extends State<TemplateView> {

  int i = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConst.primary,
      body: ListView(
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 0.8.screenHeight(context),
                color: ColorsConst.primary,
                padding: const EdgeInsets.all(30),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Hi, I'm ${widget.schema.name}".headlineLarge(context, color: ColorsConst.white),
                        "a, Flutter developer.".titleLarge(context, color: ColorsConst.white),

                        60.height(),
                        Row(
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: 160,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      color: ColorsConst.white,
                                      borderRadius: BorderRadius.circular(4)
                                    ),
                                    alignment: Alignment.center,
                                    child: 'Contact Me'.bodySmall(context, isBold: true)),
                                ),
                              ),

                              24.width(),

                              Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: (){},
                                  child: Container(
                                    width: 160,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(color: ColorsConst.white)
                                    ),
                                    alignment: Alignment.center,
                                    child: 'Check My Work'.bodySmall(context, isBold: true, color: ColorsConst.white)),
                                ),
                              )
                        
                            ],
                          )
                      ],
                    )

                  ],
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 900
                ),
                child: Column(
                  children: [
                    'About'.headlineMedium(context, color: ColorsConst.white),
                    Container(
                      width: 100,
                      height: 6,
                      margin: const EdgeInsets.only(top: 12),
                      color: Colors.white,
                    ),
                    30.height(),
                    (widget.schema.summary??'')
                      .bodyLarge(context, color: ColorsConst.white, align: TextAlign.center, height: 2),
                    100.height(),
                  ],
                ),
              ),
            ],
          ),

          if(widget.schema.workExperience!=null)
          Container(
            color: ColorsConst.primary,
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [

                'My Career'.headlineMedium(context, color: ColorsConst.white),

                Container(
                  width: 100,
                  height: 6,
                  margin: const EdgeInsets.only(top: 12),
                  color: Colors.white,
                ),

                60.height(),

                ...widget.schema.workExperience!.map((e){
                  return TimeLineItem(
                    dateTime: '${e.startDate} - ${e.endDate}', 
                    reverse: (++i%2)==0, 
                    text: '${e.jobTitle}'
                  );
                }).toList()

              ],
            )
          ),

          100.height(),

          Column(
            children: [
              'My Projects'.headlineMedium(context, color: ColorsConst.white),

              Container(
                width: 100,
                height: 6,
                margin: const EdgeInsets.only(top: 12),
                color: Colors.white,
              ),

              60.height()
            ],
          ),
          
          if(widget.schema.projects!=null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 900
                ),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.schema.projects!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                    crossAxisCount: widget.schema.projects!.length<=3? widget.schema.projects!.length: 3
                  ), 
                  itemBuilder: (_, index){
                    return TextContainer(
                      name: widget.schema.projects![index].name??'',
                      desc: widget.schema.projects![index].description??'');
                  }),
              ),
            ],
          ),

          120.height(),

          Container(
            color: ColorsConst.secondary,
            height: 6,
          ),

          Container(
            color: ColorsConst.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1200
                  ),
                  child: Column(
                    children: [

                        60.height(),
                        'Contact'.headlineMedium(context),
                            
                        Container(
                          width: 100,
                          height: 6,
                          margin: const EdgeInsets.only(top: 12),
                          color: ColorsConst.primary,
                        ),
                
                        60.height(),
                        InputField(
                          controller: TextEditingController(),
                          maxLines: 10,
                          hintText: 'Enter your message here',  
                        ),

                        32.height(),

                        EButton(onClick: (){}, text: 'SEND'),

                      60.height(),
                    ],
                  ),
                )
          
              ],
            ),
          ),

        ],
      ),
    );
  }
}

