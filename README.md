# Chrome Headless Screenshots

Node.js script and Docker image to take screenshots of webpages with Chrome headless and [Puppeteer](https://github.com/puppeteer/puppeteer).

Pull requests are welcome.

## How to use it

### Node.js

Run `yarn install` to install all the required dependencies and then execute the index.js file with node like in the following example.

```
node index.js https://github.com
```

### Docker

You can either build your own Docker image or you can use the pre-build one `nevermendel/chrome-headless-screenshots`

Build the Docker image:

```
docker build -t chrome-headless-screenshots .
```

To take a screenshot with a Docker container run:

```
docker run -it -v ${PWD}:/usr/src/app/out --rm nevermendel/chrome-headless-screenshots https://github.com
```

## Script usage

```
index.js [options] <url>

Take a screenshot of a webpage

Positionals:
  url  Url of the webpage you want to take a screenshot of                                          [string]

Options:
  -h, --help         Show help                                                                     [boolean]
  -v, --version      Show version number                                                           [boolean]
      --width        Viewport width                                                 [number] [default: 1920]
      --height       Viewport height                                                [number] [default: 1080]
      --outputDir    Output directory, defaults to current directory                 [string] [default: "."]
      --filename     Filename of the produced screenshot                    [string] [default: "screenshot"]
      --inputDir     Input directory, defaults to current directory                  [string] [default: "."]
      --userAgent    User agent                                                       [string] [default: ""]
      --cookies      Cookies in json format as string                                 [string] [default: ""]
      --cookiesFile  Path of the file containing the cookies                          [string] [default: ""]
      --delay        Delay before taking the screenshot in ms                          [number] [default: 0]
      --format       Image format of the screenshot
                                                  [string] [choices: "png", "jpeg", "webp"] [default: "png"]

Examples:
  index.js https://github.com                             Take a screenshot of https://github.com and save
                                                          it as screenshot.png
  index.js --cookiesFile=cookies.json https://google.com  Load the cookies from cookies.json, take a
                                                          screenshot of https://google.com and save it as
                                                          screenshot.png
```

## License

[MIT Licence](LICENSE.md)
