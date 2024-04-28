## Getting Started
1. install flutter https://www.youtube.com/watch?v=PR_1OBaZ_2I

## If unable to boot simulator
1. https://www.youtube.com/watch?v=CZqO_tskaPY

## when running app
1. cd event
2. open -a Simulator && flutter run

## If not launching
1. cd ios
2. pod deintegrate 
3. delete Podlock and pod file
4. flutter clean
5. cd ..
6. flutter pub get
7. cd ios
8. pod install
9. pod repo update 

## google cloud intstall
0. Install https://cloud.google.com/sdk/docs/install#mac
1. Unzip file
2. Move to users/you/ then drop the downloads their
3. ./google-cloud-sdk/install.sh
4. ./google-cloud-sdk/bin/gcloud init
