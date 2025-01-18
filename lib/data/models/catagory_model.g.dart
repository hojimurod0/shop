// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catagory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CatagoryModel _$CatagoryModelFromJson(Map<String, dynamic> json) =>
    CatagoryModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CatagoryModelToJson(CatagoryModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'categories': instance.categories,
    };
