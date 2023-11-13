#create private registry
docker run -d -p 5000:5000 --restart=always --name mon-registry registry:2
cd Projet-nuage-micro/api/cart
#Build image
docker build -t cart .
#Tag image
docker tag cart localhost:5000/cart
#Push image in the registry
docker push localhost:5000/cart
#Visualize image in registry
#curl -X GET http://localhost:5000/v2/_catalog