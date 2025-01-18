import 'package:json_annotation/json_annotation.dart';


part 'catagory_model.g.dart';

@JsonSerializable()
class CatagoryModel {
    @JsonKey(name: "status")
    final String? status;
    @JsonKey(name: "message")
    final String? message;
    @JsonKey(name: "categories")
    final List<String>? categories;

    CatagoryModel({
        this.status,
        this.message,
        this.categories,
        
    });

    factory CatagoryModel.fromJson(Map<String, dynamic> json) => _$CatagoryModelFromJson(json);

    Map<String, dynamic> toJson() => _$CatagoryModelToJson(this);
}
