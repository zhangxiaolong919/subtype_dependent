function [coded_label] = label_coding(labels, label_target)
% label binalization
% code the label as 1 and 0
coded_label = (labels == label_target); 

end
