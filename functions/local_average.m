function cp=local_average(matrix,window_wide)

[row,column]=size(matrix);
cp=zeros(row,column);
spread=(window_wide-1)/2;
matrix_en=padarray(matrix,[spread spread],'symmetric');

for i=1:row
    for j=1:column
        window=matrix_en(i:1:(i+2*spread),j:1:(j+2*spread));
        cp(i,j)=(sum(window(:))./(window_wide.^2));
    end
end