1;



%warning("off","all");



function [res] = probaApriori(X)

  res = zeros(10,1);

  for y=0:9
    r=0;
    for i=1:length(X)
      z = X(i,1);
      if(z==y)
        r=r+1;
      endif
    end
    r=r/length(X);
    res(y+1,1)=r;
  end

endfunction



function [res] = moyenne(X,Y)

  for i=0:9
    res(i+1,:) = mean(X(find(Y==i),:));
  end

endfunction



function [res] = covariance(X,Y)

  for i=0:9
    res(i+1,:,:) = cov(X(find(Y==i),:));
  end

endfunction



function [mu,P] = acp (X, k)
  n=size(X,1);
  mu = mean(X);
  Xmu = X-ones(n,1)*mu;
  S = Xmu'*Xmu;
  [P evd] = eigs(S,k,'lm');
  ev = diag(evd);
  %printf('%5.3f\n', sum(ev));
endfunction



function [] = project_data (A,k)

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



function [res] = gaussienne(img, moyenne, covariance, k)

  for j=1:5000
    for i=0:9
	%p(i+1) = (1 / sqrt(2*pi*det(reshape(covariance([i+1],:,:),k,k)^0.5)) * exp(-0.5*(img([j],:)-moyenne([i+1],:)))*inv(reshape(covariance([i+1],:,:),k,k))*(img([j],:)-moyenne([i+1],:))');


      p(i+1) = exp(-0.5*(img([j],:)-moyenne([i+1],:))*inv(reshape(covariance([i+1],:,:),k,k))*(img([j],:)-moyenne([i+1],:))') / sqrt(2*pi*det(reshape(covariance([i+1],:,:),k,k)^0.5));
      
    end
    [x, ix] = max(p(:,2));
    res(j,:) = ix;
  end
endfunction



function [res] = taux_erreur(dev_cl,cl)

  nb_err = 0;
  for i=1:5000
    if dev_cl(i) != cl(i)
      nb_err = nb_err+ 1;
    end
  end
  res = nb_err / 5000;

endfunction



App_class = load("appr_cl.ascii");
App = load("appr.ascii");
Dev_class = load("dev_cl.ascii");
Dev = load("dev.ascii");
Eval = load("eval.ascii");

k = 33;
project_data(App,k);

Appacp = load("appr-acp.ascii");
Devacp = load("dev-acp.ascii");
Evalacp = load("eval-acp.ascii");


probaApriori = probaApriori(App_class);
%moyenne = moyenne(App,App_class);
covariance2 = covariance(App,App_class);

moyenne = moyenne(Appacp.Ap,App_class);
covariance = covariance(Appacp.Ap,App_class);

%a = size(Devacp.Ap([1],:))
%b = size(moyenne)
%c = size(covariance)
%d = size(k)

class = gaussienne(Devacp.Ap,moyenne,covariance,k);
%size(class)

img = Devacp.Ap;
%i=0;
%p = exp(-0.5*(img([i+1],:)-moyenne([i+1],:))*inv(reshape(covariance([i+1],:,:),k,k))*(img([i+1],:)-moyenne([i+1],:))') / sqrt(2*pi*det(reshape(covariance([i+1],:,:),k,k)^0.5));
%p;

%s = exp(-0.5*(img([i+1],:)-moyenne([i+1],:))*inv(reshape(covariance([i+1],:,:),k,k))*(img([i+1],:)-moyenne([i+1],:))');
%s

%t = sqrt(2*pi*det(reshape(covariance([i+1],:,:),k,k)^0.5));
%t

%w = -0.5*(img([i+1],:)-moyenne([i+1],:))*inv(reshape(covariance([i+1],:,:),k,k))*(img([i+1],:)-moyenne([i+1],:))'
%w

%y = -0.5*(img([i+1],:)-moyenne([i+1],:));
%y

%z = inv(reshape(covariance([i+1],:,:),k,k));
%z


e = taux_erreur(Dev_class,class);
e 
