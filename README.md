# HALAMAN LOGIN MIKROTIK ASRAMA MAHASISWA SULAIMANIYAH YOGYAKARTA

  [![Platform](https://img.shields.io/badge/platform-Android-green.svg)](http://developer.android.com/index.html) [![Kotlin](https://img.shields.io/badge/kotlin-1.3.72-blue.svg)](http://kotlinlang.org) [![Gradle](https://img.shields.io/badge/gradle-4.0.0-%2366DCB8.svg)](https://developer.android.com/studio/releases/gradle-plugin)

Repository ini berisi file-file yang diperlukan untuk membangun halaman login Mikrotik yang digunakan di Asrama Mahasiswa Sulaimaniyah Yogyakarta. Repository ini mencakup dokumen HTML, CSS, dan JavaScript dasar yang umumnya digunakan pada halaman login Mikrotik, serta beberapa vendor library tambahan seperti typewriter.js, particle.js, dan jQuery untuk meningkatkan interaktivitas dan tampilan halaman login.

![enter image description here](https://raw.githubusercontent.com/bapakpandha/bapakpandha.github.io/main/images/login_page.webp)

--



## Struktur Repository

```
+---Backup
+---hotspot
|   |   alogin.html
|   |   error.html
|   |   errors-indo.txt
|   |   errors.txt
|   |   expired.html
|   |   favicon.png
|   |   login.html
|   |   logout.html
|   |   md5.js
|   |   radvert.html
|   |   redirect.html
|   |   rlogin.html
|   |   status.html
|   |   style.css
|   |
|   +---css
|   |       login_style.css
|   |       style_status.css
|   |
|   +---font
|   |   |   a.ttf
|   |   |   fontello.eot
|   |   |   fontello.svg
|   |   |   fontello.ttf
|   |   |   GilliganShutter.c468c61f.ttf
|   |   |   LondrinaOutline-Regular.ttf
|   |   |   Metropolis-Bold.6afb7f47.ttf
|   |   |   Metropolis-Medium.1d9e6430.ttf
|   |   |   Metropolis-Regular.1ad48b75.ttf
|   |   |   Metropolis-SemiBold.74834d23.ttf
|   |   |   Poppins-Medium.ttf
|   |   |   Quicksand-Bold.ttf
|   |   |
|   |   \---font_login
|   |           fontello.css
|   |           fontello.eot
|   |           fontello.svg
|   |           fontello.ttf
|   |           fontello.woff
|   |           fontello.woff2
|   |
|   +---img
|   |       bg-home.gif
|   |       bg-inner.png
|   |       favicon.ico
|   |       logo.png
|   |       logodky.png
|   |       logo_putih.png
|   |       logo_uicci.webp
|   |
|   \---js
|       |   custom.js
|       |   login_script.js
|       |   status_script.js
|       |
|       +---jquery
|       |       jquery.min.js
|       |
|       +---particles
|       |       app.js
|       |       particles.min.js
|       |
|       \---typed
|           \---typewriterjs-master
|               \---typewriterjs-master
|                   +---.circleci
|                   |       config.yml
|                   |
|                   +---dist
|                   |       core.js
|                   |       react.js
|                   |
|                   +---src
|                   |   +---core
|                   |   |   |   constants.js
|                   |   |   |   index.js
|                   |   |   |   Typewriter.js
|                   |   |   |
|                   |   |   \---__test__
|                   |   |       |   Typewriter.spec.js
|                   |   |       |
|                   |   |       \---__snapshots__
|                   |   +---react
|                   |   |   |   index.js
|                   |   |   |   Typewriter.js
|                   |   |   |
|                   |   |   \---__test__
|                   |   |           Typewriter.spec.js
|                   |   |
|                   |   \---utils
|                   |       |   add-styles.js
|                   |       |   does-string-contain-html-tag.js
|                   |       |   get-dom-element-from-string.js
|                   |       |   get-random-integer.js
|                   |       |   index.js
|                   |       |
|                   |       \---__test__
|                   |               add-styles.spec.js
|                   |               get-dom-element-from-string.spec.js
|                   |               get-random-integer.spec.js
|                   |
|                   \---webpack
|                           common.config.babel.js
|                           development.config.babel.js
|                           production.config.babel.js
|
\---Petunjuk_2022
```

## Fitur

1. **Desain Responsif**: Halaman login yang responsif dan dapat diakses dari berbagai perangkat.
2. **Efek Partikel**: Menggunakan `particles.js` untuk memberikan efek partikel yang menarik pada background halaman login.
3. **Efek Pengetikan**: Menggunakan `typewriter.js` untuk menampilkan teks dengan efek pengetikan dinamis.
4. **Interaktivitas**: Menggunakan `jQuery` untuk menambahkan berbagai interaksi dinamis pada halaman.

## Instalasi

1. Clone repository ini ke komputer Anda:
    ```sh
    git clone https://github.com/bapakpandha/Hotspot-Sulaimaniyah-2022.git
    ```
2. Buka file `login.html` di folder `hotspot` di browser Anda untuk melihat halaman login.

## Penggunaan

1. Edit file `login.html` di folder `hotspot` untuk menyesuaikan konten dan struktur halaman login.
2. Modifikasi `style.css` di folder `hotspot` atau `login_style.css` di folder `css` untuk mengubah gaya dan tampilan halaman sesuai kebutuhan Anda.
3. Tambahkan atau sesuaikan skrip di `login_script.js` di folder `js` untuk menambah fungsionalitas khusus pada halaman login.
