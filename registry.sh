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

#Config and install kub with ansible and roles
mkdir ansible-kub
mkdir ansible-kub/roles
cd ansible-kub/roles
ansible-galaxy init ec2
ansible-galaxy init k8s_master
ansible-galaxy init k8s_slave
chmod 400 ansible.pem