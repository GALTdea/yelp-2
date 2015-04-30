# CIS-550 Project: Yelp Dataset Challenge

## Group
* Isaac Anthony, ianthony@seas
* Michael McLaughlin, mvm@seas
* James Smith, jamsmit@seas
* Rebecca Star, rstar@seas

## Motivation
To give users a visual way to consume the Yelp data. Sometimes a shopper or diner has a general idea of where they want to shop or eat, but no more specific idea than that. By looking at heatmaps, users will be able to see which areas of a city offer the best selection of interesting and useful places to visit. This will also be useful for potential business owners to identify areas underserved by businesses so as to open new markets in the city.

## Features
This application will be composed primarily of a heatmap visualization of the Yelp businesses. This will allow visitors to see which areas of the included cities have the highest concentrations of places to eat and shop. We will also implement basic filtering, so that the user can not only see all businesses, but also filter to just see restaurants, 4 or 5 star businesses, those with recent reviews, or other chosen filters.

## Directory Structure
/preprocessing: This folder contains all the Ruby and Python scripts used in preprocessing the data for upload to the Oracle Database.

/app: This folder is the root directory for the Ruby on Rails application. All of our custom back-end code including models and controllers can be found in /app/app. All of our custom front-end code including views and scripts can be found in /app/public.

The application can be run locally by navigating to /app on the command line and issuing the following commands: 1) bundle install, 2) rails server. Then, in a browser navigate to localhost:3000.
