import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs/api_link.dart';
import 'package:jobs/controller/company_seeker/drawer_controller.dart';
import 'package:jobs/controller/company_seeker/get_user_controller.dart';
import 'package:jobs/controller/seeker/get_proposed_controller.dart';
import 'package:jobs/core/class/handlingdataview.dart';
import 'package:jobs/core/constants/color.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/data/model/proposed_company_model.dart';
import 'package:jobs/view/screen/company&seeker/drawer.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/app_bar_home.dart';
import 'package:jobs/view/widget/company&seeker/home_widgets/job_card_home.dart';

class ProposedPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Get.put(GetProposedControllerImp());
    final controllerDrawer = Get.put(CustomDrawerController());
    final profileController = Get.put(GetUserController());

    return GetBuilder<GetProposedControllerImp>(
      builder: (controller) => Scaffold(
        backgroundColor: AppColor.Backgroundcolor(),
          endDrawer: CustomDrawer(),
          key: _scaffoldKey,
          body: ListView(children: [
            AppBarHome(
              onPressedDrawer: () {
                _scaffoldKey.currentState!.openEndDrawer();
                controllerDrawer.toggleDrawer();
              },
              onPressedSearch: () {
                Get.toNamed(AppRoute.searchPage);
              },
              text: "157".tr,
            ),
            TitleOpportunitiesHome(
              title: "158".tr,
             viewall: false,
            ),
            SizedBox(
                height: 195,
                child: 
                 HandlingDataView(
                              statusRequest: controller.statusRequestproposedJobs,
                              widget:
                ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.ProposedJobsList.length,
                    itemBuilder: (context, index) {
                      return JobCardHome(
                        onTapGoToProfile: () {
                          profileController.getUser(
                              controller.ProposedJobsList[index].user_id!);
                        },
                        opportuntiyModel: controller.ProposedJobsList[index],
                        onPressed: () {
                          controller.goToPageOpportunityDetails(
                              controller.ProposedJobsList[index]);
                        },
                      );
                    }))),
            TitleOpportunitiesHome(
              title: "159".tr,
           viewall: false,
            ),
          
           HandlingDataView(
                              statusRequest: controller.statusRequestProposedCompanies,
                              widget:
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // عدد الأعمدة في الشبكة
                childAspectRatio: 0.75, // نسبة عرض العناصر إلى ارتفاعها
                crossAxisSpacing: 1, // المسافة بين الأعمدة
                mainAxisSpacing: 1, // المسافة بين الصفوف
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.proposedCompaniesList.length,
              itemBuilder: (context, index) {
                final company = controller.proposedCompaniesList[index];

                return CompanyCard(
                  company: company,
                  onPressed: () {
                    profileController.getUser(company.user_id!);
                  },
                );
              },
            ),),
          ])),
    );
  }
}

class CompanyCard extends StatelessWidget {
  final ProposedCompanyModel company;
  final void Function()? onPressed;
  final void Function()? onPressedFollow;
  const CompanyCard(
      {Key? key, required this.company, this.onPressed, this.onPressedFollow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColor.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage:
                 company.logo != null ?  NetworkImage("${AppLink.serverimage}/${company.logo}"):null,
              radius: 32,
            ),
            SizedBox(height: 5),
            Text(
              company.company_name!,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
            company.domain!.length> 20 ? "${company.domain!.substring(0,18)}" :company.domain!,
              textAlign: TextAlign.center,
              selectionColor: AppColor.pink,
            ),
            SizedBox(height: 2),
            ElevatedButton(
              onPressed: onPressed,
              child: Text("204".tr),
            ),
          ],
        ),
      ),
    );
  }
}
