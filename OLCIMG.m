classdef OLCIMG
   %% classe definition produit OLCI
   
   properties
       path %chemin vers produit image OLCI
       name % nom du produit image OLCI
       Band_01 % bande spactrale 01
       Band_02
       Band_03
       Band_04
       Band_05
       Band_06
       Band_07
       Band_08
       Band_09
       Band_10
       Band_11
       Band_12
       Band_13
       Band_14
       Band_15
       Band_16
       Band_17
       Band_18
       Band_19
       Band_20
       Band_21 % bande spectrale 21
       geo_coordinates
       
   end
   
   methods 
       function OLCI_object = OLCIMG(path2folder)
           % methhode d instanciation
           
           OLCI_object.path = path2folder;
           %% lecture des dats con,tenus dans les fichiers
           % instanciation de toutes les bandes via appel a la classe
           % OLCI_band
                      
           content = dir(path2folder);
           if strfind(content(3).name, '.SEN3')
              tmp = [path2folder, '\', content(3).name];
              path2folder = tmp;
           end
           
           folder_content = dir(path2folder);
           
           str_tmp = strsplit(path2folder, '\');
           OLCI_object.name = str_tmp{end-1};
           
           for i = 1:length(dir(path2folder))
               
               %% instanciation de toutes les bandes via appel a la classe
               % OLCI_band
               
               if strfind(folder_content(i).name,'Oa01')
                   OLCI_object.Band_01 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 02
               if strfind(folder_content(i).name,'Oa02')
                   OLCI_object.Band_02 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 03
               if strfind(folder_content(i).name,'Oa03')
                   OLCI_object.Band_03 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 04
               if strfind(folder_content(i).name,'Oa04')
                   OLCI_object.Band_04 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 05
               if strfind(folder_content(i).name,'Oa05')
                   OLCI_object.Band_05 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 06
               if strfind(folder_content(i).name,'Oa06')
                   OLCI_object.Band_06 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 07
               if strfind(folder_content(i).name,'Oa07')
                   OLCI_object.Band_07 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 08
               if strfind(folder_content(i).name,'Oa08')
                   OLCI_object.Band_08 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 09
               if strfind(folder_content(i).name,'Oa09')
                   OLCI_object.Band_09 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 10
               if strfind(folder_content(i).name,'Oa10')
                   OLCI_object.Band_10 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 11
               if strfind(folder_content(i).name,'Oa11')
                   OLCI_object.Band_11 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 12
               if strfind(folder_content(i).name,'Oa12')
                   OLCI_object.Band_12 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 13
               if strfind(folder_content(i).name,'Oa13')
                   OLCI_object.Band_13 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 14
               if strfind(folder_content(i).name,'Oa14')
                   OLCI_object.Band_14 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 15
               if strfind(folder_content(i).name,'Oa15')
                   OLCI_object.Band_15 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 16
               if strfind(folder_content(i).name,'Oa16')
                   OLCI_object.Band_16 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 17
               if strfind(folder_content(i).name,'Oa17')
                   OLCI_object.Band_17 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 18
               if strfind(folder_content(i).name,'Oa18')
                   OLCI_object.Band_18 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 19
               if strfind(folder_content(i).name,'Oa19')
                   OLCI_object.Band_19 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 20
               if strfind(folder_content(i).name,'Oa20')
                   OLCI_object.Band_20 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               %band 21
               if strfind(folder_content(i).name,'Oa21')
                   OLCI_object.Band_21 = OLCI_band([folder_content(i).folder,'\',folder_content(i).name]);
               end
               
               %% recuperation des datas de geoloc
               if strcmp(folder_content(i).name,'geo_coordinates.nc')
                   OLCI_object.geo_coordinates.longitude = ncread([folder_content(i).folder,'\',folder_content(i).name], 'longitude');
                   OLCI_object.geo_coordinates.latitude = ncread([folder_content(i).folder,'\',folder_content(i).name], 'latitude');
                   OLCI_object.geo_coordinates.altitude = ncread([folder_content(i).folder,'\',folder_content(i).name], 'altitude')';
               end
               
           end
           %faire un dir pour recuperer tout les fichiers (créer un parser ou les parcourir un a un via un switch-case)
       end
       
       function show_band(OLCI_object)
           % methode d'affichage d une bande spectrale
           % inutile car deja dans la classe OLCI_band
           figure()
           plot([1 2 3 1 2 3])
       end
       
       function mercator(OLCI_object)
          % projection mercator des coordonées geographiques du produit
          
          % recuperation localisation pipxel central
          pixel_central = [round(size(OLCI_object.geo_coordinates.longitude,1)/2), round(size(OLCI_object.geo_coordinates.longitude,2)/2)];
          
          Lon = OLCI_object.geo_coordinates.longitude(pixel_central(1), pixel_central(2));
          Lat = OLCI_object.geo_coordinates.latitude(pixel_central(1), pixel_central(2));
          
          
          % coordonnées trace au sol
          lon_1 = OLCI_object.geo_coordinates.longitude(1, 1);
          lon_2 = OLCI_object.geo_coordinates.longitude(1, end);
          lon_3 = OLCI_object.geo_coordinates.longitude(end, 1);
          lon_4 = OLCI_object.geo_coordinates.longitude(end, end);
          
          lat_1 = OLCI_object.geo_coordinates.latitude(1, 1);
          lat_2 = OLCI_object.geo_coordinates.latitude(1, end);
          lat_3 = OLCI_object.geo_coordinates.latitude(end, 1);
          lat_4 = OLCI_object.geo_coordinates.latitude(end, end);
          
          % chargement image
          img_mercator = imread('D:\OLCI\SCRIPT\mercator\Mercator-projection.jpg');
          
          w = size(img_mercator, 2);
          h = size(img_mercator, 1);
          
          % calcul projection marcator
          
          %pixel central
          x = w * (Lon + 180)/360;
          y = (h/2) - (w/(2*pi)) * log(tan(pi/4 + deg2rad(Lat)/2));
          
          %trace au sol
          X_track = w * ([lon_1 lon_2 lon_4 lon_3 lon_1] + 180)/360;
          Y_track = (h/2) - (w/(2*pi)) * log(tan(pi/4 + deg2rad([lat_1 lat_2 lat_4 lat_3 lat_1])/2));
                    
          % plot projection mercator
          figure
          hold on
          image(img_mercator)
          axis ij
          axis equal
          axis off
          plot(x, y, 'r*')
          plot(X_track, Y_track, 'r--')
          title(OLCI_object.name)
          hold off
          
       end
       
       function [x,y] = geoloc_inv(OLCI_object, lon, lat)
          % localisation inverse lat lon sur image 
          % prend en entrée coordonees lon, lat et renvoie les coordonées
          % pixel correspondants
          lon_find = OLCI_object.geo_coordinates.longitude;
          lat_find = OLCI_object.geo_coordinates.latitude;
          
          lon_find = abs(lon_find - lon);
          lat_find = abs(lat_find - lat);
          
          location_find = lon_find + lat_find;
          [x, y] = find(location_find == min(min(location_find)));

       end
       
       function [lon, lat] = geoloc(OLCI_object, x, y)
          % fonction de geoloc: prend les coordonnees pixel et
          % revoie les coordonnees lon lat correspondants
          lon = OLCI_object.geo_coordinates.longitude(x,y);
          lat = OLCI_object.geo_coordinates.latitude(x,y);
          
       end
       
       function img_tmp = visuel(OLCI_object)
           % visualisation de l'image en RGB
           % bandes utilisees: R:07 G:06 B:03
           img_tmp(:,:,1) = OLCI_object.Band_07.img_data/(max(max(OLCI_object.Band_07.img_data)));
           img_tmp(:,:,2) = OLCI_object.Band_06.img_data/(max(max(OLCI_object.Band_06.img_data)));
           img_tmp(:,:,3) = OLCI_object.Band_03.img_data/(max(max(OLCI_object.Band_03.img_data)));
           
           img_tmp(:,:,1) = imadjust(img_tmp(:,:,1),stretchlim(img_tmp(:,:,1)),[]);
           img_tmp(:,:,2) = imadjust(img_tmp(:,:,2),stretchlim(img_tmp(:,:,2)),[]);
           img_tmp(:,:,3) = imadjust(img_tmp(:,:,3),stretchlim(img_tmp(:,:,3)),[]);
           
           figure()
           imagesc(img_tmp)
           title(OLCI_object.name, 'Interpreter', 'none')
           axis equal
           
       end
   end
   
end
