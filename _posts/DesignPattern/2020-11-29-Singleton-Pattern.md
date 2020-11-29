---
title: Singleton Pattern
author: hoseongPark
date: 2020-11-29 20:43:00 +900
categories: [OOP, Design Pattern]
tags: [design pattern]
---

## ***Sington Pattern***
*전체 프로세스 중 단 한나의 객체만이 존재해야 할 경우 사용하는 패턴입니다.*

<br>

> ***싱글턴 패턴 예제***

웹 화면에서 보이는 Dark Mode & Light Mode 경우
   - 하나의 설정값으로 모든 화면을 똑같이 설정해줘야하기때문에 싱글톤을 활용하여 구현합니다.

<br>

> ***Pattern UML***

![singleton uml](/assets/img/design-pattern/singleton.png){: width="650" class="normal"}

<br>

> ***Code***

getSettings Method를 보면 settings 객체가 null이면 생성하고, null이 아니면 있는 객체를 돌려주는것을 볼수있습니다.   
따라서 하나의 객체를 return 해줍니다.

```java
package singleton;

public class Settings {

    private Settings () {};
    private static Settings settings = null;

    public static Settings getSettings() {
        if (settings == null) {
            return settings = new Settings();
        } else {
            return settings;
        }
    }

    private boolean darkMode = false;
    private int fontSize = 13;

    public boolean getDarkMode() {return darkMode;}
    public int getFontSize() {return fontSize;}

    public void setDarkMode(boolean darkMode) {
        this.darkMode = darkMode;
    }

    public void setFontSize(int fontSize) {
        this.fontSize = fontSize;
    }
}
```
<div style="text-align: right"> Settings.java </div>
<br>

FirstPage에서 Settings객체를 직접 생성하는것이 아닌 getSettgins Method를 통해 instance를 가져옵니다 (중요!)

```java
package singleton;

public class FirstPage {
    private Settings settings = Settings.getSettings();

    public void setAndPrintSettings() {
        settings.setDarkMode(true);
        settings.setFontSize(15);

        System.out.println(settings.getDarkMode() + " " + settings.getFontSize());
    }
}
```
<div style="text-align: right"> FirstPage.java </div>
<br>

SecondPage또한 getSettings로 Settings instance를 가져옵니다.

```java
package singleton;

public class SecondPage {
    private Settings settings = Settings.getSettings();

    public void printSettings() {
        System.out.println(settings.getDarkMode() + " " + settings.getFontSize());
    }
}
```
<div style="text-align: right"> SecondPage.java </div>
<br>

```java
package singleton;

public class Main {
    public static void main(String[] args) {
        new FirstPage().setAndPrintSettings();
        new SecondPage().printSettings();
    }
}
```
<div style="text-align: right"> Main.java </div>
<br>

> ***Result***

![result](/assets/img/design-pattern/singletonResult.png)