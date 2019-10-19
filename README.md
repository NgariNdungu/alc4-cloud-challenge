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

