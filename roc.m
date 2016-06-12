clear all
close all
clc

load fisheriris
pred = meas(51:end,1:2);
resp = (1:100)'>50;  % Versicolor = 0, virginica = 1
mdl = fitglm(pred,resp,'Distribution','binomial','Link','logit');
scores = mdl.Fitted.Probability;
[X,Y,T,AUC] = perfcurve(species(51:end,:),scores,'virginica');
plot(X,Y);




% load ionosphere
% 
% resp = strcmp(Y,'b'); % resp = 1, if Y = 'b', or 0 if Y = 'g'
% pred = X(:,3:34);
% 
% mdl = fitglm(pred,resp,'Distribution','binomial','Link','logit');
% score_log = mdl.Fitted.Probability; % Probability estimates
% 
% [Xlog,Ylog,Tlog,AUClog] = perfcurve(resp,score_log,'true');
% 
% mdlSVM = fitcsvm(pred,resp,'Standardize',true);
% 
% mdlSVM = fitPosterior(mdlSVM);
% [~,score_svm] = resubPredict(mdlSVM);
% 
% [Xsvm,Ysvm,Tsvm,AUCsvm] = perfcurve(resp,score_svm(:,mdlSVM.ClassNames),'true');
% 
% mdlNB = fitcnb(pred,resp);
% 
% [~,score_nb] = resubPredict(mdlNB);
% 
% [Xnb,Ynb,Tnb,AUCnb] = perfcurve(resp,score_nb(:,mdlNB.ClassNames),'true');
% 
% plot(Xlog,Ylog)
% hold on
% plot(Xsvm,Ysvm)
% plot(Xnb,Ynb)
% legend('Logistic Regression','Support Vector Machines','Naive Bayes','Location','Best')
% xlabel('False positive rate'); ylabel('True positive rate');
% title('ROC Curves for Logistic Regression, SVM, and Naive Bayes Classification')
% hold off