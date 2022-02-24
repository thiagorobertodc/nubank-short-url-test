Flutter application consuming endpoints and showing their responses on a UI, using clean architeture.

Small application that uses the Flutter tool to consume 2 endpoints and show the user some information. The requested test showed 2 endpoints, but there is no need to consume the last one, as all information is provided in the first endpoint call.

For the application to run, it is necessary to have flutter pre-installed on the machine and an Android emulator or even a physical device with the same operating system. More information on how to install can be obtained from the official flutter documentation, through the link https://flutter.dev/docs/get-started/install.

The application has 2 screens, 1 splash screen and 1 home screen for insert URLs and show a list of the recently shortted URLs.

![nu](https://user-images.githubusercontent.com/39418250/155447813-d085c597-156c-4708-8df7-1b5c405d7de4.png)

Example of the application in use above.

The code is written using Clean Architecture - or Clean Architecture. In the Domain and Data layers, I define the required entities that will be returned by the endpoint. In addition, the use cases for API calls are described. There is a high degree of modularization aimed at greater maintainability in the future. In the Presentation and UI layers, I define how the screens and functions that call the business rules defined in the previous layers will be formed. Finally, on the Main layer, all the pages are assembled. Some extra components are used like HTTP packages, Providers and etc.
