# blue-green-deployment
Terraform blue green deployment for app at https://github.com/ashishth09/cf-python-app

Checkout the following tags to perform incremental deployment.
 * blue - This is for the deployment of the first version of the app. App is accessible at say route-original
 * green - This is for the deployment of the second version of the app. App is accessible at say route-green
 * blue-green-lb - This is when blue and green are load balanced. Green is accessible at route-original and route-green
 * green-only-with-2-routes - Blue is no more accessible. Green continues to be accessible at two routes
 * green-original-route-only - Green is accessible only at route-original. Blue continues to be in-accessible
 
 
