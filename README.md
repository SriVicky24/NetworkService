# NetworkService
Network Service layer. 

Service is encomposed with Operations, Request, Response, Router and Task files
Encoding is encomposed with JSONParameter Encoding 

Endpoints for the application is created by confirming to Request protocol.

Construct AppNetworkManager which confirms to Router protocol to execute network request for the application.

Sample Network Manager
struct AppNetworkManager {

  let rotuer = Router<UserApi>()
  
  func signInUser(with bodyDict : [String : Any], completion : @escaping(ServerResponse<User>?, _ error : String?) -> throws)      {
  do {
     router.execute()
  }
  catch {
  }
}
