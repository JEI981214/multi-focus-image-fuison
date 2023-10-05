function fused_result=NSCT_fusion3(f1,f2,D)
y1=nsctdec(f1,[1,1,1,1],'vk','pyrexc');  
y2=nsctdec(f2,[1,1,1,1],'vk','pyrexc');
[r,s]=size(f1);
%% lowpass fusion
overlap = 6;                    
epsilon=0.1;
y{1,1}=sparse_fusion(y1{1,1},y2{1,1},D,overlap,epsilon)
% figure,imshow(y1{1,1},'border','tight');
% figure,imshow(y2{1,1},'border','tight');
% figure,imshow(y{1,1},'border','tight');

%% highpass fusion
for m=2:length(y1)
   for n=1:length(y1{m})     
       y{m}{n}=high_fusion3(y1{m}{n},y2{m}{n});   
   end 
end

fused_result=nsscrec(y,'vk','pyrexc');




