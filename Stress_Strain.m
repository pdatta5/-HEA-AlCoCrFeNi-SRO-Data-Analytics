%% Analyze def1.txt files
% Plot the various responses

d = dir('*.def1.txt');
for i = 1:length(d)
    % Get data
    fname = d(i).name;
    A = importdata(fname);
    strain = A.data(:,1);
    stress = A.data(:,2:4);

    % Generate plot
    plot(strain,stress(:,1),'-or','LineWidth',2,'MarkerEdgeColor','r',...
                'MarkerFaceColor','r','MarkerSize',5),hold on
    %plot(strain,stress(:,2),'-ob','LineWidth',2,'MarkerEdgeColor','b',...
    %            'MarkerFaceColor','b','MarkerSize',5),hold on
    %plot(strain,stress(:,3),'-og','LineWidth',2,'MarkerEdgeColor','g',...
    %            'MarkerFaceColor','g','MarkerSize',5),hold on
    axis square
    ylim([0 20])

    % Get the maximum y-axis value
    ymax1 = max(stress(:,1));
    
    % Display the maximum y-axis value
    text(0.8, 16, ['Max Y: ', num2str(ymax1)], 'FontSize', 24, 'FontWeight', 'bold', 'Color', 'k');

    set(gca,'LineWidth',2,'FontSize',24,'FontWeight','normal','FontName','Times')
    set(get(gca,'XLabel'),'String','Strain','FontSize',32,'FontWeight','bold','FontName','Times')
    set(get(gca,'YLabel'),'String','Stress (GPa)','FontSize',32,'FontWeight','bold','FontName','Times')
    set(gcf,'Position',[1 1 round(1000) round(1000)])

    % Export figure to tif file
    %exportfig(gcf,strrep(fname,'.def1.txt','.tif'),'Format','tiff',...
    %'Color','rgb','Resolution',300)
    %saveas(figure, 'stress_strain.png')
    exportgraphics(gcf,'stress_strain.png','Resolution',300)
    ymax1=max(stress(:,1));
    disp('The maximum value of dy/dt is: ')
    disp(ymax1)
    close(1)

end
%exportgraphics(gcf,'stress_strain.png','Resolution',300)
