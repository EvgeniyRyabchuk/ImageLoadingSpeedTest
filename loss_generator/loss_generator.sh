#!/bin/bash

## TODO: 
## other jpeg libryry 
## quality equalize
## encoder decoder speed 
## file size check 
## Compare image wiht Objective Image Quality Metrics 

# avif_quality_1_63=28
# jxl_quality_1_100=91 
# im_jpeg_quality_1_100=85
# webp_queality_1_100=78

# flif_quality_1_100=3
# bpg_quality_1_9=0
# jpeglib_turbo_1_100=85
# guetzli_quality_1_100=87
# mozjpeg_quality_1_100=81

avif_quality_1_63=11
jxl_quality_1_100=88 
im_jpeg_quality_1_100=83
webp_queality_1_100=89

flif_quality_1_100=83
bpg_quality_1_9=7
jpeglib_turbo_1_100=85  
guetzli_quality_1_100=87
mozjpeg_quality_1_100=81


cd "$(dirname "$0")"
#file folder destination 
d="./images"
fd="$d/frames"
mkdir $d
mkdir $fd 

image_dest="../shared/images"
image_name="travel_small_hor_1"  
image_ext=png
#image full name 
image_fn=$image_name.$image_ext
## 1 - test with lossy format, 2 - test lossy and lossless formats with lossy mode, 3 - test all jpeg encoders 
test_number=1
generations=100

## copy files in png as source format 
## convert for jpeglib-turbo 




magick convert $image_dest/$image_fn $d/"$image_name"_jpeg_0.ppm
magick convert $image_dest/$image_fn $d/"$image_name"_jpegMOZ_0.ppm 

cp $image_dest/$image_fn $d/"$image_name"_jpeg_0.png 

cp $image_dest/$image_fn $d/"$image_name"_jpegIM_0.png 
cp $image_dest/$image_fn $d/"$image_name"_jpegGUETZLI_0.png 
# magick convert ./$image_fn $d/"$image_name"_jpegGUETZLI_0.ppm 

cp $image_dest/$image_fn $d/"$image_name"_avif_0.png 
cp $image_dest/$image_fn $d/"$image_name"_jxl_0.png
cp $image_dest/$image_fn $d/"$image_name"_webp_0.png 

cp $image_dest/$image_fn $d/"$image_name"_flif_0.png 
cp $image_dest/$image_fn $d/"$image_name"_bpg_0.png 



## generate 1000 times 
if [ $test_number == 1 ] ; then 
 echo "1"
  ## ----------------------------------- LOSSY FORMAT  
    for f in $(seq 1 $generations)
    do
   
        ## AVIF 
        # avif_rand_q=$(shuf -i 1-10 -n 1) 
        avifenc -c aom -y 420 --min 0 --max 63 -s 5 -j 4 -a end-usage=q -a tune=ssim -a cq-level=$((f % 2 ? $avif_quality_1_63 : $avif_quality_1_63-1 )) $d/"$image_name"_avif_$((f-1)).$image_ext $d/"$image_name"_avif_$f.avif
        avifdec $d/"$image_name"_avif_$f.avif $d/"$image_name"_avif_$f.$image_ext

        ## JPEG XL 
        # jxl_rand_q=$(shuf -i 90-100 -n 1)
        cjxl $d/"$image_name"_jxl_$((f-1)).$image_ext $d/"$image_name"_jxl_$f.jxl -q $((f % 2 ? $jxl_quality_1_100 : $jxl_quality_1_100+2 )) --lossless_jpeg=0
        djxl $d/"$image_name"_jxl_$f.jxl $d/"$image_name"_jxl_$f.$image_ext

        ## JPEG libjpeg witch embeded in ImageMagick 
        # im_jpeg_rand_q=$(shuf -i 90-100 -n 1)
        magick convert $d/"$image_name"_jpegIM_$((f-1)).$image_ext -quality $((f % 2 ? $im_jpeg_quality_1_100 : $im_jpeg_quality_1_100+2 )) $d/"$image_name"_jpegIM_$f.jpg
        magick convert $d/"$image_name"_jpegIM_$f.jpg $d/"$image_name"_jpegIM_$f.$image_ext 
        
        ## WebP 
        # webp_rand_q=$(shuf -i 90-100 -n 1)
        cwebp $d/"$image_name"_webp_$((f-1)).$image_ext -q $((f % 2 ? $webp_queality_1_100 : $webp_queality_1_100+3 )) -m 6 -o $d/"$image_name"_webp_$f.webp
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
    echo "2"
 ## ----------------------------------- LOSSLESS FORMAT USING IN LOSSY MODE  
    for f in $(seq 1 $generations)
    do
        # FLIF 
        flif -e -Q $((f % 2 ? $flif_quality_1_100 : $flif_quality_1_100+7 )) --overwrite $d/"$image_name"_flif_$((f-1)).$image_ext $d/"$image_name"_flif_$f.flif 
        flif -d -q 100 --overwrite $d/"$image_name"_flif_$f.flif $d/"$image_name"_flif_$f.$image_ext 
        echo "flif finish" 
        #BPG 
        bpgenc -c rgb -m $((f % 2 ? $bpg_quality_1_9 : $bpg_quality_1_9+1 )) -o $d/"$image_name"_bpg_$f.bpg $d/"$image_name"_bpg_$((f-1)).$image_ext
        bpgdec -o $d/"$image_name"_bpg_$f.$image_ext $d/"$image_name"_bpg_$f.bpg 
        echo "bpg finish" 
        #JPEG jpeglib-turbo 
        ../libs/jpeg/libjpeg-turbo/bin/cjpeg.exe -quality $((f % 90 : 93 )) $d/"$image_name"_jpeg_$((f-1)).ppm > $d/"$image_name"_jpeg_$f.jpg
        ../libs/jpeg/libjpeg-turbo/bin/djpeg.exe $d/"$image_name"_jpeg_$f.jpg > $d/"$image_name"_jpeg_$f.ppm
        ## JPEG libjpeg witch embeded in ImageMagick 
        magick convert $d/"$image_name"_jpegIM_$((f-1)).$image_ext -quality $((f % 2 ? $im_jpeg_quality_1_100 : $im_jpeg_quality_1_100+2 )) $d/"$image_name"_jpegIM_$f.jpg
        magick convert $d/"$image_name"_jpegIM_$f.jpg $d/"$image_name"_jpegIM_$f.$image_ext  
        
        ## create one frame for video 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_flif_$f.$image_ext $fd/a.png 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_bpg_$f.$image_ext $fd/b.png
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_jpeg_$f.ppm $fd/c.png 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_jpegIM_$f.$image_ext $fd/d.png 

        magick convert -size 480x100 -gravity center label:"FLIF\n$(stat -c "%s" $d/"$image_name"_flif_$f.flif) bytes" $fd/aa.png
        magick convert -size 480x100 -gravity center label:"BPG\n$(stat -c "%s" $d/"$image_name"_bpg_$f.bpg) bytes" $fd/ab.png 
        magick convert -size 480x100 -gravity center label:"libJPEG\n$(stat -c "%s" $d/"$image_name"_jpeg_$f.jpg) bytes" $fd/ac.png
        magick convert -size 480x100 -gravity center label:"ImageMagick JPEG\n$(stat -c "%s" $d/"$image_name"_jpegIM_$f.jpg) bytes" $fd/ad.png 

        magick convert -size 1920x100 -gravity center label:"$f generations" $fd/caption.$image_ext 
        magick convert +append $fd/a.png $fd/b.png $fd/c.png $fd/d.png $fd/e.png 
        magick convert +append $fd/aa.png $fd/ab.png $fd/ac.png $fd/ad.png $fd/ae.png 
        magick convert -append $fd/ae.png $fd/caption.png $fd/caption.png
        magick convert -append $fd/e.png $fd/caption.png $fd/frame-$f.png 
    done

elif [ $test_number == 3 ] ; then 
  echo "3"
 ## ----------------------------------- JPEG ENCODER COMPARE   
    for f in $(seq 1 $generations)
    do
        ## JPEG jpeglib-turbo 
        ../libs/jpeg/libjpeg-turbo/bin/cjpeg.exe -quality $((f % 2 ? 90 : 93 )) $d/"$image_name"_jpeg_$((f-1)).ppm > $d/"$image_name"_jpeg_$f.jpg 
        ../libs/jpeg/libjpeg-turbo/bin/djpeg.exe $d/"$image_name"_jpeg_$f.jpg > $d/"$image_name"_jpeg_$f.ppm 
     
        ## JPEG ImageMagick libjpeg 
        magick convert $d/"$image_name"_jpegIM_$((f-1)).$image_ext -quality $((f % 2 ? 90 : 93 )) $d/"$image_name"_jpegIM_$f.jpg
        magick convert $d/"$image_name"_jpegIM_$f.jpg $d/"$image_name"_jpegIM_$f.$image_ext  
        ## guetzli 
        # ../libs/jpeg/guetzli/guetzli_windows_x86-64.exe --quality $((f % 2 ? 85 : 93 )) $d/"$image_name"_jpegGUETZLI_$((f-1)).png $d/"$image_name"_jpegGUETZLI_$f.jpg 
        ../libs/jpeg/guetzli/guetzli_accelerated.exe --cuda --quality $((f % 2 ? 85 : 90 )) $d/"$image_name"_jpegGUETZLI_$((f-1)).png $d/"$image_name"_jpegGUETZLI_$f.jpg   
        magick convert $d/"$image_name"_jpegGUETZLI_$f.jpg $d/"$image_name"_jpegGUETZLI_$f.png
        ## mozjpeg 
        ../libs/jpeg/mozjpeg/cjpeg-static.exe -quality $((f % 2 ? 70 : 75 )) $d/"$image_name"_jpegMOZ_$((f-1)).ppm > $d/"$image_name"_jpegMOZ_$f.jpg 
        ../libs/jpeg/mozjpeg/djpeg-static.exe $d/"$image_name"_jpegMOZ_$f.jpg > $d/"$image_name"_jpegMOZ_$f.ppm 
      
        ## create one frame for video 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_jpeg_$f.ppm $fd/a.png 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_jpegIM_$f.png $fd/b.png
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_jpegGUETZLI_$f.png $fd/c.png 
        magick convert -crop 480x880+0+0 -gravity center $d/"$image_name"_jpegMOZ_$f.ppm $fd/d.png 

        magick convert -size 480x100 -gravity center label:"libjpeg-turbo\n$(stat -c "%s" $d/"$image_name"_jpeg_$f.jpg) bytes" $fd/aa.png
        magick convert -size 480x100 -gravity center label:"ImageMagick JPEG\n$(stat -c "%s" $d/"$image_name"_jpegIM_$f.jpg) bytes" $fd/ab.png 
        magick convert -size 480x100 -gravity center label:"GUETZLI jpeg\n$(stat -c "%s" $d/"$image_name"_jpegGUETZLI_$f.jpg) bytes" $fd/ac.png 
        magick convert -size 480x100 -gravity center label:mozjpeg"\n$(stat -c "%s" $d/"$image_name"_jpegMOZ_$f.jpg) bytes" $fd/ad.png 
        
        magick convert -size 1920x100 -gravity center label:"$f generations" $fd/caption.$image_ext 
        magick convert +append $fd/a.png $fd/b.png $fd/c.png $fd/d.png $fd/e.png 
        magick convert +append $fd/aa.png $fd/ab.png  $fd/ac.png $fd/ad.png $fd/ae.png 
        magick convert -append $fd/ae.png $fd/caption.png $fd/caption.png
        magick convert -append $fd/e.png $fd/caption.png $fd/frame-$f.png 
      
    done 
fi

ffmpeg -i $fd/frame-%d.$image_ext -pix_fmt yuv420p -crf 2 GL.mp4

rm -r images

