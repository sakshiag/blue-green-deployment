# blue-green-deployment
Terraform blue green deployment for app at https://github.com/ashishth09/cf-python-app

Checkout the following tags to perform incremental deployment.
 * blue - This is for the deployment of the first version of the app. App is accessible at https://my-welcome-app.mybluemix.net
 * green - This is for the deployment of the second version of the app. App is accessible at say https://my-welcome-app-temp.mybluemix.net
 * blue-green-lb - This is when blue and green are load balanced. Green is accessible at https://my-welcome-app.mybluemix.net and https://my-welcome-app-temp.mybluemix.net
 * green-only-with-2-routes - Blue is no more accessible. Green continues to be accessible at two routes
 * green-original-route-only - Green is accessible only at https://my-welcome-app.mybluemix.net. Blue continues to be in-accessible
 
 
