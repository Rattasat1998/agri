import 'package:agri/screens/profile/pages/agri_information/models/rice_field_model.dart';

class Section2DataModel {
  List<RiceFieldModel> riceFieldModel;

  Section2DataModel({
     this.riceFieldModel = const [],
  });

  static List<RiceFieldModel>  datas = <RiceFieldModel>[];

  factory Section2DataModel.fromJson(Map<String, dynamic> json) {
    return Section2DataModel(
      riceFieldModel: List<RiceFieldModel>.from(json['riceFieldModel'].map((x) => RiceFieldModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'riceFieldModel': List<dynamic>.from(riceFieldModel.map((x) => x.toJson())),
    };
  }

}
