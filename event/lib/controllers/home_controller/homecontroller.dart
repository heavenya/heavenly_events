import 'package:event/utils/common_imports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  List headerList = [
    {
      "image": AppImages.header1,
      "subImage": AppImages.list1Image,
      "name": "Vance Corwin".tr,
      "min": "20 min ago".tr,
    },
    {
      "image": AppImages.header2,
      "subImage": AppImages.list2Image,
      "name": "Christina Perri".tr,
      "min": "30 min ago".tr,
    },
    {
      "image": AppImages.header3,
      "subImage": AppImages.list3Image,
      "name": "Ewa Farna".tr,
      "min": "40 min ago".tr,
    },
    {
      "image": AppImages.header4,
      "subImage": AppImages.list2Image,
      "name": "Vance Corwin".tr,
      "min": "50 min ago".tr,
    },
    {
      "image": AppImages.header6,
      "subImage": AppImages.list1Image,
      "name": "Ewa Farna".tr,
      "min": "2 hour ago".tr,
    },
    {
      "image": AppImages.header4,
      "subImage": AppImages.list3Image,
      "name": "Christina Perri".tr,
      "min": "4 hour ago".tr,
    },
  ];

  List subList = [
    {
      "id": 0,
      "image": AppImages.header2,
      "subImage": AppImages.list1Image,
      "name": "Vance Corwin".tr,
      "min": "20 min ago".tr,
      "fav": false,
    },
    {
      "id": 1,
      "image": AppImages.header6,
      "subImage": AppImages.list2Image,
      "name": "Christina Perri".tr,
      "min": "30 min ago".tr,
      "fav": false,
    },
    {
      "id": 2,
      "image": AppImages.header1,
      "subImage": AppImages.list3Image,
      "name": "Ewa Farna".tr,
      "min": "40 min ago".tr,
      "fav": false,
    },
    {
      "id": 3,
      "image": AppImages.header2,
      "subImage": AppImages.list1Image,
      "name": "Vance Corwin".tr,
      "min": "20 min ago".tr,
      "fav": false,
    },
    {
      "id": 4,
      "image": AppImages.header6,
      "subImage": AppImages.list2Image,
      "name": "Christina Perri".tr,
      "min": "30 min ago".tr,
      "fav": false,
    },
    {
      "id": 5,
      "image": AppImages.header1,
      "subImage": AppImages.list3Image,
      "name": "Ewa Farna".tr,
      "min": "40 min ago".tr,
      "fav": false,
    },
  ];

  void favIcon(int index) {
    if (subList[index]['id'] == index) {
      if (subList[index]['fav'] == false) {
        print("if");
        subList[index]['fav'] = true;
      } else {
        print("else");
        subList[index]['fav'] = false;
      }
      print("subList[index]['fav'] ${subList[index]['fav']}");
    } else {
      print("Else Else");
    }
    update(['list']);
  }

  var isArabic;
  lan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isArabic = prefs.getBool('isArabic') ?? false;

    update(['detail']);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    lan();
  }

  // int selectedIndex = 0;
  //
  // void onItemTapped(int index) {
  //   selectedIndex = index;
  //   update();
  // }
}
