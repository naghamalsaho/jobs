import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class ProposedJobsData {
  Crud crud ;
 ProposedJobsData(this.crud);

  getProposedJobsData() async {
    var response = await crud.getData(AppLink.proposedJobs);
   return response.fold ((l)=> l , (r)=> r);
  }
  
}
