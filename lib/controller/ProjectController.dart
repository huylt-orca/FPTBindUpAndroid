import 'package:android/models/Project.dart';
import 'package:android/models/ProjectImage.dart';
import 'package:android/models/Topic.dart';
import 'package:get/get.dart';

import '../models/User.dart';


class ProjectController extends GetxController{
    RxString id = "".obs;
    RxString name = "".obs;
    RxString logo = "".obs;
    RxString summary = "".obs;
    RxString description = "".obs;
    RxInt voteQuantity = 0.obs;
    RxInt milestone = 0.obs;
    RxString status = "".obs;
    RxString source = "".obs;

    RxList<ProjectImage> images = List<ProjectImage>.empty(growable: true).obs;
    RxList<ProjectImage> mentors = List<ProjectImage>.empty(growable: true).obs;
    RxList<ProjectImage> members = List<ProjectImage>.empty(growable: true).obs;
    RxList<ProjectImage> jobs = List<ProjectImage>.empty(growable: true).obs;
    RxList<ProjectImage> applications = List<ProjectImage>.empty(growable: true).obs;
    RxList<ProjectImage> changelogs = List<ProjectImage>.empty(growable: true).obs;
    RxList<Topic> topics = List<Topic>.empty(growable: true).obs;

    var founder = User().obs;


    void AddProject(Project project){
      this.id = RxString(project.id!);
      this.description = RxString(project.description!) ;
      this.logo = RxString(project.logo!);
      this.milestone = RxInt(project.milestone!);
      this.name = RxString(project.name!);
      this.source = RxString(project.source!) ;
      this.status = RxString(project.status!) ;
      this.summary = RxString(project.summary!);
      this.voteQuantity = RxInt(project.voteQuantity!);
    }

    void AddListImage(List<ProjectImage> images){
      this.images.clear();
      this.images.addAll(images);
    }

}