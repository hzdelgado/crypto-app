# Description

This project is an example application that allows the user to view the information of all crypto coins available in the market.
Coingecko API is used as datasource. GetX was used for state management and ObjectBox as database.

NOTE: This application might not work in iOS simulators running in M1 computers.

# Requirements
 
 - Flutter 3 or above.

## Instructions

Run the following commands before compiling the app:

 - flutter pub get
 - flutter pub run build_runner build [Necessary to create the objectbox and mockito schemas].
