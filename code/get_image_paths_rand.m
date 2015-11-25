% Starter code prepared by James Hays

%This function returns cell arrays containing the file path for each train
%and test image, as well as cell arrays with the label of each train and
%test image. By default all four of these arrays will be 1500x1 where each
%entry is a char array (or string).
function [train_image_paths, test_image_paths, train_labels, test_labels] = ... 
    get_image_paths(data_path, categories, num_train_per_cat)

num_categories = length(categories); %number of scene categories.

%This paths for each training and test image. By default it will have 1500
%entries (15 categories * 100 training and test examples each)
r_c = randi([1 num_categories],1,10);
r_i = randi([1 num_train_per_cat],1,10);

train_image_paths = cell(length(r_c) * length(r_i),1);
test_image_paths  = cell(length(r_c) * length(r_i),1);

%The name of the category for each training and test image. With the
%default setup, these arrays will actually be the same, but they are built
%independently for clarity and ease of modification.
train_labels = cell(length(r_c) * length(r_i), 1);
test_labels  = cell(length(r_c) * length(r_i), 1);



for i=1:length(r_c)
   images = dir( fullfile(data_path, 'train', categories{r_c(i)}, '*.jpg'));
   for j=1:length(r_i)
       train_image_paths{(i-1)*length(r_i) + j} = fullfile(data_path, 'train', categories{r_c(i)}, images(r_i(j)).name);
       train_labels{(i-1)*length(r_i) + j} = categories{r_c(i)};
   end
   
   images = dir( fullfile(data_path, 'test', categories{r_c(i)}, '*.jpg'));
   for j=1:length(r_i)
       test_image_paths{(i-1)*length(r_i) + j} = fullfile(data_path, 'test', categories{r_c(i)}, images(r_i(j)).name);
       test_labels{(i-1)*length(r_i) + j} = categories{r_c(i)};
   end
end
