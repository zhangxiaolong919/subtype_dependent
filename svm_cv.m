function [cost] = svm_cv(data, label)
%% Leave One Out Cross Validation
   nSamples = length(label);

   cmd = ['-v ',num2str(nSamples), ' -t 0',' -c 1'];

   cost = svmtrain(label, data, cmd);
end
