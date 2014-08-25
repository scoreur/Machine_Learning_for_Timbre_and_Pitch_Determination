X = [];
y = [];
for i=0:87
   file1 = ['piano_feat_',num2str(i),'.txt'];
   x_i = load(file1);
   X = [X; x_i];
   y = [y; 1];
end
save training_data X y