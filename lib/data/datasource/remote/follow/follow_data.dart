import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class FollowData {
 late Crud crud;
  FollowData(this.crud);
 toggleFollowUser(int id) async {
  var response = await crud.getData('${AppLink.follow}/$id');
    return response.fold ((l)=> l , (r)=> r);
}

  getFollowings(int id) async {
  var response = await crud.getData('${AppLink.followings}/$id');
   return response.fold ((l)=> l , (r)=> r);
}


 getFollowers(int id) async {
  var response = await crud.getData('${AppLink.followers}/$id');
  return response.fold ((l)=> l , (r)=> r);
}

}
