qt5-qml-benchmark
=================

Qt5.3.2 QML`s benchmark


## Environment

```
uname -a

Linux archlinux 3.16.2-1-ARCH #1 SMP PREEMPT Sat Sep 6 13:12:51 CEST 2014 x86_64 GNU/Linux
```

```
qmake -v

QMake version 3.0
Using Qt version 5.3.2 in /usr/lib
```

```
lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation Mobile 4 Series Chipset Integrated Graphics Controller (rev 07)
```

```
cat /proc/cpuinfo | grep 'model name'
model name      : Intel(R) Core(TM)2 Duo CPU     T6670  @ 2.20GHz
model name      : Intel(R) Core(TM)2 Duo CPU     T6670  @ 2.20GHz
```

## StackView

```
qmlscene StackViewBenchMark.qml
```


## Canvas

```
chromium pretty-glowing-lines.html
```

```
qmlscene CanvasBenchMark.qml
```
