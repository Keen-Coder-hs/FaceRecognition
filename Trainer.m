clc
clear all
close all
warning off
g=alexnet;
layers=g.Layers;
layers(23)=fullyConnectedLayer(2);
layers(25)=classificationLayer;
allImages=imageDatastore('database','IncludeSubfolders',true, 'LabelSource','foldernames');
opts=trainingOptions('sgdm','InitialLearnRate',0.001,'MaxEpochs',20,'MiniBatchSize',64);
myNet=trainNetwork(allImages,layers,opts);
save myNet;