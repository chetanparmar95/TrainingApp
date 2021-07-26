# My Training App

Shows a list of trainings and highlights


## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/chetanparmar95/TrainingApp
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

In order to run this app, you need to start mock server locally to fetch data using REST API

***Running in Android emulator or iOS simulator (Navigate to mock_server folder)***

```
jserver -d database.json 
```

***Running in physical device***

```
jserver -d database.json --host 0.0.0.0
```

Before you run on physical device, change host IP address with your machine IP address in [this](https://github.com/chetanparmar95/TrainingApp/blob/main/lib/repositories/api.dart) file and make sure mobile is connected to the same network


