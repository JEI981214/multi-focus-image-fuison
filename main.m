% Yuchan Jie , Xiaosong Li, et al.Multi-depth-of-field Full-Field optical angiography image fusion based on NSCT and CSF

close all
clear
clc
tic

M1=imread('lytro-03-A.jpg');
M2=imread('lytro-03-B.jpg');
D=cell2mat(struct2cell(load('D3.mat')));  %
f1 = im2double(M1);    f2 = im2double(M2);    

tic
if size(f1,3)==1                            
    Y = NSCT_fusion3(f1,f2,D);                 
else
    Y = zeros(size(f1));
    for i=1:3
        Y(:,:,i) =  NSCT_fusion3(f1(:,:,i),f2(:,:,i),D);    
    end  
end
toc

figure,imshow(Y,'border','tight')




