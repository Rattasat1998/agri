import 'package:flutter/cupertino.dart';




class Section3Model {
  String? process;
  String? typeMachine;
  String? prossessor;
  String? prossessor1;
  String? serviceFee;
  String? dicisionReason;


  Section3Model({
     this.process,
     this.typeMachine,
     this.prossessor,
     this.prossessor1,
     this.serviceFee,
     this.dicisionReason,


  });

  factory Section3Model.fromJson(Map<String, dynamic> map) {
    return Section3Model(
      process: map['process'],
      typeMachine: map['type_machine'],
      prossessor: map['prossessor'],
      prossessor1: map['prossessor1'],
      serviceFee: map['service_fee'],
      dicisionReason: map['decision_reusons'],
    );
  }


  static  List<TextEditingController> part4 = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<Map<String, dynamic>> get toList {
    return [
      {
        'process': process,
        'type_machine': typeMachine,
        'prossessor': prossessor,
        'prossessor1': prossessor1,
        'service_fee': serviceFee,
        'decision_reusons': dicisionReason,
      }
    ];
  }

  Map<String, dynamic> toJson() {
    return {
      'process': process,
      'type_machine': typeMachine,
      'prossessor': prossessor,
      'prossessor1': prossessor1,
      'service_fee': serviceFee,
      'decision_reusons': dicisionReason,
    };
  }

static final List<Section3Model> data3 = [];

}