
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


### 測試

以上面「/etc/apt/sources.list.d/demo-localhost.list」這個為例，

當執行完「`sudo apt-get update`」後，

然後執行

``` sh
$ ls /var/lib/apt/lists/localhost*
```

顯示

```
/var/lib/apt/lists/localhost:8080_ubuntu_dists_xenial_main_binary-amd64_Packages
/var/lib/apt/lists/localhost:8080_ubuntu_dists_xenial_main_binary-i386_Packages
/var/lib/apt/lists/localhost:8080_ubuntu_dists_xenial_main_source_Sources
```

執行

``` sh
$ apt-cache policy
```

顯示

```
Package files:
 100 /var/lib/dpkg/status
     release a=now
 500 http://localhost:8080/ubuntu xenial/main i386 Packages
     release c=main,b=i386
     origin localhost
 500 http://localhost:8080/ubuntu xenial/main amd64 Packages
     release c=main,b=amd64
     origin localhost
...略...
```

執行

``` sh
$ apt-cache policy chewup
```

顯示

```
chewup:
  Installed: 0.1.0
  Candidate: 0.1.0
  Version table:
 *** 0.1.0 500
        500 http://localhost:8080/ubuntu xenial/main amd64 Packages
        500 http://localhost:8080/ubuntu xenial/main i386 Packages
        100 /var/lib/dpkg/status
```

執行

``` sh
$ apt-cache show chewup
```

顯示

```
Package: chewup
Version: 0.1.0
Architecture: all
Maintainer: samwhelp <samwhelp@users.noreply.github.com>
Installed-Size: 80
Depends: python3, python3-gi, gir1.2-gtk-3.0, gir1.2-keybinder-3.0, gir1.2-appindicator3-0.1, libchewing3
Filename: pool/main/c/chewup/chewup_0.1.0_all.deb
Size: 9704
MD5sum: b107311c5a24aa4a205e47b85ae45e00
SHA1: c7de75e8fdaeee37fa7ce276cdb79a199f588326
SHA256: ac9dbdd2b8ca159971a442ccc03a6646a6dae34ef9c9b81337ad7c01e3e67e76
Section: utils
Priority: optional
Description: Chewing user phrase editor and cli util.
Description-md5: 2322dac17ffee7c95c00424e1c3d8b9a
```

執行

``` sh
$ grep '^Package: chewup$' /var/lib/apt/lists/localhost:8080_ubuntu_dists_xenial_main_binary-amd64_Packages -n -A 15
```

顯示

```
1:Package: chewup
2-Version: 0.1.0
3-Architecture: all
4-Maintainer: samwhelp <samwhelp@users.noreply.github.com>
5-Installed-Size: 80
6-Depends: python3, python3-gi, gir1.2-gtk-3.0, gir1.2-keybinder-3.0, gir1.2-appindicator3-0.1, libchewing3
7-Filename: pool/main/c/chewup/chewup_0.1.0_all.deb
8-Size: 9704
9-MD5sum: b107311c5a24aa4a205e47b85ae45e00
10-SHA1: c7de75e8fdaeee37fa7ce276cdb79a199f588326
11-SHA256: ac9dbdd2b8ca159971a442ccc03a6646a6dae34ef9c9b81337ad7c01e3e67e76
12-Section: utils
13-Priority: optional
14-Description: Chewing user phrase editor and cli util.
15-
```

執行

``` sh
$ apt-cache showsrc chewup
```

顯示

```
Format: 1.0
Package: chewup
Binary: chewup
Architecture: all
Version: 0.1.0
Maintainer: samwhelp <samwhelp@users.noreply.github.com>
Standards-Version: 3.9.6
Vcs-Browser: https://github.com/samwhelp/util-chewup
Vcs-Git: https://github.com/samwhelp/util-chewup.git
Build-Depends: debhelper (>= 9), python3 (>= 3.5)
Package-List:
 chewup deb utils optional arch=all
Directory: pool/main/c/chewup
Checksums-Sha1:
 27ba00e07039591d51db24c65befec59ba7d4518 624 chewup_0.1.0.dsc
 915f136125abe936c8e2492a0791eb44103c44a5 60379 chewup_0.1.0.tar.gz
Checksums-Sha256:
 b5d75a1f0e64705639a56d81773f9211c02266463ae611c3a633d070cbd5cd02 624 chewup_0.1.0.dsc
 52f4c9c574a40ce60f64f4729b5f620d62a588cbb25d29478d20bae9616f7a6d 60379 chewup_0.1.0.tar.gz
Files:
 0530e7af0e59891f4ff373afca75ab4e 624 chewup_0.1.0.dsc
 67205d56d31cc4e8950566909ee6babe 60379 chewup_0.1.0.tar.gz
```

執行

``` sh
$ grep '^Package: chewup$' /var/lib/apt/lists/localhost:8080_ubuntu_dists_xenial_main_source_Sources -n -A 22
```

顯示

```
2:Package: chewup
3-Binary: chewup
4-Architecture: all
5-Version: 0.1.0
6-Maintainer: samwhelp <samwhelp@users.noreply.github.com>
7-Standards-Version: 3.9.6
8-Vcs-Browser: https://github.com/samwhelp/util-chewup
9-Vcs-Git: https://github.com/samwhelp/util-chewup.git
10-Build-Depends: debhelper (>= 9), python3 (>= 3.5)
11-Package-List:
12- chewup deb utils optional arch=all
13-Directory: pool/main/c/chewup
14-Checksums-Sha1:
15- 27ba00e07039591d51db24c65befec59ba7d4518 624 chewup_0.1.0.dsc
16- 915f136125abe936c8e2492a0791eb44103c44a5 60379 chewup_0.1.0.tar.gz
17-Checksums-Sha256:
18- b5d75a1f0e64705639a56d81773f9211c02266463ae611c3a633d070cbd5cd02 624 chewup_0.1.0.dsc
19- 52f4c9c574a40ce60f64f4729b5f620d62a588cbb25d29478d20bae9616f7a6d 60379 chewup_0.1.0.tar.gz
20-Files:
21- 0530e7af0e59891f4ff373afca75ab4e 624 chewup_0.1.0.dsc
22- 67205d56d31cc4e8950566909ee6babe 60379 chewup_0.1.0.tar.gz
23-
```

執行下面指令，安裝「[chewup](https://github.com/samwhelp/util-chewup)」這個套件。

``` sh
$ sudo apt-get install chewup
```

執行下面指令，重新安裝「chewup」這個套件。

``` sh
$ sudo apt-get install chewup --reinstall
```

執行下面指令，移除「chewup」這個套件。

``` sh
$ sudo apt-get remove chewup
```

執行下面指令，下載「chewup」這個「[Binary Package](https://wiki.debian.org/Packaging/BinaryPackage)」。

``` sh
$ apt-get download chewup
```

執行下面指令，下載「chewup」這個「[Source Package](https://wiki.debian.org/Packaging/SourcePackage)」，並且解開。

``` sh
$ apt-get source chewup
```

## 相關討論

* [#2 回覆: apt 出現許多錯誤訊息](https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=357764#forumpost357764)
* [簡易的建立自己的套件庫](https://www.ubuntu-tw.org/modules/newbb/viewtopic.php?post_id=342070#forumpost342070)
