@ECHO OFF
Rem You need to have 7-zip installed on your system
Rem Make sure the path to 7-zip is specified in env variables or cd to path and iterate 'dir %source_path%%file_name% /b'
SET source_path="C:\Users\91965\Documents\UnZipper\Input\"
SET output_path="C:\Users\91965\Documents\UnZipper\Output\"
SET log_file="C:\Users\91965\Documents\UnZipper\unzip_log.txt"
Rem sort through file names
SET /p fileInitials= "Please enter the initials of file : " 
SET file_name="%fileInitials%*.zip"
cd  %source_path%
echo Transferring from %source_path% to %output_path% > %log_file%

FOR /f "tokens=*" %%f IN ('dir %file_name% /b') DO (
echo Processing : %%f
echo File_Name : %%f > %log_file% 
7z e -aos -bb0 %source_path%%%f -o%output_path%%%~nf
)
