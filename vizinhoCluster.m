function vizinhoCluster(T,str,tamanhoVizinhanca,v)
X=T
[N,~]=size(X);
[cls,pnode]=knncluster(X,tamanhoVizinhanca);
% Color-coded scatter plot of first two attributes
figure
scatter3(X(:,v(1)),X(:,v(2)),X(:,v(3)),[],cls,'filled')
xlabel(str(1))
ylabel(str(2))
zlabel(str(3))
% Generate and plot directed graph
G=digraph(1:N,pnode,'OmitSelfLoops');
figure()
% Plot in data space
plot(G,'XData',X(:,v(1)),'YData',X(:,v(2)),'ZData',X(:,v(3)),'MarkerSize',2)
xlabel(str(1))
ylabel(str(2))
ylabel(str(3))
figure()
% Plot cluster hierarchy
plot(G,'Layout','Layered')
