1;


  
 function [vecteurFinal] = probaApriori(X)
  vecteurFinal = zeros(10,1);
  for y = 0:9
    result = 0;
    for i = 1:length(X)
      z = X(i,1);
      if(z == y)
         %%printf('Test100\n');
        result=result+1;
      endif   
    endfor
    result = result/length(X);
    vecteurFinal(y+1,1)= result;
  end
endfunction 


function  [res] = vectMoyen(X,Y)
  
  
    for i = 0:9
      res(i+1,:) = mean(X(find(Y==i),:));
    end    
  
endfunction

function  [matCov] = matCov(X,Y)
  
  
    for i = 0:9
      matCov(i+1,:,:) = cov(X(find(Y==i),:));
    end    
  
endfunction

function [probCondi] = probCondi(B,A)

  %probCondi = e^-1/2(0-vectMoyen;

endfunction

function [mu,P] = acp (X, k)
  n=size(X,1);
  mu = mean(X);
  Xmu = X-ones(n,1)*mu;
  S = Xmu'*Xmu;
 [P evd] = eigs(S,k,'lm');
 ev = diag(evd);
 printf('%5.3f\n', sum(ev));
endfunction

% charger les données, effectuer une ACP pour une dimesion k données
% et sauvegarder le résultats dans un nouveau fichier

function [] = project_data (k)
  A=load('appr.ascii');

  [mu_all P] = acp(A,k);
  n = size(A,1);
  Ap = (A-ones(n,1)*mu_all) * P;  % ici on projète !
  save 'appr-acp.ascii' Ap

  A=load('dev.ascii');
  n = size(A,1);
  Ap = (A-ones(n,1)*mu_all) * P;
  save 'dev-acp.ascii' Ap

  A=load('eval.ascii');
  n = size(A,1);
  Ap = (A-ones(n,1)*mu_all) * P;
  save 'eval-acp.ascii' Ap
endfunction


function [res] = gaussienne(moyenne,covariance,img,k)
  for i = 0:9
    %p(i+1,:) = (1 ./ sqrt(2.*pi.*reshape(covariance(i+1,:,:),k,k)*(1/2))) .* e^((-1/2).*(img-moyenne(i+1,:))'.*(inv(reshape(covariance(i+1,:,:),k,k))).*(img - moyenne(i+1,:))); 
  end
  size((1 ./ sqrt(2.*pi.*reshape(covariance(1,:,:),k,k)*(1/2))) .* e^((-1/2).*(img-moyenne(1,:))'.*(inv(reshape(covariance(1,:,:),k,k))).*(img - moyenne(1,:))))
  (1 ./ sqrt(2.*pi.*reshape(covariance(1,:,:),k,k)*(1/2))) .* e^((-1/2).*(img-moyenne(1,:))'.*(inv(reshape(covariance(1,:,:),k,k))).*(img - moyenne(1,:)))
  [res] = max(p);
endfunction


App = load("appr_cl.ascii");
%Apprentissage = load("appr.ascii");
%project_data(30)
%appr_acp = load('appr-acp.ascii');
%dev_acp = load('dev-acp.ascii');
%eval_acp = load('eval-acp.ascii');

%vecteurProba = probaApriori(App);
%vecteurProba;
%vectMoyen = vectMoyen(Apprentissage,App);

%matCov = matCov(Apprentissage,App);
%size(matCov);

probaApriori = probaApriori(App);
vectMoyen = vectMoyen(appr_acp.Ap, App);
matriceCovariance = matCov(appr_acp.Ap, App);

 y = gaussienne(vectMoyen,matriceCovariance,dev_acp.Ap(1,:),30);
