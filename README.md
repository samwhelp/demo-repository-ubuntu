
# demo-repository-ubuntu

「[Demo Ubuntu Repository](https://samwhelp.github.io/demo-repository-ubuntu/) ([GitHub](https://github.com/samwhelp/demo-repository-ubuntu))」


## 套件庫結構

執行

``` sh
$ tree ubuntu
```

顯示

```
ubuntu/
├── dists
│   └── xenial
│       └── main
│           ├── binary-amd64
│           │   └── Packages.gz
│           ├── binary-i386
│           │   └── Packages.gz
│           └── source
│               └── Sources.gz
└── pool
    └── main
        ├── a
        ├── b
        ├── c
        │   └── chewup
        │       ├── chewup_0.1.0_all.deb
        │       ├── chewup_0.1.0.dsc
        │       └── chewup_0.1.0.tar.gz
        ├── d
        ├── e
        ├── f
        ├── g
        ├── h
        ├── i
        ├── j
        ├── k
        ├── l
        ├── m
        ├── n
        ├── o
        ├── p
        ├── q
        ├── r
        ├── s
        ├── t
        ├── u
        ├── v
        ├── w
        ├── x
        ├── y
        └── z

35 directories, 6 files
```


## 操作說明

### 觀看簡易說明

執行

``` sh
$ make
```

顯示

```
Usage: make [command]

Ex:
$ make
$ make help

$ make update

$ make serve

$ make sources-list-install
$ make sources-list-remove

$ make localhost-sources-list-install
$ make localhost-sources-list-remove

$ make github-sources-list-install
$ make github-sources-list-remove
```

### 更新「Packages.gz」和「Sources.gz」

執行

``` sh
$ make update
```

會更新下面三個檔案

* ubuntu/dists/xenial/main/binary-i386/Packages.gz
* ubuntu/dists/xenial/main/binary-amd64/Packages.gz
* ubuntu/dists/xenial/main/source/Sources.gz

詳細的執行動作，可以參考「[bin/update.sh](bin/update.sh)」的內容。


### 設定「sources.list」

有三種可以選擇

#### 「/etc/apt/sources.list.d/demo-local.list」

執行

``` sh
$ make sources-list-install
```

會產生「/etc/apt/sources.list.d/demo-local.list」這個檔案，

然後就需要執行「`sudo apt-get update`」。

若要移除「/etc/apt/sources.list.d/demo-local.list」這個檔案，

就要執行

``` sh
$ make sources-list-remove
```

詳細的執行動作，可以參考「[bin/sources-list-install.sh](bin/sources-list-install.sh)」和「[bin/sources-list-remove.sh](bin/sources-list-remove.sh)」的內容。


#### 「/etc/apt/sources.list.d/demo-localhost.list」

執行

``` sh
$ make localhost-sources-list-install
```

會產生「/etc/apt/sources.list.d/demo-localhost.list」這個檔案，

然後執行

``` sh
$ make serve
```

然後再執行「`sudo apt-get update`」，


若要移除「/etc/apt/sources.list.d/demo-localhost.list」這個檔案，

就要執行

``` sh
$ make localhost-sources-list-remove
```

詳細的執行動作，可以參考「[bin/localhost-sources-list-install.sh](bin/localhost-sources-list-install.sh)」和「[bin/localhost-sources-list-remove.sh](bin/localhost-sources-list-remove.sh)」的內容。

#### 「/etc/apt/sources.list.d/demo-github.list」

執行

``` sh
$ make github-sources-list-install
```

會產生「/etc/apt/sources.list.d/demo-github.list」這個檔案，

然後就需要執行「`sudo apt-get update`」。

若要移除「/etc/apt/sources.list.d/demo-github.list」這個檔案，

就要執行

``` sh
$ make github-sources-list-remove
```

詳細的執行動作，可以參考「[bin/github-sources-list-install.sh](bin/github-sources-list-install.sh)」和「[bin/github-sources-list-remove.sh](bin/github-sources-list-remove.sh)」的內容。


## 相關討論

* [#2 回覆: apt 出現許多錯誤訊息](https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=357764#forumpost357764)
* [簡易的建立自己的套件庫](https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=342070#forumpost342070)
