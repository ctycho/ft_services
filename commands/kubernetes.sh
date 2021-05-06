#!/bin/bash

brew install minikube
rm -rf .minikube
mkdir .minikube
mv .minikube ./goinfre
ln -s ./goinfre/.minikube .minikube
minikube start --vm-driver=virtualbox
