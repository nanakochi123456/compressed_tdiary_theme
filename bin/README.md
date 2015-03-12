compressed_tdiary_theme
Copyright 2015 @nanakochi123456
Copyright (c) 2005 TADA Tadashi <sho@spc.gr.jp> 
========

■概要

tDiary (http://www.tdiary.org/) のテーマを単純に以下のように圧縮した
パッケージです。

png = optipng
https://github.com/martinkozak/optipng

jpg = mozjpeg
https://github.com/martinkozak/optipng

css = CSS Packer ( + gz with 7zip)
https://github.com/nevesenin/css-packer-perl/

JavaScript = JavaScript Packer ( + gz with 7zip)
https://github.com/nevesenin/javascript-packer-perl

■使い方

optipng、mozjpeg を適時インストールします。

CSS Packer の Packer.pm を CSS/ に設置します。

JavaScript Packer の Packer.pm を JavaScript/ に設置します。

カレントディレクトリに tdiary をフォルダ名ごと展開します。

make.sh を適時書き換えて実行します。 (cygwinでは、0m.batを適時書き換えて実行）

.css.gz / .js.gz を使用する場合、.htaccessに以下を追加します。(Apacheの場合）

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

■バグ
ごくわずかに、再圧縮後のサイズが数バイト大きくなっているファイルがあります。

圧縮済パッケージが、圧縮前パッケージより肥大化しているのは、オリジナルファイルを保持したり、gzip圧縮/非圧縮の双方を設置しているためです。

■オリジナル

https://github.com/tdiary/tdiary-theme

及び、過去のアーカイブ

■配布条件

配布条件はGPL2に従います。
