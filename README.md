# Markup Text

### Introduction:

MarkupText is a powerful tool for applying linkability to texts in your Flutter applications. With this package, users can easily designate their desired texts as linkable by using the @{} tag, and clicking on them will redirect them to the intended destination.

![image](https://github.com/real-ali/markup_text/blob/main/image.png)

### Usage Guide:
1.  Installation and Import: Begin by adding the MarkupText package to your project's pubspec.yaml file and then click on the Packages Get button to install the package in your project.

2.  Put the content you want to be branded to create an action inside @{...} tag.

```dart
String text = "This is a sample @{text}. Place the @{text} you want to link inside @{}";
```
3.  Adding Actions to Links: To perform actions such as opening a new page or executing specific operations when a link is clicked, as follows.
```dart
MarkupText(
      text: text,
      marks: [
        Mark("text", () {
          print("Some info for Example");
        }),
      ],
);
```
‍‍

4.  You can apply your desired styles to the texts.
```dart
textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
```
```dart
marksStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
```



With the MarkupText package, you can effortlessly add linkability to your texts, providing an interactive experience for your users.


## Additional information

A Package Developed by Ali Hosseini

Please, report the bugs through the Github repository:
https://github.com/real-ali/markup_text/issues