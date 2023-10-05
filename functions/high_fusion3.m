function  fused_high2=high_fusion3(high1,high2);
[row,column]=size(high1);  
%%
SF1=SF(high1);
SF2=SF(high2);
temp1=Loc_Contrast(SF2,SF1); temp2=Loc_Contrast(SF1,SF2);
% figure,imshow(temp1,[-0.75,0.75],'border','tight');
% figure,imshow(temp2,[-0.75,0.75],'border','tight');
map1=temp1>temp2; map2=temp2>temp1;
% figure,imshow(map1,[],'border','tight');
% figure,imshow(map2,[],'border','tight');

%% 形态学滤波 
ratio=0.05;   % 消除面积占比 
area=ceil(ratio*row*column);
tempMap1=bwareaopen(map1,area);
tempMap2=1-tempMap1;
tempMap3=bwareaopen(tempMap2,area);
midmap1=1-tempMap3;
midmap2=imcomplement(midmap1); 
% figure,imshow(midmap1,'border','tight');    figure,imshow(midmap2,'border','tight');

%% 一致性验证，消除孤立的小区域
window_size=59;  % 若参数验证，7*7,13*13,19*19,25*25,27*27,31*31等， 一致性验证太小容易在决策图中出现小孔洞。
finalmap1 = majority_consist_new(midmap1,window_size);
finalmap2 = majority_consist_new(midmap2,window_size);
% figure,imshow(finalmap1,'border','tight');   figure,imshow(finalmap2,'border','tight');    % 最终决策图显示

fused_high2=finalmap1.*high1+finalmap2.*high2;