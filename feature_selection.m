function [selected_features] = feature_selection(samples, dis_data, labels, selector)
% feature selection various baseline feature selector
% (Input) samples: training set; dis_data: discritized data of training
% set; labels: labels associated with training set; selector: to indicate
% use which baseline feature selector
% (Output): obtained feature subset

if selector == 1 %FCBF
    selected_features = feature_selection_fcbf(dis_data, labels);
    
elseif selector == 2 %mRMR
    selected_features = feature_selection_mrmr(samples, dis_data, labels);
     
elseif selector == 3 %Fisher score
    selected_features = feature_selection_fisher(samples, labels);
end

end
