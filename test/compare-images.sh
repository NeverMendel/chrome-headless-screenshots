# Compare the screenshot of test website

# Configuration
total_pixels=$(echo "1920 * 1080" | bc)
threshold=0.00001
maximum_difference=$(echo "$total_pixels * $threshold" | bc -l)

# Check how many pixels are different between the two images
compare_result=$(compare -metric AE $1 $2 /dev/null 2>&1)

# Change scientific notation format for bc
compare_result=$(sed 's|e+|*10^|g' <<< $compare_result)

# Different flag
different=$(echo "$compare_result <= $maximum_difference" | bc -l)

if [[ $different = 1 ]]; then
    echo "No difference found! In the 1920x1080 screenshot there are $compare_result different pixels, threshold is $maximum_difference pixels."
else
    echo "Difference detected. In the 1920x1080 screenshot there are $compare_result different pixels, threshold is $maximum_difference pixels."
    exit 1
fi