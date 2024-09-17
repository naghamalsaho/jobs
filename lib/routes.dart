import 'package:get/get.dart';
import 'package:jobs/core/constants/routes.dart';
import 'package:jobs/core/middleware/mymiddleware.dart';
import 'package:jobs/view/screen/apply/all_applies_company.dart';
import 'package:jobs/view/screen/apply/apply_cv.dart';
import 'package:jobs/view/screen/apply/my_applies_seeker.dart';
import 'package:jobs/view/screen/apply/update_apply_cv.dart';
import 'package:jobs/view/screen/auth/splash.dart';
import 'package:jobs/view/screen/company&seeker/all_opportunities.dart';
import 'package:jobs/view/screen/company&seeker/all_posts.dart';
import 'package:jobs/view/screen/company&seeker/notifications.dart';
import 'package:jobs/view/screen/company&seeker/opportunity.dart';
import 'package:jobs/view/screen/company&seeker/save_page.dart';
import 'package:jobs/view/screen/company&seeker/search.dart';
import 'package:jobs/view/screen/company/main_screens/home_company.dart';
import 'package:jobs/view/screen/company/main_screens/main_screen_company.dart';
import 'package:jobs/view/screen/company/opportunity/add_opportunity.dart';
import 'package:jobs/view/screen/company/opportunity/edit_opportunity.dart';
import 'package:jobs/view/screen/company/profile_company/create_company.dart';
import 'package:jobs/view/screen/company/profile_company/edit_company.dart';
import 'package:jobs/view/screen/others_profiles/companies_profile.dart';
import 'package:jobs/view/screen/others_profiles/seekers_profile.dart';
import 'package:jobs/view/screen/seeker/cv/create_cv.dart';
import 'package:jobs/view/screen/seeker/main_screens/main_screen.dart';
import 'package:jobs/view/screen/seeker/post/create_post.dart';
import 'package:jobs/view/screen/seeker/post/edit_post.dart';
import 'package:jobs/view/screen/seeker/profile/create_profile.dart';
import 'package:jobs/view/screen/seeker/profile/edit_profile.dart';
import 'package:jobs/view/screen/seeker/main_screens/proposed_page.dart';
import 'package:jobs/view/screen/settings_pages/account_settings.dart';
import 'package:jobs/view/screen/settings_pages/change_password.dart';
import 'package:jobs/view/screen/settings_pages/check_password.dart';
import 'package:jobs/view/screen/settings_pages/deletAccount.dart';
import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'view/screen/auth/forgetpassword/verfiycode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_signup.dart';
import 'view/screen/auth/verifycode_register.dart';
import 'view/screen/on_boarding/onboarding.dart';

List<GetPage<dynamic>>? routes = [
  //splash
  GetPage(
      name: "/splash",
      page: () => const SplashPage(),
      middlewares: [MyMiddleWare()]),

  //OnBoarding
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoute.verfiyCodeForgetpassword, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => SuccessSignUp()),
  GetPage(
      name: AppRoute.verifyCodeRegister,
      page: () => const VerifyCodeRegister()),
//seeker_profile
  GetPage(name: AppRoute.createProfile, page: () => const CreateProfilePage()),
  GetPage(name: AppRoute.editProfile, page: () => const EditProfilePage()),
  // GetPage(name: AppRoute.profilePage, page: () => const ProfilePage()),
  //seeker_mainscreens
  GetPage(name: AppRoute.mainScreens, page: () => const MainScreens()),
  GetPage(name: AppRoute.postpage, page: () => PostPage()),
  GetPage(name: AppRoute.editpostpage, page: () => EditPostPage()),
 
   GetPage(name: AppRoute.proposedPage, page: () => ProposedPage()),
   GetPage(name: AppRoute.createCV, page: () => CreateCV()),



  //company_profile
  GetPage(
      name: AppRoute.createcompanyProfile,
      page: () => CreateProfilePageCompany()),
  GetPage(
      name: AppRoute.editcompanyProfile,
      page: () => const EditProfilePageCompany()),
 // GetPage(name: AppRoute.companyprofilePage, page: () => ProfilecompanyPage()),
  GetPage(
      name: AppRoute.addOpportunity,
      page: () => const AddJobOpportunityScreen()),
  GetPage(
      name: AppRoute.editOpportunity,
      page: () => const EditJobOpportunityScreen()),
  //company_mainscreens
  GetPage(
      name: AppRoute.mainScreensCompany,
      page: () => const MainScreensCompany()),
  GetPage(name: AppRoute.homeCompany, page: () => CompanyHome()),
  GetPage(name: AppRoute.savedJobs, page: () => JobSavedScreen()),

  //settings

  GetPage(name: AppRoute.accountSettings, page: () => AccountSettingsScreen()),

  GetPage(name: AppRoute.checkPassword, page: () => CheckPassword()),
  GetPage(name: AppRoute.changePassword, page: () => ChangePassword()),
  GetPage(name: AppRoute.deleteAccount, page: () => DeleteAccountPage()),

  //company&seeker
  GetPage(name: AppRoute.opportunityPage, page: () => const OpportunityPage()),
  GetPage(
      name: AppRoute.allOpportunityPage, page: () => AllOpportunitiesPage()),
  GetPage(name: AppRoute.allPostPage, page: () => AllPostPage()),

  //apply
  GetPage(name: AppRoute.appliesSeeker, page: () => AppliesSeeker()),
  GetPage(name: AppRoute.allAppliesCompany, page: () => AllAppliesCompany()),
  GetPage(name: AppRoute.applyCV, page: () => ApplyCV()),
  GetPage(name: AppRoute.updateApplyCV, page: () => UpdateApplyCV()),

  GetPage(name: AppRoute.notifications, page: () => NotificationPage()),



  GetPage(name: AppRoute.searchPage, page: () => SearchScreen()),

  GetPage(
    name: AppRoute.seekerProfiles,
    page: () => SeekerProfiles(),
  ),
  GetPage(
    name: AppRoute.companyProfiles,
    page: () => ProfileCompanies(),
  ),
];
