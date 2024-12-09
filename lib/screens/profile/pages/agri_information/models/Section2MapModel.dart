import 'rice_field_model.dart';
import 'section_2_model.dart';

class Section2MapModel {
  final RiceFieldModel selectedRiceField;
  S211? s211;
  S212? s212;
  S213? s213;
  S214? s214;
  S215? s215;
  S221? s221;
  S222? s222;
  S223? s223;
  S224? s224;
  S225? s225;
  S226? s226;
  S231? s231;
  S232? s232;
  S23SoilPreparationSteps? s23SoilPreparationSteps;
  HS23owToPlantInTheLastProductionYears? hS23owToPlantInTheLastProductionYears;
  S241? s241;
  S242? s242;
  S243? s243;
  S244? s244;
  S245? s245;
  CaseOfGivingWaters? caseOfGivingWaters;
  CaseOfApplyingFertilizers? caseOfApplyingFertilizers;
  CaseKillWeeds? caseKillWeeds;
  S254532? s254532;
  S224541? s224541;
  S224542? s224542;
  S251? s251;
  S252? s252;
  S253? s253;
  S254? s254;
  S255? s255;
  S256? s256;
  S260? s260;


  Section2MapModel({
    required this.selectedRiceField,
    required this.s211,
    required this.s212,
    required this.s213,
    required this.s214,
    required this.s215,
    required this.s221,
    required this.s222,
    required this.s223,
    required this.s224,
    required this.s225,
    required this.s226,
    required this.s231,
    required this.s232,
    required this.s23SoilPreparationSteps,
    required this.hS23owToPlantInTheLastProductionYears,
    required this.s241,
    required this.s242,
    required this.s243,
    required this.s244,
    required this.s245,
    required this.caseOfGivingWaters,
    required this.caseOfApplyingFertilizers,
    required this.caseKillWeeds,
    required this.s254532,
    required this.s224541,
    required this.s224542,
    required this.s251,
    required this.s252,
    required this.s253,
    required this.s254,
    required this.s255,
    required this.s256,
    required this.s260,
  });


  Map<String, dynamic> toJson() {
    return {
      'selectedRiceField': selectedRiceField.toJson(),
      's211': s211?.toJson(),
      's212': s212?.toJson(),
      's213': s213?.toJson(),
      's214': s214?.toJson(),
      's215': s215?.toJson(),
      's221': s221?.toJson(),
      's222': s222?.toJson(),
      's223': s223?.toJson(),
      's224': s224?.toJson(),
      's225': s225?.toJson(),
      's226': s226?.toJson(),
      's231': s231?.toJson(),
      's232': s232?.toJson(),
      's23SoilPreparationSteps': s23SoilPreparationSteps?.toJson(),
      'hS23owToPlantInTheLastProductionYears': hS23owToPlantInTheLastProductionYears?.toJson(),
      's241': s241?.toJson(),
      's242': s242?.toJson(),
      's243': s243?.toJson(),
      's244': s244?.toJson(),
      's245': s245?.toJson(),
      'caseOfGivingWaters': caseOfGivingWaters?.toJson(),
      'caseOfApplyingFertilizers': caseOfApplyingFertilizers?.toJson(),
      'caseKillWeeds': caseKillWeeds?.toJson(),
      's254532': s254532?.toJson(),
      's224541': s224541?.toJson(),
      's224542': s224542?.toJson(),
      's251': s251?.toJson(),
      's252': s252?.toJson(),
      's253': s253?.toJson(),
      's254': s254?.toJson(),
      's255': s255?.toJson(),
      's256': s256?.toJson(),
      's260': s260?.toJson(),
    };
  }

  factory Section2MapModel.fromJson(Map<String, dynamic> json) {
    return Section2MapModel(
      selectedRiceField: RiceFieldModel.fromJson(json['selectedRiceField']),
      s211: S211.fromJson(json['s211']),
      s212: S212.fromJson(json['s212']),
      s213: S213.fromJson(json['s213']),
      s214: S214.fromJson(json['s214']),
      s215: S215.fromJson(json['s215']),
      s221: S221.fromJson(json['s221']),
      s222: S222.fromJson(json['s222']),
      s223: S223.fromJson(json['s223']),
      s224: S224.fromJson(json['s224']),
      s225: S225.fromJson(json['s225']),
      s226: S226.fromJson(json['s226']),
      s231: S231.fromJson(json['s231']),
      s232: S232.fromJson(json['s232']),
      s23SoilPreparationSteps: S23SoilPreparationSteps.fromJson(json['s23SoilPreparationSteps']),
      hS23owToPlantInTheLastProductionYears: HS23owToPlantInTheLastProductionYears.fromJson(json['hS23owToPlantInTheLastProductionYears']),
      s241: S241.fromJson(json['s241']),
      s242: S242.fromJson(json['s242']),
      s243: S243.fromJson(json['s243']),
      s244: S244.fromJson(json['s244']),
      s245: S245.fromJson(json['s245']),
      caseOfGivingWaters: CaseOfGivingWaters.fromJson(json['caseOfGivingWaters']),
      caseOfApplyingFertilizers: CaseOfApplyingFertilizers.fromJson(json['caseOfApplyingFertilizers']),
      caseKillWeeds: CaseKillWeeds.fromJson(json['caseKillWeeds']),
      s254532: S254532.fromJson(json['s254532']),
      s224541: S224541.fromJson(json['s224541']),
      s224542: S224542.fromJson(json['s224542']),
      s251: S251.fromJson(json['s251']),
      s252: S252.fromJson(json['s252']),
      s253: S253.fromJson(json['s253']),
      s254: S254.fromJson(json['s254']),
      s255: S255.fromJson(json['s255']),
      s256: S256.fromJson(json['s256']),
      s260: S260.fromJson(json['s260']),
    );
  }





}