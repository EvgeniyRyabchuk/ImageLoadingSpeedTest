https://evgeniyryabchuk.github.io/ImageLoadingSpeedTest/































Windows Env Vars 

C:\Users\jekar\Desktop\Projects\PhotoBankHub\docs\Магистерская\Дослідження\test\libs\avif
C:\Users\jekar\Desktop\Projects\PhotoBankHub\docs\Магистерская\Дослідження\test\libs\jpeg
C:\Users\jekar\Desktop\Projects\PhotoBankHub\docs\Магистерская\Дослідження\test\libs\jpegxl
C:\Users\jekar\Desktop\Projects\PhotoBankHub\docs\Магистерская\Дослідження\test\libs\libwebp
C:\Users\jekar\Desktop\Projects\PhotoBankHub\docs\Магистерская\Дослідження\test\libs\FLIF\build\MSVC

Libs Links: 



mozjpeg - https://github.com/mozilla/mozjpeg https://github.com/garyzyg/mozjpeg-windows 
libjpeg-turbo -  https://github.com/libjpeg-turbo/libjpeg-turbo https://sourceforge.net/projects/libjpeg-turbo/files/
jpeg - ImageMagick (libjpeg-turbo 3.0.0) - https://imagemagick.org/script/download.php   
jpeg guetzli - https://github.com/google/guetzli 


jpegxl - https://github.com/libjxl/libjxl/releases/tag/v0.8.2
webp - https://developers.google.com/speed/webp/download?hl=ru
avif - https://ci.appveyor.com/project/louquillio/libavif/build/artifacts

flif - https://github.com/FLIF-hub/FLIF 
bpg - https://bellard.org/bpg/ 

/*

## paths to enc and dec libs for image compression 

$cLibjpegTurbo="./libs/jpeg/libjpeg-turbo/bin/cjpeg.exe"
$dLibjpegTurbo="./libs/jpeg/libjpeg-turbo/bin/djpeg.exe"

$cMozjpeg="./libs/jpeg/mozjpeg/cjpeg-static"
$dMozjpeg="./libs/jpeg/mozjpeg/djpeg-static"

$cJpegGuetzli="./libs/jpeg/guetzli/guetzli_windows_x86-64"

$сJpegxl="./libs/jpegxl/cjxl"
$dJpegxl="./libs/jpegxl/djxl"

$cWebp="./libs/bin/cwebp"
$dWebp="./libs/bin/dwebp"

$cAvif="./libs/avif/avifenc"
$dAvif="./libs/avif/avifdec"

$flif="./libs/FLIF/build/MSVC/flif"

$cBpg="./libs/bpg/bpgenc"
$dBpg="./libs/bpg/bpgdec"

*/

ImageMagick Formats: 

  Format  Module    Mode  Description
-------------------------------------------------------------------------------
      3FR  DNG       r--   Hasselblad CFV/H3D39II (0.21.1-Release)
      3G2  VIDEO     r--   Media Container
      3GP  VIDEO     r--   Media Container
      AAI* AAI       rw+   AAI Dune image
       AI  PDF       rw-   Adobe Illustrator CS2
     APNG  VIDEO     rw+   Animated Portable Network Graphics
      ART* ART       rw-   PFS: 1st Publisher Clip Art
      ARW  DNG       r--   Sony Alpha Raw Image Format (0.21.1-Release)
   ASHLAR* ASHLAR    -w+   Image sequence laid out in continuous irregular courses
      AVI  VIDEO     r--   Microsoft Audio/Visual Interleaved
     AVIF  HEIC      rw+   AV1 Image File Format (1.17.0)
      AVS* AVS       rw+   AVS X image
    BAYER* BAYER     rw+   Raw mosaiced samples
   BAYERA* BAYER     rw+   Raw mosaiced and alpha samples
      BGR* BGR       rw+   Raw blue, green, and red samples
     BGRA* BGR       rw+   Raw blue, green, red, and alpha samples
     BGRO* BGR       rw+   Raw blue, green, red, and opacity samples
      BIE* JBIG      ---   Joint Bi-level Image experts Group interchange format
      BMP* BMP       rw-   Microsoft Windows bitmap image
     BMP2* BMP       rw-   Microsoft Windows bitmap image (V2)
     BMP3* BMP       rw-   Microsoft Windows bitmap image (V3)
      BRF* BRAILLE   -w-   BRF ASCII Braille format
      CAL* CALS      rw-   Continuous Acquisition and Life-cycle Support Type 1
             Specified in MIL-R-28002 and MIL-PRF-28002
     CALS* CALS      rw-   Continuous Acquisition and Life-cycle Support Type 1
             Specified in MIL-R-28002 and MIL-PRF-28002
   CANVAS* XC        r--   Constant image uniform color
  CAPTION* CAPTION   r--   Caption
      CIN* CIN       rw-   Cineon Image File
      CIP* CIP       -w-   Cisco IP phone image format
     CLIP* CLIP      rw+   Image Clip Mask
CLIPBOARD* CLIPBOARD rw-   The system clipboard
     CMYK* CMYK      rw+   Raw cyan, magenta, yellow, and black samples
    CMYKA* CMYK      rw+   Raw cyan, magenta, yellow, black, and alpha samples
      CR2  DNG       r--   Canon Digital Camera Raw Image Format (0.21.1-Release)
      CR3  DNG       r--   Canon Digital Camera Raw Image Format (0.21.1-Release)
      CRW  DNG       r--   Canon Digital Camera Raw Image Format (0.21.1-Release)
     CUBE* CUBE      r--   Cube LUT
      CUR* ICON      rw-   Microsoft icon
      CUT* CUT       r--   DR Halo
     DATA* INLINE    rw+   Base64-encoded inline images
      DCM* DCM       r--   Digital Imaging and Communications in Medicine image
             DICOM is used by the medical community for images like X-rays.  The
             specification, "Digital Imaging and Communications in Medicine
             (DICOM)", is available at http://medical.nema.org/.  In particular,
             see part 5 which describes the image encoding (RLE, JPEG, JPEG-LS),
             and supplement 61 which adds JPEG-2000 encoding.
      DCR  DNG       r--   Kodak Digital Camera Raw Image File (0.21.1-Release)
    DCRAW  DNG       r--   Raw Photo Decoder (dcraw) (0.21.1-Release)
      DCX* PCX       rw+   ZSoft IBM PC multi-page Paintbrush
      DDS* DDS       rw+   Microsoft DirectDraw Surface
    DFONT* TTF       r--   Multi-face font package (Freetype 2.13.2)
     DJVU* DJVU      ---   Deja vu
             See http://www.djvuzone.org/ for details about the DJVU format.  The
             DJVU 1.2 specification is available there and at
             ftp://swrinde.nde.swri.edu/pub/djvu/documents/.
      DNG  DNG       r--   Digital Negative (0.21.1-Release)
      DPS  DPS       ---   Display Postscript Interpreter
      DPX* DPX       rw-   SMPTE 268M-2003 (DPX 2.0)
             Digital Moving Picture Exchange Bitmap, Version 2.0.
             See SMPTE 268M-2003 specification at http://www.smtpe.org

     DXT1* DDS       rw+   Microsoft DirectDraw Surface
     DXT5* DDS       rw+   Microsoft DirectDraw Surface
      EMF  EMF       r--   Windows Enhanced Meta File
     EPDF  PDF       rw-   Encapsulated Portable Document Format
      EPI  PS        rw-   Encapsulated PostScript Interchange format
      EPS  PS        rw-   Encapsulated PostScript
     EPS2  PS2       -w-   Level II Encapsulated PostScript
     EPS3  PS3       -w+   Level III Encapsulated PostScript
     EPSF  PS        rw-   Encapsulated PostScript
     EPSI  PS        rw-   Encapsulated PostScript Interchange format
      EPT  EPT       rw-   Encapsulated PostScript with TIFF preview
     EPT2  EPT       rw-   Encapsulated PostScript Level II with TIFF preview
     EPT3  EPT       rw+   Encapsulated PostScript Level III with TIFF preview
      ERF  DNG       r--   Epson RAW Format (0.21.1-Release)
      EXR  EXR       rw-   High Dynamic-range (HDR) (OpenEXR 3.2.1)
 FARBFELD* FARBFELD  rw-   Farbfeld
      FAX* FAX       rw+   Group 3 FAX
             FAX machines use non-square pixels which are 1.5 times wider than
             they are tall but computer displays use square pixels, therefore
             FAX images may appear to be narrow unless they are explicitly
             resized using a geometry of "150x100%".

       FF* FARBFELD  rw-   Farbfeld
     FILE* URL       r--   Uniform Resource Locator (file://)
     FITS* FITS      rw+   Flexible Image Transport System
     FL32* FL32      rw-   FilmLight
     FLIF* FLIF      rw+   Free Lossless Image Format (libflif 0.0.2 [0000])
      FLV  VIDEO     rw+   Flash Video Stream
      FPX  FPX       ---   FlashPix Format
  FRACTAL* PLASMA    r--   Plasma fractal image
      FTP* URL       r--   Uniform Resource Locator (ftp://)
      FTS* FITS      rw+   Flexible Image Transport System
     FTXT* FTXT      rw-   Formatted text image
       G3* FAX       rw-   Group 3 FAX
       G4* FAX       rw-   Group 4 FAX
      GIF* GIF       rw+   CompuServe graphics interchange format
    GIF87* GIF       rw-   CompuServe graphics interchange format (version 87a)
 GRADIENT* GRADIENT  r--   Gradual linear passing from one shade to another
     GRAY* GRAY      rw+   Raw gray samples
    GRAYA* GRAY      rw+   Raw gray and alpha samples
   GROUP4* TIFF      rw-   Raw CCITT Group4
             Compression options: None, Fax/Group3, Group4, JBIG, JPEG, LERC, LZW, LZMA, RLE, ZIP, ZSTD, WEBP
     HALD* HALD      r--   Identity Hald color lookup table image
      HDR* HDR       rw+   Radiance RGBE image format
     HEIC  HEIC      r--   High Efficiency Image Format (1.17.0)
     HEIF  HEIC      r--   High Efficiency Image Format (1.17.0)
HISTOGRAM* HISTOGRAM -w-   Histogram of the image
      HRZ* HRZ       rw-   Slow Scan TeleVision
      HTM* HTML      -w-   Hypertext Markup Language and a client-side image map
     HTML* HTML      -w-   Hypertext Markup Language and a client-side image map
     HTTP* URL       r--   Uniform Resource Locator (http://)
    HTTPS* URL       r--   Uniform Resource Locator (https://)
      ICB* TGA       rw-   Truevision Targa image
      ICO* ICON      rw+   Microsoft icon
     ICON* ICON      rw-   Microsoft icon
      IIQ  DNG       r--   Phase One Raw Image Format (0.21.1-Release)
     INFO  INFO      -w+   The image format and characteristics
   INLINE* INLINE    rw+   Base64-encoded inline images
      IPL* IPL       rw+   IPL Image Sequence
   ISOBRL* BRAILLE   -w-   ISO/TR 11548-1 format
  ISOBRL6* BRAILLE   -w-   ISO/TR 11548-1 format 6dot
      J2C* JP2       rw-   JPEG-2000 Code Stream Syntax (2.5.0)
      J2K* JP2       rw-   JPEG-2000 Code Stream Syntax (2.5.0)
      JBG* JBIG      ---   Joint Bi-level Image experts Group interchange format
     JBIG* JBIG      ---   Joint Bi-level Image experts Group interchange format
      JNG* PNG       rw-   JPEG Network Graphics
             See http://www.libpng.org/pub/mng/ for details about the JNG
             format.
      JNX* JNX       r--   Garmin tile format
      JP2* JP2       rw-   JPEG-2000 File Format Syntax (2.5.0)
      JPC* JP2       rw-   JPEG-2000 Code Stream Syntax (2.5.0)
      JPE* JPEG      rw-   Joint Photographic Experts Group JFIF format (libjpeg-turbo 3.0.0)
     JPEG* JPEG      rw-   Joint Photographic Experts Group JFIF format (libjpeg-turbo 3.0.0)
      JPG* JPEG      rw-   Joint Photographic Experts Group JFIF format (libjpeg-turbo 3.0.0)
      JPM* JP2       rw-   JPEG-2000 File Format Syntax (2.5.0)
      JPS* JPEG      rw-   Joint Photographic Experts Group JFIF format (libjpeg-turbo 3.0.0)
      JPT* JP2       rw-   JPEG-2000 File Format Syntax (2.5.0)
     JSON  JSON      -w+   The image format and characteristics
      JXL* JXL       rw+   JPEG XL (ISO/IEC 18181) (libjxl 0.8.2)
      K25  DNG       r--   Kodak Digital Camera Raw Image Format (0.21.1-Release)
      KDC  DNG       r--   Kodak Digital Camera Raw Image Format (0.21.1-Release)
    LABEL* LABEL     r--   Image label
      M2V  VIDEO     rw+   MPEG Video Stream
      M4V  VIDEO     rw+   Raw VIDEO-4 Video
      MAC* MAC       r--   MAC Paint
      MAP* MAP       rw-   Colormap intensities and indices
     MASK* MASK      rw+   Image Clip Mask
      MAT  MAT       rw+   MATLAB level 5 image format
    MATTE* MATTE     -w+   MATTE format
      MEF  DNG       r--   Mamiya Raw Image File (0.21.1-Release)
     MIFF* MIFF      rw+   Magick Image File Format
      MKV  VIDEO     rw+   Multimedia Container
      MNG* PNG       rw+   Multiple-image Network Graphics (libpng 1.6.40)
             See http://www.libpng.org/pub/mng/ for details about the MNG
             format.
     MONO* MONO      rw-   Raw bi-level bitmap
      MOV  VIDEO     rw+   MPEG Video Stream
      MP4  VIDEO     rw+   VIDEO-4 Video Stream
      MPC* MPC       rw+   Magick Pixel Cache image format
     MPEG  VIDEO     rw+   MPEG Video Stream
      MPG  VIDEO     rw+   MPEG Video Stream
      MPO* JPEG      r--   Joint Photographic Experts Group JFIF format (libjpeg-turbo 3.0.0)
      MRW  DNG       r--   Sony (Minolta) Raw Image File (0.21.1-Release)
      MSL* MSL       rw+   Magick Scripting Language
     MSVG* SVG       rw+   ImageMagick's own SVG internal renderer
      MTV* MTV       rw+   MTV Raytracing image format
      MVG* MVG       rw-   Magick Vector Graphics
      NEF  DNG       r--   Nikon Digital SLR Camera Raw Image File (0.21.1-Release)
      NRW  DNG       r--   Nikon Digital SLR Camera Raw Image File (0.21.1-Release)
     NULL* NULL      rw-   Constant image of uniform color
      ORA  ORA       r--   OpenRaster format
      ORF  DNG       r--   Olympus Digital Camera Raw Image File (0.21.1-Release)
      OTB* OTB       rw-   On-the-air bitmap
      OTF* TTF       r--   Open Type font (Freetype 2.13.2)
      PAL* UYVY      rw-   16bit/pixel interleaved YUV
     PALM* PALM      rw+   Palm pixmap
      PAM* PNM       rw+   Common 2-dimensional bitmap format
    PANGO* PANGO     r--   Pango Markup Language (Pangocairo 1.45.2)
  PATTERN* PATTERN   r--   Predefined pattern
      PBM* PNM       rw+   Portable bitmap format (black and white)
      PCD* PCD       rw-   Photo CD
     PCDS* PCD       rw-   Photo CD
      PCL  PCL       rw+   Printer Control Language
      PCT* PICT      rw-   Apple Macintosh QuickDraw/PICT
      PCX* PCX       rw-   ZSoft IBM PC Paintbrush
      PDB* PDB       rw+   Palm Database ImageViewer Format
      PDF  PDF       rw+   Portable Document Format
     PDFA  PDF       rw+   Portable Document Archive Format
      PEF  DNG       r--   Pentax Electronic File (0.21.1-Release)
      PES* PES       r--   Embrid Embroidery Format
      PFA* TTF       r--   Postscript Type 1 font (ASCII) (Freetype 2.13.2)
      PFB* TTF       r--   Postscript Type 1 font (binary) (Freetype 2.13.2)
      PFM* PNM       rw+   Portable float format
      PGM* PNM       rw+   Portable graymap format (gray scale)
      PGX* PGX       rw-   JPEG 2000 uncompressed format
      PHM* PNM       rw+   Portable half float format
    PICON* XPM       rw-   Personal Icon
     PICT* PICT      rw-   Apple Macintosh QuickDraw/PICT
      PIX* PIX       r--   Alias/Wavefront RLE image format
    PJPEG* JPEG      rw-   Joint Photographic Experts Group JFIF format (libjpeg-turbo 3.0.0)
   PLASMA* PLASMA    r--   Plasma fractal image
      PNG* PNG       rw-   Portable Network Graphics (libpng 1.6.40)
             See http://www.libpng.org/ for details about the PNG format.
    PNG00* PNG       rw-   PNG inheriting bit-depth, color-type from original, if possible
    PNG24* PNG       rw-   opaque or binary transparent 24-bit RGB
    PNG32* PNG       rw-   opaque or transparent 32-bit RGBA
    PNG48* PNG       rw-   opaque or binary transparent 48-bit RGB
    PNG64* PNG       rw-   opaque or transparent 64-bit RGBA
     PNG8* PNG       rw-   8-bit indexed with optional binary transparency
      PNM* PNM       rw+   Portable anymap
POCKETMOD  PDF       rw+   Pocketmod Personal Organizer
      PPM* PNM       rw+   Portable pixmap format (color)
       PS  PS        rw+   PostScript
      PS2  PS2       -w+   Level II PostScript
      PS3  PS3       -w+   Level III PostScript
      PSB* PSD       rw+   Adobe Large Document Format
      PSD* PSD       rw+   Adobe Photoshop bitmap
     PTIF* TIFF      rw+   Pyramid encoded TIFF
             Compression options: None, Fax/Group3, Group4, JBIG, JPEG, LERC, LZW, LZMA, RLE, ZIP, ZSTD, WEBP
      PWP* PWP       r--   Seattle Film Works
      QOI* QOI       rw-   Quite OK image format
RADIAL-GRADIENT* GRADIENT  r--   Gradual radial passing from one shade to another
      RAF  DNG       r--   Fuji CCD-RAW Graphic File (0.21.1-Release)
      RAS* SUN       rw+   SUN Rasterfile
      RAW  DNG       r--   Raw (0.21.1-Release)
      RGB* RGB       rw+   Raw red, green, and blue samples
   RGB565* RGB       r--   Raw red, green, blue samples in 565 format
     RGBA* RGB       rw+   Raw red, green, blue, and alpha samples
     RGBO* RGB       rw+   Raw red, green, blue, and opacity samples
      RGF* RGF       rw-   LEGO Mindstorms EV3 Robot Graphic Format (black and white)
      RLA* RLA       r--   Alias/Wavefront image
      RLE* RLE       r--   Utah Run length encoded image
      RMF  DNG       r--   Raw Media Format (0.21.1-Release)
     RSVG* SVG       rw+   Librsvg SVG renderer (RSVG 2.40.20)
      RW2  DNG       r--   Panasonic Lumix Raw Image (0.21.1-Release)
      SCR* SCR       r--   ZX-Spectrum SCREEN$
SCREENSHOT* SCREENSHO r--   Screen shot
      SCT* SCT       r--   Scitex HandShake
      SFW* SFW       r--   Seattle Film Works
      SGI* SGI       rw+   Irix RGB image
    SHTML* HTML      -w-   Hypertext Markup Language and a client-side image map
      SIX* SIXEL     rw-   DEC SIXEL Graphics Format
    SIXEL* SIXEL     rw-   DEC SIXEL Graphics Format
SPARSE-COLOR* TXT       -w+   Sparse Color
      SR2  DNG       r--   Sony Raw Format 2 (0.21.1-Release)
      SRF  DNG       r--   Sony Raw Format (0.21.1-Release)
  STEGANO* STEGANO   r--   Steganographic image
   STRIMG* STRIMG    rw-   String to image and back
      SUN* SUN       rw+   SUN Rasterfile
      SVG* SVG       rw+   Scalable Vector Graphics (RSVG 2.40.20)
     SVGZ* SVG       rw+   Compressed Scalable Vector Graphics (RSVG 2.40.20)
     TEXT* TXT       r--   Text
      TGA* TGA       rw-   Truevision Targa image
THUMBNAIL* THUMBNAIL -w+   EXIF Profile Thumbnail
     TIFF* TIFF      rw+   Tagged Image File Format (LIBTIFF, Version 4.6.0)
             Compression options: None, Fax/Group3, Group4, JBIG, JPEG, LERC, LZW, LZMA, RLE, ZIP, ZSTD, WEBP
   TIFF64* TIFF      rw+   Tagged Image File Format (64-bit) (LIBTIFF, Version 4.6.0)
             Compression options: None, Fax/Group3, Group4, JBIG, JPEG, LERC, LZW, LZMA, RLE, ZIP, ZSTD, WEBP
     TILE* TILE      r--   Tile image with a texture
      TIM* TIM       r--   PSX TIM
      TM2* TIM2      r--   PS2 TIM2
      TTC* TTF       r--   TrueType font collection (Freetype 2.13.2)
      TTF* TTF       r--   TrueType font (Freetype 2.13.2)
      TXT* TXT       rw+   Text
     UBRL* BRAILLE   -w-   Unicode Text format
    UBRL6* BRAILLE   -w-   Unicode Text format 6dot
      UIL* UIL       -w-   X-Motif UIL table
     UYVY* UYVY      rw-   16bit/pixel interleaved YUV
      VDA* TGA       rw-   Truevision Targa image
    VICAR* VICAR     rw-   Video Image Communication And Retrieval
      VID* VID       rw+   Visual Image Directory
     VIFF* VIFF      rw+   Khoros Visualization image
     VIPS* VIPS      rw+   VIPS image
      VST* TGA       rw-   Truevision Targa image
     WBMP* WBMP      rw-   Wireless Bitmap (level 0) image
     WEBM  VIDEO     rw+   Open Web Media
     WEBP* WEBP      rw+   WebP Image Format (libwebp 1.3.2 [020F])
      WMF  EMF       r--   Windows Meta File
      WMV  VIDEO     rw+   Windows Media Video
      WPG* WPG       rw-   Word Perfect Graphics
      X3F  DNG       r--   Sigma Camera RAW Picture File (0.21.1-Release)
      XBM* XBM       rw-   X Windows system bitmap (black and white)
       XC* XC        r--   Constant image uniform color
      XCF* XCF       r--   GIMP image
      XPM* XPM       rw-   X Windows system pixmap (color)
      XPS  XPS       r--   Microsoft XML Paper Specification
       XV* VIFF      rw+   Khoros Visualization image
     YAML  YAML      -w+   The image format and characteristics
    YCbCr* YCbCr     rw+   Raw Y, Cb, and Cr samples
   YCbCrA* YCbCr     rw+   Raw Y, Cb, Cr, and alpha samples
      YUV* YUV       rw-   CCIR 601 4:1:1 or 4:2:2

* native blob support
r read support
w write support
+ support for multiple images










if [ $test_number == 1 ] ; then 
 echo "1"
  ## ----------------------------------- LOSSY FORMAT  
    for f in $(seq 1 $generations)
    do
   
        ## AVIF 
        avif_rand_q=$(((RANDOM%63)+1)) 
        avifenc -c aom -y 420 --min 0 --max 63 -s 5 -j 4 -a end-usage=q -a tune=ssim -a cq-level=$((f % 2 ? $avif_quality_1_63 : $avif_quality_1_63-1 )) $d/"$image_name"_avif_$((f-1)).$image_ext $d/"$image_name"_avif_$f.avif
        avifdec $d/"$image_name"_avif_$f.avif $d/"$image_name"_avif_$f.$image_ext

        ## JPEG XL 
        jxl_rand_q=$(((RANDOM%99)+1)) 
        cjxl $d/"$image_name"_jxl_$((f-1)).$image_ext $d/"$image_name"_jxl_$f.jxl -q $((f % 2 ? $jxl_quality_1_100-2 : $jxl_quality_1_100)) --lossless_jpeg=0
        djxl $d/"$image_name"_jxl_$f.jxl $d/"$image_name"_jxl_$f.$image_ext

        ## JPEG libjpeg witch embeded in ImageMagick 
        im_jpeg_rand_q=$(((RANDOM%99)+1)) 
        magick convert $d/"$image_name"_jpegIM_$((f-1)).$image_ext -quality $((f % 2 ? $im_jpeg_quality_1_100-2 : $im_jpeg_quality_1_100)) $d/"$image_name"_jpegIM_$f.jpg
        magick convert $d/"$image_name"_jpegIM_$f.jpg $d/"$image_name"_jpegIM_$f.$image_ext 

        ## WebP 
        webp_rand_q=$(((RANDOM%99)+1)) 
        cwebp $d/"$image_name"_webp_$((f-1)).$image_ext -q $((f % 2 ? $webp_queality_1_100-3 : $webp_queality_1_100)) -m 6 -o $d/"$image_name"_webp_$f.webp
        dwebp $d/"$image_name"_webp_$f.webp -o $d/"$image_name"_webp_$f.$image_ext
    
        ## create one frame for video 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_jpegIM_$f.$image_ext $fd/a.$image_ext 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_webp_$f.$image_ext $fd/b.$image_ext 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_jxl_$f.$image_ext $fd/c.$image_ext  
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_avif_$f.$image_ext $fd/d.$image_ext

        # metricsAVIF=$(python ../ecn_dec_compare/metrics.py ../loss_generator/images/"$image_name"_avif_$((f-1)).$image_ext ../loss_generator/images/"$image_name"_avif_$f.$image_ext)
        # metricsJXL=$(python ../ecn_dec_compare/metrics.py ../loss_generator/images/"$image_name"_jxl_$((f-1)).$image_ext ../loss_generator/images/"$image_name"_jxl_$f.$image_ext)
        # metricslibjpeg=$(python ../ecn_dec_compare/metrics.py ../loss_generator/images/"$image_name"_jpegIM_$((f-1)).$image_ext ../loss_generator/images/"$image_name"_jpegIM_$f.$image_ext)
        # metricsWebP=$(python ../ecn_dec_compare/metrics.py ../loss_generator/images/"$image_name"_webp_$((f-1)).$image_ext ../loss_generator/images/"$image_name"_webp_$f.$image_ext) 
        
        magick convert -size 480x100 -gravity center label:"JPEG\n$(stat -c "%s" $d/"$image_name"_jpegIM_$f.jpg) bytes" $fd/aa.$image_ext
        magick convert -size 480x100 -gravity center label:"WebP\n$(stat -c "%s" $d/"$image_name"_webp_$f.webp) bytes" $fd/ab.$image_ext 
        magick convert -size 480x100 -gravity center label:"JXL\n$(stat -c "%s" $d/"$image_name"_jxl_$f.jxl) bytes" $fd/ac.$image_ext
        magick convert -size 480x100 -gravity center label:"AVIF\n$(stat -c "%s" $d/"$image_name"_avif_$f.avif) bytes" $fd/ad.$image_ext 

        magick convert -size 1920x100 -gravity center label:"$f generations" $fd/caption.$image_ext 
        magick convert +append $fd/a.$image_ext $fd/b.$image_ext $fd/c.$image_ext $fd/d.$image_ext $fd/e.$image_ext
        magick convert +append $fd/aa.$image_ext $fd/ab.$image_ext $fd/ac.$image_ext $fd/ad.$image_ext $fd/ae.$image_ext
        magick convert -append $fd/ae.$image_ext $fd/caption.$image_ext $fd/caption.$image_ext
        magick convert -append $fd/e.$image_ext $fd/caption.$image_ext $fd/frame-$f.$image_ext 
    done
elif [ $test_number == 2 ] ; then 
