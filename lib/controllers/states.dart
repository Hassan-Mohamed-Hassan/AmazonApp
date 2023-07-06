import 'package:flutter/material.dart';

abstract class AmazonStates{}
class InitalAmazonStates extends AmazonStates{}
class ChangeModeAmazonStates extends AmazonStates{}
class LoadingAmazonStates extends AmazonStates{}
class SuccessAmazonStates extends AmazonStates{}
class ErrorAmazonStates extends AmazonStates{}
class MyState extends AmazonStates{
  final int tabIndex;
  final TabController tabController;
  MyState({this.tabIndex = 0, required this.tabController});
}