function [final_features] = opt_selection(samples, labels, selected_features)
%% determine the optimal feature subset
   len = length(selected_features);
   cvs = zeros(1, len);
   
   for i = 1:len
       idx = selected_features(1:i);
       cvs(i) = svm_cv(double(samples(:, idx)), double(labels));
   end
   
   [~, index] = max(cvs);
   
   final_features = selected_features(1:index);
end
