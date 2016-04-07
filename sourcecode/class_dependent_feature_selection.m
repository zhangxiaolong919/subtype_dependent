function [gene_subsets] = class_dependent_feature_selection(samples, dis_data, labels, selector)
% conducting class dependent feature selection
% (Input): sample: training data; labels: data label; dis_data: discritized training set for mutual information calculation
% (Output): gene_subsets: return gene subsets for each tumor subtype

label_set = unique(labels); %column vector
n_labels = length(label_set);

gene_subsets = cell(n_labels, 1);

if selector == 1 %FCBF
    for i = 1:n_labels
        coded_label = label_coding(labels, label_set(i));
        tic;
        selected_f = feature_selection(samples, dis_data, coded_label, selector); %апоРа©
        sel_time(i) = toc;
        gene_subsets{i}.genes = selected_f;
        gene_subsets{i}.label = label_set(i);
    end
    
elseif selector == 2 %mRMR
    for i = 1:n_labels
        coded_label = label_coding(labels, label_set(i));
        selected_f = feature_selection(samples, dis_data, coded_label, selector);
        gene_subsets{i}.genes = selected_f;
        gene_subsets{i}.label = label_set(i);
    end
    
elseif selector == 3 %Fisher score
    for i = 1:n_labels 
        coded_label = label_coding(labels, label_set(i));
        selected_f= feature_selection(samples, dis_data, coded_label, selector);
        gene_subsets{i}.genes = selected_f; 
        gene_subsets{i}.label = label_set(i); 
    end
end

end
