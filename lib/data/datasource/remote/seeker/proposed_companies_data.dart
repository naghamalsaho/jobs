import 'package:jobs/api_link.dart';
import 'package:jobs/core/class/crud.dart';

class ProposedCompaniesData {
  Crud crud;
 ProposedCompaniesData(this.crud);

  getProposedCompaniesData() async {
    var response = await crud.getData(AppLink.proposedCompanies);
   return response.fold ((l)=> l , (r)=> r);
  }


  
}
