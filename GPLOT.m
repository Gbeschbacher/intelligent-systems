function y = GPLOT(X, NUM_LABELS, STR_LABELS, name)


fig = figure;
gscatter(X(:,1), X(:,2), NUM_LABELS, [], [], [], 'off');


if(isempty(STR_LABELS))
    legend(unique(num2str(NUM_LABELS),'rows'),'location','best') 
else
    legend(STR_LABELS,'location','best')
end

set(gca,'FontSize', 11);
title(name);
print(fig, name,'-dpng')
y = fig;