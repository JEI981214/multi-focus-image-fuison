function cp=Difference(A,B)
[row,column]=size(A);
D=abs(A-B);
window_wide=3;
spread=(window_wide-1)/2;
temp=padarray(D,[spread spread],'symmetric');   % ��ͼ��D���о�������չ
for i=1:row
    for j=1:column
        window=temp(i:1:(i+2*spread),j:1:(j+2*spread));
        cp(i,j)=sum(window(:));
    end
end