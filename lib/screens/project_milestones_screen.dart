import 'package:android/controller/ProjectController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProjectMilestonesScreen extends StatefulWidget {
  final bool isOwner = true;
  const ProjectMilestonesScreen({
    Key? key,
    isOwner,
  }) : super(key: key);

  @override
  State<ProjectMilestonesScreen> createState() =>
      _ProjectMilestonesScreenState();
}

class _ProjectMilestonesScreenState extends State<ProjectMilestonesScreen> {
  final ProjectController projectController = Get.put(ProjectController());
  int _currentStep = 0;
  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: 280,
        child:  Stepper(
            currentStep: _currentStep,
          onStepContinue: () {

          },
          onStepCancel: () {

          },
            onStepTapped: (int value ){
              setState(() {
                _currentStep = value;
              });
            },
          controlsBuilder: (BuildContext ctx, ControlsDetails dtl){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Visibility(
                  visible: widget.isOwner,
                  child: TextButton(
                    onPressed: dtl.onStepCancel,
                    child: Text('CANCEL'),
                  ),
                ),
                Visibility(
                  visible: widget.isOwner,
                  child: TextButton(
                    onPressed: dtl.onStepContinue,
                    child: Text('NEXT'),
                  ),
                ),
              ],
            );
          },
            steps:  [
              Step(
                title: Text('Idea'),
                content: Text('Lên ý tưởng'),
                isActive: projectController.milestone.value >=0,
                state: projectController.milestone.value >=0 ? StepState.complete :StepState.indexed
              ),
              Step(
                title: Text('Upcoming'),
                content: Text('Tìm kiếm tài năng gánh team'),
                  isActive: projectController.milestone.value >=1,
                  state: projectController.milestone.value >=1 ? StepState.complete :StepState.indexed
              ),
              Step(
                title: Text('Launching'),
                content: Text('Deploy lên các nền tảng'),
                  isActive: projectController.milestone.value >=2,
                  state: projectController.milestone.value >=2 ? StepState.complete :StepState.indexed
              ),
              Step(
                title: Text('Finishing'),
                content: Text('Hết tiền, phá sản, nghỉ'),
                  isActive: projectController.milestone.value >=3,
                  state: projectController.milestone.value >=3 ? StepState.complete :StepState.indexed
              )
            ]
          ),
      ),
    );
  }
}

