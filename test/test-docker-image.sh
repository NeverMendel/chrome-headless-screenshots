# Test script on github website
docker run -v ${PWD}:/usr/src/app/out --rm nevermendel/chrome-headless-screenshots --filename=github-screenshot https://github.com

# Test script on index.html test website
docker run -v ${PWD}:/usr/src/app/out --rm nevermendel/chrome-headless-screenshots --filename=test-screenshot file:///usr/src/app/out/index.html