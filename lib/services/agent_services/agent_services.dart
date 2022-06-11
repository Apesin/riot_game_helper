import 'package:http/http.dart' as http;
import 'package:riot_helper/services/base_api_service/base_service.dart';
import '../../models/agent_list_model.dart';

class AgentServices extends BaseService {
  Future<AgentListModel>getAgentList() async {
    return await responseHandle(
      request: () async {
        return await http.post(getUriParseUrl(path: getAgentListPath));
      },
      callBackSuccess: (response) {
        return agentListModelFromJson(response.body);
      },
    );
  }
}
