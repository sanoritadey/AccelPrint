%This is the main script which will call the create_csv script.
%Once the raw accelerometer reading are received, use this script first to create the csv files. 

%For each folder the top script will create a text file which will hold all the processed data.

function topProcess(in_fld_path,out_fld_path)
  
   %in_fld_path is the location of the folder where raw accelerometer data files are stored.

   %out_fld_path is the location of the folder where the pocessed folders will be stored.

   allfldr = dir(in_fld_path);

   %CSV file processing

   mkdir(out_fld_path,'csv');
 
   csv = strcat(out_fld_path,'\','csv');

   for lp = 3:length(allfldr)

      tp = strcat(in_fld_path,'\',allfldr(lp).name);
      
      fldr_name = allfldr(lp).name;

      allfile = dir(tp);

      for ilp = 3:length(allfile)
          
         sequence = int2str(ilp-2);
         
         tpp = strcat(in_fld_path,'\',allfldr(lp).name,'\',allfile(ilp).name);
         
         allfilelower = dir(tpp);
         
         for ilpp = 3:length(allfilelower)

            file_name = strcat(in_fld_path,'\',allfldr(lp).name,'\',allfile(ilp).name,'\',allfilelower(ilpp).name);

            create_csv;
            
         end
    
      end
 
   end

   mkdir(out_fld_path,'interp');
 
   outfld = strcat(out_fld_path,'\','interp');

   frequencyinterp(csv,outfld);
