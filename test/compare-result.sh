# Compare the screenshot of test website
compare_result=$(compare -metric MSE test-screenshot.png screenshot.png /dev/null 2>&1)
if [[ "$compare_result" == "0 (0)" ]]; then
    echo "No difference found!"
else
    echo "Difference detected: " $compare_result
    exit 1
fi