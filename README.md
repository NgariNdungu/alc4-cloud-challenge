## The challenge
*To Deploy a React Application using Docker and Google Cloud Platform*

## The set-up
### Development
This project is set up for development with docker.
Unless you're copying over a pre-existing app(with node_modules) you'll need to first install dependencies:
```
docker-compose run app yarn install
```
Then run the local development server:
```
docker-compose up
```
Your app will be served on http://localhost:3030.

The `./app` folder contains the actual code for the application.
It's the same(almost) boilerplate you get by running `create-react-app`.
The folder is mounted as a volume, so you can create your app using your local editor and see the changes live.

### 'Production'
To package your *done* application:
```
docker build . -t [your]:[tag]
```
The resultant image is built off of `nginx`, and is devoid of all node/react dependencies.
Test that the image was built properly with:
```
docker run -it --rm -p 8080:80 [your]:[tag]
```
Then check that your app runs properly by visiting http://localhost:8080

### Deployment [WIP]
Push the built image to a registry(dockerhub):
``` bash
docker login
docker tag [your]:[tag] [username]/[repo]:[tag]
docker push username/[your]:[tag]
```
Create the [deployment](deploy/alc4_deployment.yaml) and [service](deploy/alc4_lb.yaml) configs.
Then do stuff:
```
gcloud projects list
gcloud config set project [project_name]
gcloud clusters list
gcloud container clusters create alc4 --zone=us-central1-a \
  --machine-type=g1-small \
  --enable-autoscaling --min-nodes=1 --max-nodes=6 \
  --cluster-version=1.14.6-gke.13
kubectl diff -f deploy.yaml
kubectl apply -f deploy.yaml
kubectl get pods -owide
kubectl diff -f lb.yaml
kubectl apply -f lb.yaml
kubectl get svc -owide
```
http://35.188.176.49/

## Local Docker installation not working?
Problem yes, but no problem! With your google cloud account, you have access to the *cloudshell* which has everything you need.
And the best part? Blazing fast internet!

I'll assume you already know how to get to your cloudshell terminal.
```
git clone https://github.com/NgariNdungu/alc4-cloud-challenge.git app
cd app/
docker-compose run app yarn install
docker-compose up
```
Then on the cloudshell nav bar, click on the `Web Preview` button -> `Change port`; type 3030 for the port number then click on `Change and Preview`.
And be amazed... or not.

Launch the `Code Editor` and create away.
Like on local, the page will be reloaded when you save your code.
Don't be put down by having to edit code on the cloud. The editor is quite good.
You get out of the box code suggestion and completion, plus auto-save if you swing that way!
