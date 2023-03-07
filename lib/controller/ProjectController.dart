import 'package:android/models/Project.dart';
import 'package:android/models/ProjectImage.dart';
import 'package:get/get.dart';


class ProjectController extends GetxController{
    RxString id = "".obs;
    RxString description = "".obs;
    RxString logo = "".obs;
    RxInt milestone = 0.obs;
    RxString name = "".obs;
    RxString source = "".obs;
    RxString status = "".obs;
    RxString summary = "".obs;
    RxInt voteQuantity = 0.obs;
    RxList<ProjectImage> images = List<ProjectImage>.empty(growable: true).obs;

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