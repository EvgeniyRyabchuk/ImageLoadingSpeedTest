    # enc/dec time data to array 
        AVIF_ENC_TIME_ARR[$f-1]=$AVIF_ENC_TIME
        JXL_ENC_TIME_ARR[$f-1]=$JXL_ENC_TIME
        IMJPEG_ENC_TIME_ARR[$f-1]=$IMJPEG_ENC_TIME
        WEBP_ENC_TIME_ARR[$f-1]=$WEBP_ENC_TIME
        
        AVIF_DEC_TIME_ARR[$f-1]=$AVIF_DEC_TIME
        JXL_DEC_TIME_ARR[$f-1]=$JXL_DEC_TIME
        IMJPEG_DEC_TIME_ARR[$f-1]=$IMJPEG_DEC_TIME
        WEBP_DEC_TIME_ARR[$f-1]=$WEBP_DEC_TIME



         rm -f ./result_statistic.csv
    touch result_statistic.csv 
    echo "AVIF_ENC_TIME,AVIF_DEC_TIME,JXL_ENC_TIME,JXL_DEC_TIME,IMJPEG_ENC_TIME,IMJPEG_DEC_TIME,WEBP_ENC_TIME,WEBP_DEC_TIME" >> result_statistic.csv
   
   for f in $(seq 1 $generations)
    do
    echo -n "${AVIF_ENC_TIME_ARR[$f-1]}," >> result_statistic.csv
    echo -n "${AVIF_DEC_TIME_ARR[$f-1]}," >> result_statistic.csv

    echo -n "${JXL_ENC_TIME_ARR[$f-1]}," >> result_statistic.csv
    echo -n "${JXL_DEC_TIME_ARR[$f-1]}," >> result_statistic.csv
    
    echo -n "${IMJPEG_ENC_TIME_ARR[$f-1]}," >> result_statistic.csv
    echo -n "${IMJPEG_DEC_TIME_ARR[$f-1]}," >> result_statistic.csv

    echo -n "${WEBP_ENC_TIME_ARR[$f-1]}," >> result_statistic.csv
    echo -n "${WEBP_DEC_TIME_ARR[$f-1]}," >> result_statistic.csv

    echo "" >> result_statistic.csv  
    done 




        # printf '%s\n' "${AVIF_ENC_TIME_ARR[@]}"

# json_object_one_line_cat=$(cat <<EOF
# {"status": "success","message": "Employee list","start": 0,"total_results": 1,"data": [{"empId": "$id","name": "Tim","designation": "Engineer"}]}
# EOF
# )
# echo $json_object_one_line_cat