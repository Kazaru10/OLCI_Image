classdef OLCI_band
    % classe de definition d une bande spectrale d un produit OLCI
    % prend en entree un fihier .nc correspondant a une bande spectrale
    
    % exemple
    % File = '\OLCI\S3A_OL_1_EFR____20210424T095047_20210424T095347_20210424T120837_0179_071_079_2160_MAR_O_NR_002\S3A_OL_1_EFR____20210424T095047_20210424T095347_20210424T120837_0179_071_079_2160_MAR_O_NR_002.SEN3\Oa01_radiance.nc';
    
    properties
       path % chemin vers fichier .nc
       name % nom du fichier .nc
       info % info de la bande selectionnee
       img_data % image 
       band % bande spectrale de l image
    end
    
    methods
        function OLCI_band_object = OLCI_band(path2file)
            OLCI_band_object.path = path2file; % chemin ver le fichier
            OLCI_band_object.info = ncinfo(path2file);
            OLCI_band_object.name = OLCI_band_object.info.Variables.Name;
            OLCI_band_object.img_data = ncread(path2file,OLCI_band_object.name)';
        end
        
        function display_band(OLCI_band_object)
            % fonction affichage de l'image
            figure();
            imagesc(OLCI_band_object.img_data);
            title(OLCI_band_object.name, 'Interpreter', 'none'); 
            axis equal
        end
        
        function histo(OLCI_band_object)
            % tracage histogramme data
            figure()
            hist(OLCI_band_object.img_data(:), 100);
            title(['histogram ', OLCI_band_object.info.Variables.Name], 'Interpreter', 'none' )
        end
    end
    
    
end
