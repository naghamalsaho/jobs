class AppLink {
  static const String serverimage = "http://192.168.139.152:8000";
  static const String server = "$serverimage/api";

  //auth Link ***********************
  static const String signup = "$server/register";
  static const String verifycoderegister = "$server/verifyAccount";
  static const String login = "$server/login";
  static const String reSendCode = "$server/sendCode";
  static const String device_token = '$server/device_token';

  // Forget Password ****************
  static const String checkemail = "$server/forgotPassword";
  static const String verifycodeforgetpassword = "$server/checkCode";
  static const String resetPassword = "$server/rePassword";
  // *******************settings***********************
  // Change Password ****************
  static const String changepassword = "$server/resetPassword";
  static const String checkPassword = "$server/checkPassword";
  //logout
  static const String logout = "$server/logout";
  //delete Account
  static const String deleteaccount = "$server/delete";

  // Seeker Profile
  static const String createprofile = "$server/seeker/create";
  static const String updateprofile = "$server/seeker/update";
  // seeker post
  static const String createPost = "$server/post/create";
  static const String editPost = "$server/post/edit";
  static const String deletePost = "$server/post/delete";
  static const String deleteImage = "$server/post/deleteImage";
  static const String deleteFile = "$server/post/deleteFile";

  // apply
  static const String apply = "$server/apply";
  static const String updateApply = "$server/apply/update";
  static const String getMyAppliesSeeker = "$server/apply/getMyApplies";

  static const String getAppliesCompany = "$server/apply/getApplies";
  static const String deleteApply = "$server/apply/delete";
  static const String updateStatusApply = "$server/apply/updateStatus";

  // save opportunity
  static const String saveOpportunity = "$server/save";
  static const String getSavedOpportunity = "$server/getSave";
  // CV
  static const String createCV = "$server/seeker/createCV";
  // Company Profile
  static const String createcompanyprofile = "$server/company/create";
  static const String updatecompanyprofile = "$server/company/update";

  //post an opportunity
  static const String addOpportunity =
      "$server/company/opportunity/addOpportunity";
  static const String updateOpportunity =
      "$server/company/opportunity/updateOpportunity";
  static const String deleteOpportunity = "$server/company/opportunity/delete";

  // *************Seeker &  Company***************//
  static const String allOpportunities = "$server/allOpportunities";
  static const String viewPost = "$server/allPosts";
  static const String getNews = "$server/admin/news/getNews";

  // report
  static const String reportUser = "$server/report/reportUser";
  static const String reportOpportunity = "$server/report/reportOpportunity";
  static const String reportPost = "$server/report/reportPost";

  // notification
  static const String teststore = "$server/testStore";
  static const String display = "$server/notification/display";
  static const String deletenotification = "$server/notification/delete";
  static const String getcontent = "$server/notification/getContent";
  static const String makeRead = "$server/notification/makeRead";

  //follow
  static const String follow = "$server/follow";
  static const String followings = "$server/followings";
  static const String followers = "$server/followers";

  // get user
  static const String getUser = "$server/user";

  //search
  static const String searchPath = '$server/search';

  // proposed_Companies
  static const String proposedCompanies = '$server/proposed_Companies';
  // proposed_Jobs
  static const String proposedJobs = '$server/proposed_Jobs';
}
