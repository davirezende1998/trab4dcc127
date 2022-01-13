T = readtable('C:\Users\pedro\Downloads\trabalho4-20220112T213453Z-001\trabalho4\trabalho4_dados_1.csv');
T = table2array(T);

e = normalize(T);
%% KMEANS data
[idx,C] = kmeans(e,3);
figure
scatter3(e(:,1),e(:,7),e(:,3),30,idx,'filled') 
title('kmeans : k=3')
xlabel('area')
ylabel('extensão')
zlabel('maior eixo')

[idx,C] = kmeans(e,4);
figure
scatter3(e(:,1),e(:,7),e(:,3),30,idx,'filled') 
title('kmeans : k=4')
xlabel('area')
ylabel('extensão')
zlabel('maior eixo')
[idx,C] = kmeans(e,5);

figure
scatter3(e(:,1),e(:,7),e(:,3),30,idx,'filled') 
title('kmeans : k=5')
xlabel('area')
ylabel('extensão')
zlabel('maior eixo')

str = ["Area","Extensao","maiorEixo"];
v = [1 7 3];
vizinhoCluster(e,str,25,v);

%% KMEANS  COM PCA
[coeff,score,latent,tsquared] = pca(normalize(T));
x2 = normalize(T)
x3 = [score(:,1) score(:,2) score(:,3) score(:,4) score(:,5) score(:,6) score(:,7)]
figure
hist(x3)

legend('PC1','PC2','PC3','PC4','PC5','PC6','PC7')

[idx,C] = kmeans(score,3)

figure
scatter3(score(:,1),score(:,2),score(:,3),30,idx,'filled') 
title('PCA kmeans : k=3')
xlabel('area')
ylabel('extensão')
zlabel('maior eixo')

[idx,C] = kmeans(score,4)
figure
scatter3(score(:,1),score(:,2),score(:,3),30,idx,'filled')
title('PCA kmeans : k=4')
xlabel('area')
ylabel('extensão')
zlabel('maior eixo')

[idx,C] = kmeans(score,5)
figure
scatter3(score(:,1),score(:,2),score(:,3),30,idx,'filled') 
title('PCA kmeans : k=5')
xlabel('area')
ylabel('extensão')
zlabel('maior eixo')
str = ["PC1" "PC2" "PC3"];
v = [1 2 3];
vizinhoCluster(score,str,25,v);

%%

x2 = normalize(T)
x3 = [x2(:,1) x2(:,2) x2(:,3) x2(:,4) x2(:,5) x2(:,6) x2(:,7)]

scatter(x2(:,1),x2(:,7))

figure
title('histograma variaveis')
hist(x3)

legend('area','perimetro','maior eixo','menor eixo','arredondamento','area convexa','extensão')


%%
vetG = []
A = findgroups(round(e(:,1),0))
figure
scatter3(e(:,1),e(:,7),e(:,3),[],A,'filled')

[idx,C] = kmeans(e,6);
figure
scatter3(e(:,1),e(:,7),e(:,3),30,idx,'filled') 
title('kmeans : k=6')
xlabel('area')
ylabel('extensão')
zlabel('maior eixo')

str = ["Area","Extensao","maiorEixo"];
v = [1 7 3];