# Test script on github website
node index.js --filename=github-screenshot --outputDir=out https://github.com

# Test script on index.html test website
node index.js --filename=test-screenshot --outputDir=out file://$PWD/test/index.html