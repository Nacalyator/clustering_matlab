function create_clusters_plots( file )
%GET_CLUSTERIZATION Summary of this function goes here
%   Detailed explanation goes here
%   Задаём количество кластеров
number_of_clusters = 4;
%   Получаем путь до папки с файлом
[path, ~, ~] = fileparts(file);
%   Считываем данные из файла
[from_sensor_1, from_sensor_2] = get_table_from_xlsx(file);
%   Получаем амплитуды сигналов
amps1 = from_sensor_1(:, 6);
amps2 = from_sensor_2(:, 6);
%   Получаем энергии сигналов
energy1 = from_sensor_1(:, 8);
energy2 = from_sensor_2(:, 8);
%   Рассчитываем продолжительности сигналов
prolongations1 = calculate_prolongation(amps1, energy1);
prolongations2 = calculate_prolongation(amps2, energy2);
%   Соединяем выборки
sample1 = [amps1, prolongations1];
sample2 = [amps2, prolongations2];

%   Приступает к кластеризации сигналов
%   Получаем кластеры сигналов и их центроиды методом k-means
[kmeans_clusters1, kmeans_centroids1] = split_data_by_kmeans(sample1, number_of_clusters);
[kmeans_clusters2, kmeans_centroids2] = split_data_by_kmeans(sample2, number_of_clusters);
%   Получаем кластеры сигналов и их центроиды методом c-means
[cmeans_clusters1, cmeans_centroids1] = split_data_by_cmeans(sample1, number_of_clusters);
[cmeans_clusters2, cmeans_centroids2] = split_data_by_cmeans(sample2, number_of_clusters);
%   Кластеризация SOM нейросетью
[SOMNN_clusters1, SOMNN_centroids1] = SOMNN_clustering(sample1);
[SOMNN_clusters2, SOMNN_centroids2] = SOMNN_clustering(sample2);


%   Получаем полный путь до папки с графиками
plots_directory = strcat(path, '\clusters_plots');
%   Создаём папку для графиков в директории исходного файла xlsx
mkdir(plots_directory);

%   Создаём нужные графики

%   k-means
%   С первого датчика
kmeans1_figure = figure('doublebuffer','off','Visible','Off');
plot(kmeans_clusters1{1, 1}(:, 2), kmeans_clusters1{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters1{2, 1}(:, 2), kmeans_clusters1{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters1{3, 1}(:, 2), kmeans_clusters1{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters1{4, 1}(:, 2), kmeans_clusters1{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(kmeans_centroids1(:, 2), kmeans_centroids1(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
kmeans1_path = strcat(plots_directory, '/', 'kmeans1');
print(kmeans1_path, '-dpng');
%   Со второго датчика
kmeans2_figure = figure('doublebuffer','off','Visible','Off');
plot(kmeans_clusters2{1, 1}(:, 2), kmeans_clusters2{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters2{2, 1}(:, 2), kmeans_clusters2{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters2{3, 1}(:, 2), kmeans_clusters2{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(kmeans_clusters2{4, 1}(:, 2), kmeans_clusters2{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(kmeans_centroids2(:, 2), kmeans_centroids2(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
kmeans2_path = strcat(plots_directory, '/', 'kmeans2');
print(kmeans2_path, '-dpng');


%   c-means
%   С первого датчика
cmeans1_figure = figure('doublebuffer','off','Visible','Off');
plot(cmeans_clusters1{1, 1}(:, 2), cmeans_clusters1{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters1{2, 1}(:, 2), cmeans_clusters1{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters1{3, 1}(:, 2), cmeans_clusters1{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters1{4, 1}(:, 2), cmeans_clusters1{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(cmeans_centroids1(:, 2), cmeans_centroids1(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
cmeans1_path = strcat(plots_directory, '/', 'cmeans1');
print(cmeans1_path, '-dpng');
%   Со второго датчика
cmeans2_figure = figure('doublebuffer','off','Visible','Off');
plot(cmeans_clusters2{1, 1}(:, 2), cmeans_clusters2{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters2{2, 1}(:, 2), cmeans_clusters2{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters2{3, 1}(:, 2), cmeans_clusters2{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(cmeans_clusters2{4, 1}(:, 2), cmeans_clusters2{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(cmeans_centroids2(:, 2), cmeans_centroids2(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
cmeans2_path = strcat(plots_directory, '/', 'cmeans2');
print(cmeans2_path, '-dpng');


%   SOMNN
%   С первого датчика
SOMNN1_figure = figure('doublebuffer','off','Visible','Off');
plot(SOMNN_clusters1{1, 1}(:, 2), SOMNN_clusters1{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters1{2, 1}(:, 2), SOMNN_clusters1{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters1{3, 1}(:, 2), SOMNN_clusters1{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters1{4, 1}(:, 2), SOMNN_clusters1{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(SOMNN_centroids1(:, 2), SOMNN_centroids1(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
SOMNN1_path = strcat(plots_directory, '/', 'SOMNN1');
print(SOMNN1_path, '-dpng');
%   Со второго датчика
SOMNN2_figure = figure('doublebuffer','off','Visible','Off');
plot(SOMNN_clusters2{1, 1}(:, 2), SOMNN_clusters2{1, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters2{2, 1}(:, 2), SOMNN_clusters2{2, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters2{3, 1}(:, 2), SOMNN_clusters2{3, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
plot(SOMNN_clusters2{4, 1}(:, 2), SOMNN_clusters2{4, 1}(:, 1), 'o', 'MarkerSize', 1); hold on;
legend('Cluster 1', 'Cluster 2', 'Cluster 3', 'Cluster 4');
plot(SOMNN_centroids2(:, 2), SOMNN_centroids2(:, 1), 'ro', 'MarkerSize', 10);
ylabel('Amplitude, mV');
xlabel('Prolongation, s');
SOMNN2_path = strcat(plots_directory, '/', 'SOMNN2');
print(SOMNN2_path, '-dpng');

%   Радуемся
good_news = ['Plots creating for file ' file ' has been finished succesful'];
disp(good_news);
end

