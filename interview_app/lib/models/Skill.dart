import 'package:flutter/material.dart';

class Skill {
  TextEditingController? skillName = new TextEditingController();
	TextEditingController? skillType = new TextEditingController();
	TextEditingController? proficiencyLevel = new TextEditingController();
	TextEditingController? positionId = new TextEditingController();
	TextEditingController? registeredTime = new TextEditingController();
	TextEditingController? latestUpdatedTime = new TextEditingController();

  Skill({
  this.skillName,
	this.skillType,
	this.proficiencyLevel,
	this.positionId,
	this.registeredTime,
	this.latestUpdatedTime,
  });

 
}
