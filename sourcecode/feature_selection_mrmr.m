function [final_features] = feature_selection_mrmr(samples, dis_data, labels)

   selected_features = mrmr_mid_d(dis_data, double(labels), 50)'; 
   
   final_features = opt_selection(samples, labels, selected_features); 
   
end
