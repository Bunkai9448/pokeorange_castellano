The following scripts are meant to be run from this path: ~pokeorange/gfx/pics/


- pics_clean2bpppng.bat: enters all folders and removes the .2bpp and .png files (thus only the palette and compressed pics should remain for each Pokémon)

- pics_uncompress.bat: iterates through all the folders and decompresses the 2bpp.lz files, then uses rgbgfx to convert them back into .png images.

- pics_compress.bat: iterates through all the folders and uses rgbgfx to convert all png files into 2bpp files, then uses lzcomp to compress them to 2bpp.lz


Both pics_uncompress and pics_compress script Will download rgbds 1.0.0 Windows 32bit versión and uncompress the file to ~pokeorange/gfx/pics/_rgbds100. This is needed since Pokémon Orange needs RGBDS 0.5.2 to correctly compile, but RGBDS 0.5.2 doesn't support converting 2bpp files back into png images.

These scripts rely on ~pokeorange/tolos/lzcomp being present. This should not be an issue since this is compiled when the pokeorange project is compiled.