#!/bin/bash

## TODO: 
## quality equalize
## tiff  zstd
## check cuda/opencl acceleration guezely 


cd "$(dirname "$0")"
#file folder destination 
src_folder=originals
d="./result"
mkdir $d

image_ext=png
image_name=res
#image full name 
image_fn=$image_name.$image_ext
## 1 - test with lossy format, 2 - test lossy and lossless formats with lossy mode, 3 - test all jpeg encoders 
test_number=1

# just 85 percent for all 
# avif_quality_1_63=10
# jxl_quality_1_100=85
# im_jpeg_quality_1_100=85
# webp_queality_1_100=85
# flif_quality_1_100=85
# bpg_quality_1_9=8
# jpeglib_turbo_1_100=85
# guetzli_quality_1_100=85
# mozjpeg_quality_1_100=85

# ssim align 600 
# avif_quality_1_63=28
# jxl_quality_1_100=91 
# im_jpeg_quality_1_100=85
# webp_queality_1_100=78

# flif_quality_1_100=3
# bpg_quality_1_9=0
# jpeglib_turbo_1_100=85
# guetzli_quality_1_100=87
# mozjpeg_quality_1_100=81

# res size align  
# avif_quality_1_63=5
# jxl_quality_1_100=96
# im_jpeg_quality_1_100=90 
# webp_queality_1_100=95

# flif_quality_1_100=66
# bpg_quality_1_9=0
# jpeglib_turbo_1_100=93
# guetzli_quality_1_100=96
# mozjpeg_quality_1_100=92

# ssim align 1300
# avif_quality_1_63=22
# jxl_quality_1_100=91 
# im_jpeg_quality_1_100=85
# webp_queality_1_100=85

# flif_quality_1_100=40
# bpg_quality_1_9=0
# jpeglib_turbo_1_100=85
# guetzli_quality_1_100=92
# mozjpeg_quality_1_100=81

avif_quality_1_63=60
jxl_quality_1_100=10
im_jpeg_quality_1_100=10
webp_queality_1_100=10

flif_quality_1_100=10
bpg_quality_1_9=0
jpeglib_turbo_1_100=10
guetzli_quality_1_100=84
mozjpeg_quality_1_100=10


#   "../shared/images/nature_tiny_ver_1.png"
#     "../shared/images/nature_small_ver_1.png"
#     "../shared/images/travel_small_hor_1.png"
#     "../shared/images/text_ver_1.png"
#     "../shared/images/animal_sq_1.png"
#     "../shared/images/food_ver_1.png"
#     "../shared/images/people_nature_1_ver.png"
    # "../shared/images/nature_hor_2.png"

image_path_arr=(
    "../shared/images/nature_tiny_ver_1.png"
 
)
#    "../shared/images/nature_small_ver_1.png"
#     "../shared/images/travel_small_hor_1.png" 
#     "../shared/images/text_ver_1.png"
#     "../shared/images/animal_sq_1.png"
#     "../shared/images/animal_sq_1.png"
#     "../shared/images/food_ver_1.png"
#     "../shared/images/people_nature_1_ver.png"


rm -f ./result_statistic.csv
touch result_statistic.csv 
echo "sep=," >> result_statistic.csv

writeSVCHeader()
{
    image_filename=$1

    echo "" >> result_statistic.csv
    echo "" >> result_statistic.csv
    echo "" >> result_statistic.csv
    echo "=======================================================" >> result_statistic.csv
    echo -n "Image Data:," >> result_statistic.csv 
    full_describe=$(identify $image_filename)
    for word in $full_describe
    do
         echo -n "$word," >> result_statistic.csv
    done
    echo "" >> result_statistic.csv 
    echo "-------------------------------------------------------" >> result_statistic.csv
    echo "" >> result_statistic.csv 
    echo "Format,SRC_PATH,SRC_SIZE,RES_SIZE,ENC_TIME,DEC_TIME,DIFF_SIZE(%),QUALITY,SSIM,PSNR,MSE,RMSE,UQI,ERGAS,SCC,RASE,SAM,VIFP,PSNRB,FSIM,SRE" >> result_statistic.csv
}
writeSVC()
{
    format=$1
    # path to original image file  
    image_filename=$2
    AVIF_ENC_TIME=$3
    AVIF_DEC_TIME=$4
    #compress format: jpg, avif, flif itc... 
    res_path=$5
    #with png extensioin for example 
    res_origin_ext=$6 
    quality=$7
    isMetricWriteforbade=$8
    echo $f $image_filename $image_ext $res_origin_ext $AVIF_ENC_TIME $AVIF_DEC_TIME $quality $isMetricWriteforbade
 

    #Number 
    echo -n "$format," >> result_statistic.csv
    #Dest Path
    echo -n "$res_path," >> result_statistic.csv
    # Source Size 
    SRC_FILESIZE=$(stat -c%s "$image_filename")  
    echo -n "$SRC_FILESIZE," >> result_statistic.csv 
    # Compressed Size (absolute/persent)
    RES_FILESIZE=$(stat -c%s $res_path)   
    echo -n "$RES_FILESIZE," >> result_statistic.csv

    # #SSIM Score (чем меньше, тем лучше)
    # ssim=$(./dssim $image_filename $res_origin_ext) 
    # ssim=$(echo ${ssim%./*}) 
    # echo -n "$ssim," >> result_statistic.csv 

    # #PNSR Score (Чем больше значение PSNR, тем эффективнее соответствующий метод сжатия или фильтрации.) 
    # pnsr=$(python psnr.py $image_filename $res_origin_ext)
    # echo -n "$pnsr," >> result_statistic.csv 

    #Enc/Dec Time 
    echo -n "$AVIF_ENC_TIME," >> result_statistic.csv   
    echo -n "$AVIF_DEC_TIME," >> result_statistic.csv
    
    percentDiff=$("C:/Program Files/nodejs/node.exe" cacl.js $RES_FILESIZE $SRC_FILESIZE)
    echo -n "$percentDiff," >> result_statistic.csv 
    echo -n "$quality," >> result_statistic.csv 
    
    # if [[ -z "$isMetricWriteforbade" ]]
    # then
        metrics=$(python metrics.py $image_filename $res_origin_ext)
     
        metrics_arr=($metrics)
        for i in "${metrics_arr[@]}"
        do
            echo -n "$i," >> result_statistic.csv 
            echo $i
        done
    # fi
    # echo -n "$rest," >> result_statistic.csv 
    echo "" >> result_statistic.csv  
}
## ----------------------------------- Compare guetzli with differtent acceleration
guetzliTest() 
{
    for f in $(seq 1 "${#image_path_arr[@]}")
    do
        image_filename=${image_path_arr[$f-1]} 
        
        writeSVCHeader $image_filename
        
        GUETZLI_JPEG_ENC_DEFAULT_TIME=$(../shared/getproctime.sh "../libs/jpeg/guetzli/guetzli_windows_x86-64.exe --quality $guetzli_quality_1_100 $image_filename $d/"$image_name"_jpegGUETZLI_def_$f.jpg")
        GUETZLI_JPEG_DEC_DEFAULT_TIME=$(../shared/getproctime.sh "magick convert $d/"$image_name"_jpegGUETZLI_def_$f.jpg $d/"$image_name"_jpegGUETZLI_def_$f.png")

        echo "guetzli default finish"

        GUETZLI_JPEG_ENC_C_TIME=$(../shared/getproctime.sh "../libs/jpeg/guetzli/guetzli_accelerated.exe --c --quality $guetzli_quality_1_100 $image_filename $d/"$image_name"_jpegGUETZLI_c_$f.jpg")
        GUETZLI_JPEG_DEC_C_TIME=$(../shared/getproctime.sh "magick convert $d/"$image_name"_jpegGUETZLI_c_$f.jpg $d/"$image_name"_jpegGUETZLI_c_$f.png")

        echo "guetzli c finish"
        
        GUETZLI_JPEG_ENC_CUDA_TIME=$(../shared/getproctime.sh "../libs/jpeg/guetzli/guetzli_accelerated.exe --cuda --quality $guetzli_quality_1_100 $image_filename $d/"$image_name"_jpegGUETZLI_cuda_$f.jpg")
        GUETZLI_JPEG_DEC_CUDA_TIME=$(../shared/getproctime.sh "magick convert $d/"$image_name"_jpegGUETZLI_cuda_$f.jpg $d/"$image_name"_jpegGUETZLI_cuda_$f.png")
        
        echo "guetzli cuda finish"

        # GUETZLI_JPEG_ENC_OPENCL_TIME=$(../shared/getproctime.sh "../libs/jpeg/guetzli/guetzli_accelerated.exe --opencl --quality $guetzli_quality_1_100 $image_filename $d/"$image_name"_jpegGUETZLI_opencl_$f.jpg") 
        # GUETZLI_JPEG_DEC_OPENCL_TIME=$(../shared/getproctime.sh "magick convert $d/"$image_name"_jpegGUETZLI_opencl_$f.jpg $d/"$image_name"_jpegGUETZLI_opencl_$f.png")

        # echo "guetzli opencl finish"

        # echo "" >> result_statistic.csv 
        # echo "-------------------------------------------------------" >> result_statistic.csv
        # echo "" >> result_statistic.csv 
        # echo "Format,SRC_PATH,SRC_SIZE,RES_SIZE,ENC_TIME,DEC_TIME,DIFF_SIZE(%),QUALITY" >> result_statistic.csv

        writeSVC "GUETZLI DEFAULT" $image_filename $GUETZLI_JPEG_ENC_DEFAULT_TIME $GUETZLI_JPEG_DEC_DEFAULT_TIME "$d/$image_name"_jpegGUETZLI_def_"$f.jpg" "$d/$image_name"_jpegGUETZLI_def_"$f.$image_ext" $guetzli_quality_1_100 "true"
        writeSVC "GUETZLI Optimized" $image_filename $GUETZLI_JPEG_ENC_C_TIME $GUETZLI_JPEG_DEC_C_TIME "$d/$image_name"_jpegGUETZLI_c_"$f.jpg" "$d/$image_name"_jpegGUETZLI_c_"$f.$image_ext" $guetzli_quality_1_100 "true"
        writeSVC "GUETZLI CUDA" $image_filename $GUETZLI_JPEG_ENC_CUDA_TIME $GUETZLI_JPEG_DEC_CUDA_TIME "$d/$image_name"_jpegGUETZLI_cuda_"$f.jpg" "$d/$image_name"_jpegGUETZLI_cuda_"$f.$image_ext" $guetzli_quality_1_100 "true"
        # writeSVC "GUETZLI OPENCL" $image_filename $GUETZLI_JPEG_ENC_OPENCL_TIME $GUETZLI_JPEG_DEC_OPENCL_TIME "$d/$image_name"_jpegGUETZLI_opencl_"$f.jpg" "$d/$image_name"_jpegGUETZLI_opencl_"$f.$image_ext" $guetzli_quality_1_100 "true"
        
        echo "guetzli finish"
        
        echo "" >> result_statistic.csv
        echo "" >> result_statistic.csv 
        echo "" >> result_statistic.csv
    done 
}

# guetzliTest
# echo "guetzli cuda finish"
# read a

## ----------------------------------- Compare All Formats   
for f in $(seq 1 "${#image_path_arr[@]}")
do

    image_filename=${image_path_arr[$f-1]} 

    writeSVCHeader $image_filename

    magick convert $image_filename $d/"$image_name"_jpeg_turbo_$f.ppm 
    magick convert $image_filename $d/"$image_name"_jpegMOZ_$f.ppm 
    
    ## AVIF 
    AVIF_ENC_TIME=$(../shared/getproctime.sh "avifenc -c aom -y 420 --min 0 --max 63 -s 5 -j 6 -a end-usage=q -a tune=ssim -a cq-level=$avif_quality_1_63 $image_filename $d/"$image_name"_avif_$f.avif")
    AVIF_DEC_TIME=$(../shared/getproctime.sh "avifdec $d/"$image_name"_avif_$f.avif $d/"$image_name"_avif_$f.$image_ext") 
    
    ## JPEG XL 
    JXL_ENC_TIME=$(../shared/getproctime.sh "cjxl $image_filename $d/"$image_name"_jxl_$f.jxl -q $jxl_quality_1_100 --lossless_jpeg=0")
    JXL_DEC_TIME=$(../shared/getproctime.sh "djxl $d/"$image_name"_jxl_$f.jxl $d/"$image_name"_jxl_$f.$image_ext")  

    ## JPEG libjpeg witch embeded in ImageMagick 
    IMJPEG_ENC_TIME=$(../shared/getproctime.sh "magick convert $image_filename -quality $im_jpeg_quality_1_100 $d/"$image_name"_jpeg_$f.jpg")
    IMJPEG_DEC_TIME=$(../shared/getproctime.sh "magick convert $d/"$image_name"_jpeg_$f.jpg $d/"$image_name"_jpeg_$f.$image_ext")

    ## WebP 
    WEBP_ENC_TIME=$(../shared/getproctime.sh "cwebp $image_filename -q $webp_queality_1_100 -m 6 -o $d/"$image_name"_webp_$f.webp") 
    WEBP_DEC_TIME=$(../shared/getproctime.sh "dwebp $d/"$image_name"_webp_$f.webp -o $d/"$image_name"_webp_$f.$image_ext") 
    
    ## FLIF 
    FLIF_ENC_TIME=$(../shared/getproctime.sh "flif -e -Q $flif_quality_1_100 --overwrite $image_filename $d/"$image_name"_flif_$f.flif") 
    FLIF_DEC_TIME=$(../shared/getproctime.sh "flif -d -q 100 --overwrite $d/"$image_name"_flif_$f.flif $d/"$image_name"_flif_$f.$image_ext")
    echo "flif finish" 

    ## BPG  
    BPG_ENC_TIME=$(../shared/getproctime.sh "bpgenc -c rgb -m $bpg_quality_1_9 -o $d/"$image_name"_bpg_$f.bpg $image_filename")
    BPG_DEC_TIME=$(../shared/getproctime.sh "bpgdec -o $d/"$image_name"_bpg_$f.$image_ext $d/"$image_name"_bpg_$f.bpg")
    echo "bpg finish"

    # JPEG jpeglib-turbo 
    # ../libs/jpeg/libjpeg-turbo/bin/cjpeg.exe -quality $((f % 2 ? 40 : 50 )) $d/"$image_name"_jpeg_$f.ppm > $d/"$image_name"_jpeg_$f.jpg
    # read a
    START=$(($(date +%s%N)/1000000))
    ../libs/jpeg/libjpeg-turbo/bin/cjpeg.exe -quality $jpeglib_turbo_1_100 $d/"$image_name"_jpeg_turbo_$f.ppm > $d/"$image_name"_jpeg_turbo_$f.jpg
    END=$(($(date +%s%N)/1000000)) 
    JPEG_LIB_TURBO_ENC_TIME=$(($END-$START))
    START=$(($(date +%s%N)/1000000))
    ../libs/jpeg/libjpeg-turbo/bin/djpeg.exe $d/"$image_name"_jpeg_turbo_$f.jpg > $d/"$image_name"_jpeg_turbo_$f.ppm
    END=$(($(date +%s%N)/1000000)) 
    JPEG_LIB_TURBO_DEC_TIME=$(($END-$START)) 
    echo "jpeglib-turbo finish"
    
    ## guetzli 
    GUETZLIF_JPEG_ENC_TIME=$(../shared/getproctime.sh "../libs/jpeg/guetzli/guetzli_windows_x86-64.exe --quality $guetzli_quality_1_100 $image_filename $d/"$image_name"_jpegGUETZLI_$f.jpg")
    GUETZLIF_JPEG_DEC_TIME=$(../shared/getproctime.sh "magick convert $d/"$image_name"_jpegGUETZLI_$f.jpg $d/"$image_name"_jpegGUETZLI_$f.png")
    echo "guetzli finish"
    
    ## mozjpeg 
    START=$(($(date +%s%N)/1000000))
    ../libs/jpeg/mozjpeg/cjpeg-static.exe -quality $mozjpeg_quality_1_100 $d/"$image_name"_jpegMOZ_$f.ppm > $d/"$image_name"_jpegMOZ_$f.jpg
    END=$(($(date +%s%N)/1000000)) 
    MOZJPEG_ENC_TIME=$(($END-$START))
    START=$(($(date +%s%N)/1000000))
    ../libs/jpeg/mozjpeg/djpeg-static.exe $d/"$image_name"_jpegMOZ_$f.jpg > $d/"$image_name"_jpegMOZ_$f.ppm
    END=$(($(date +%s%N)/1000000)) 
    MOZJPEG_DEC_TIME=$(($END-$START)) 
    echo "mozjpeg finish"
    
    # ---------------------------------------------------

    writeSVC "AVIF" $image_filename $AVIF_ENC_TIME $AVIF_DEC_TIME "$d/$image_name"_avif_"$f.avif" "$d/$image_name"_avif_"$f.png" $avif_quality_1_63 "true"
    writeSVC "JPEG XL" $image_filename $JXL_ENC_TIME $JXL_DEC_TIME "$d/$image_name"_jxl_"$f.jxl" "$d/$image_name"_jxl_"$f.png" $jxl_quality_1_100 "true"
    writeSVC "libjpeg Image Magick" $image_filename $IMJPEG_ENC_TIME $IMJPEG_DEC_TIME "$d/$image_name"_jpeg_"$f.jpg" "$d/$image_name"_jpeg_"$f.png" $im_jpeg_quality_1_100 "true" 
    writeSVC "WebP" $image_filename $WEBP_ENC_TIME $WEBP_DEC_TIME "$d/$image_name"_webp_"$f.webp" "$d/$image_name"_webp_"$f.png" $webp_queality_1_100 "true"
    writeSVC "FLIF" $image_filename $FLIF_ENC_TIME $FLIF_DEC_TIME "$d/$image_name"_flif_"$f.flif" "$d/$image_name"_flif_"$f.png" $flif_quality_1_100 "true"
    writeSVC "BPG" $image_filename $BPG_ENC_TIME $BPG_DEC_TIME "$d/$image_name"_bpg_"$f.bpg" "$d/$image_name"_bpg_"$f.png" $bpg_quality_1_9 "true"
 
    magick convert "$d/$image_name"_jpeg_turbo_"$f.ppm" "$d/$image_name"_jpeg_turbo_temp_"$f.png" 
    writeSVC "JPEG jpeglib-turbo" $image_filename $JPEG_LIB_TURBO_ENC_TIME $JPEG_LIB_TURBO_DEC_TIME $d/"$image_name"_jpeg_turbo_$f.jpg "$d/$image_name"_jpeg_turbo_temp_"$f.png" $jpeglib_turbo_1_100 "true"
    rm -r "$d/$image_name"_jpeg_turbo_temp_"$f.png" 

    writeSVC "guetzli" $image_filename $GUETZLIF_JPEG_ENC_TIME $GUETZLIF_JPEG_DEC_TIME "$d/$image_name"_jpegGUETZLI_"$f.jpg" "$d/$image_name"_jpegGUETZLI_"$f.$image_ext" $guetzli_quality_1_100 "true"
    
    magick convert "$d/$image_name"_jpegMOZ_"$f.ppm" "$d/$image_name"_jpegMOZ_temp_"$f.png" 
    writeSVC "mozjpeg" $image_filename $MOZJPEG_ENC_TIME $MOZJPEG_DEC_TIME  $d/"$image_name"_jpegMOZ_$f.jpg "$d/$image_name"_jpegMOZ_temp_"$f.png" $mozjpeg_quality_1_100 "true"
    rm -r "$d/$image_name"_jpegMOZ_temp_"$f.png" 
    
    echo "" >> result_statistic.csv
    echo "" >> result_statistic.csv
    echo "" >> result_statistic.csv

    #  read a
done 


