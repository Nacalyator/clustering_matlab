%% �������� ���� �� �������� ����� � �������
root_dir = 'C:\Users\�����\Dropbox\Documents\�����������\Experimental\������ � ���������� ��������� �������� + ��\�� ����������';
%% �������� ������ ������ � ������ ���������� ������ � �������������
%  ������ � ������� �� ������� ��������
files = searcher(root_dir, 'xlsx', 'loc');
disp('����� �������!');
%% ������ ��������� ��� ������
data = zeros(0, 2);
%% ����� �������� �����, ����������� ������
%  ���������� ���������� ������
files_counts = length(files);
%  ���������� ������
for i = 1:files_counts
%   ����������� ������� �� ������� ����� Excell
    [temp1, temp2] = get_table_from_xlsx(files{i, 1});
%   �������� ������ ��� ������
%   ����������� ������ �� ��������� ��������
    amps1 = temp1(:, 6);
    amps2 = temp2(:, 6);
%   ����������� ������ �� ������� ��������
    energy1 = temp1(:, 8);
    energy2 = temp2(:, 8);
%   ������������ ����������������� ��������
    prolongations1 = calculate_prolongation(amps1, energy1);
    prolongations2 = calculate_prolongation(amps2, energy2);
%   ��������� ������ � ����� ���������
    data = [data; amps1, prolongations1];
    data = [data; amps2, prolongations2];
end
disp('������ ������� ��������������!');
%% ������ ������ ���� ��������
%  �������� ���� ���������
full_data_img_path = 'C:\Users\�����\Dropbox\Documents\�����������\MatLab\Clustering\full_data_SOM\plots\full_data';
%  ������ ���� ����������� ��� ��� �����������
full_data_figure = figure('doublebuffer','off','Visible','Off');
%  ������ ���� ����� �� �������
plot(data(:, 2), data(:, 1), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'cyan'); hold on;
%  ����������� ���
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
%  ����������� ������
title('Data from all files');
%  ���������
print(full_data_img_path, '-dpng');
disp('������ �� ����� ������� ��������!');
%% ���������� ��������� ��� �������������
%  ����� ����� ����� �������
[clusters, centroids] = SOMNN_clustering(data);
disp('������ ������� ����������������� ����������!');
%% ������ ������ ���������������� ������
%  �������� ���� ���������
SOM_data_img_path = 'C:\Users\�����\Dropbox\Documents\�����������\MatLab\Clustering\full_data_SOM\plots\clusterizated_data';
%  ������ ���� ����������� ��� ��� �����������
SOMNN_figure = figure('doublebuffer','off','Visible','Off');
%  ������ ���� ����� �� �������
plot(clusters{1, 1}(:, 2), clusters{1, 1}(:, 1), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'cyan'); hold on;
plot(clusters{2, 1}(:, 2), clusters{2, 1}(:, 1), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'magenta'); hold on;
plot(clusters{3, 1}(:, 2), clusters{3, 1}(:, 1), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'green'); hold on;
plot(clusters{4, 1}(:, 2), clusters{4, 1}(:, 1), 'o', 'MarkerSize', 2, 'MarkerFaceColor', 'blue'); hold on;
%  ����������� ��������
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
%  ���������� �� ������� ��������� ���������
plot(centroids(:, 2), centroids(:, 1), 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'red');
%  ����������� ���
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
%  ����������� ������
title('Data from all files clusterization by SOM NN');
%  ���������
print(SOM_data_img_path, '-dpng');
disp('������ � ���������� ��������� � ����������� ��������!');
%% �������� ����������� ������
good_news = '��� �����������!';
disp(good_news);