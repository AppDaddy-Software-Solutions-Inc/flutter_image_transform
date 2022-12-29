Transforming images can be CPU intensive and cause "jank" in the Flutter UI. This package provides a set of image transforms that run in a 
separate thread to the main UI. 

The resulting image is returned as a Data Url (data:...) when the transformation is complete. This is a very basic set of transformations
and will be enhanced in the coming days. 

## Features

Provides a basic set of image transforms that can be executed in a separate thread. It uses Isolates (mobile, desktop) and Web Workers (web)
via a simple wrapper to the Sqaudron Package. 

## Getting started

For web execution, the "web/workers" folder and all of its contents must be copied to the web folder of your project. 

## Usage

Example: Coming soon. 

## Additional information
