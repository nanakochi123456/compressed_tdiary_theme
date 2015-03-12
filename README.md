Compressed tDiary theme Copyright (c) 2015 nano

Webのアクセス速度向上の為に、少しでも圧縮した tDiary テーマです。


※注：以下の部分のみ、こちらは著作権を主張いたします。

src/ 以下のツールのみ。

それ以外の部分は、GPL2 に従い、配布をしています。

■注意

一部のファイルは、圧縮前よりごくわずか（数バイト）程増えているものがあります。

圧縮したことにより、動作しないファイルが存在するかもしれません。


圧縮には、以下のツールを使用しています。

CSS - CSS Packer perl
https://github.com/nevesenin/css-packer-perl

JavaScript - Javascript Packer perl
https://github.com/nevesenin/javascript-packer-perl

png - optipng
https://github.com/martinkozak/optipng

jpeg - mozjpeg
https://github.com/mozilla/mozjpeg

.css.gz / .js.gz - 7zip
http://sevenzip.sourceforge.jp/


CSS / JavsScriptを高速配信するには？
Apacheの場合、以下を .htaccessに追加して下さい。うまく動くかもしれません。
（でないと、いんたぁなる、さぁばぁ、えらーとなります）

特別、既に書かれている、hoge.css を hoge.css.gz に書き換える必要はありません。

RewriteEngine on
RewriteCond %{HTTP:Accept-Encoding} gzip
RewriteCond %{REQUEST_FILENAME}\.gz -s
RewriteRule .+ %{REQUEST_URI}.gz

<FilesMatch "\.css\.gz$">
	ForceType   text/css
	AddEncoding x-gzip .gz
</FilesMatch>

<FilesMatch "\.js\.gz$">
	ForceType   application/x-javascript
	AddEncoding x-gzip .gz
</FilesMatch>


以下、tdiary theme 同梱の README.md

# English Information

This package is "themes" of design templates for tDiary <http://www.tdiary.org>.
For using, copy each themes directory into 'theme' direcroty of tDiary. 
 
See licenses and copyrights in each theme files. If no license or copyright, it can be distoributed by GPL2, and it has a copyright below: 

```
Copyright (c) 2005 TADA Tadashi <sho@spc.gr.jp> 
```

# Japanese Information

このパッケージは、tDiary <http://www.tdiary.org>のデザインテンプレートである「テーマ」を集めたものです。tDiaryインストールディレクトリ配下にあるthemeディレクトリの下に、各テーマのディレクトリごとコピーしてお使いください。
 
著作権およびライセンスは各テーマのファイルに記述してあるものに従いますが、特に明記されていない場合、配布条件はGPL2、著作権は以下になります。

```
Copyright (c) 2005 TADA Tadashi <sho@spc.gr.jp> 
``` 
