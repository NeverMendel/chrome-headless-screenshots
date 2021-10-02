# Compare the screenshot of test website
compare_result=$(compare -metric MSE test-screenshot.png screenshot.png /dev/null 2>&1)
if [[ "$compare_result" == "0 (0)" ]]; then
    echo "Screenshots are equal"
else
    echo "Screenshots are different. Difference detected: " $compare_result
    exit 1
fi