<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Database</title>
</head>
<body>
    <%@ page import="java.util.Arrays" %>
    <%@ page import="java.util.ArrayList" %>
    <% 
    
    Integer [] Id = {
        1,
        2,
        3,
        4,
        5,
        6
    };

    int sizeList = Id.length;
    
    String [] category = {
        "Tech",
        "Tech",
        "Banking",
        "Banking",
        "Food n Beverage",
        "Food n Beverage"
    };
    
    String [] name = {
        "Traveloka",
        "Tokopedia",
        "Jenius",
        "Dana",
        "Haus",
        "Hangry"
    };

    String [] description = {
        "Traveloka merupakan startup yang memberikan layanan lengkap meliputi pemesanan tiket pesawat, booking hotel secara daring dan layanan lainnya yang terkait perjalanan dan akomodasi. Startup ini didirikan pada tahun 2012 dan sudah beroperasi secara aktif di hampir semua wilayah di Indonesia.",
        "Tokopedia merupakan salah satu situs jual beli online di Indonesia yang perkembangannya terhitung cepat dan memiliki tujuan untuk memudahkan setiap masyarakat di Indonesia, agar dapat melakukan aneka transaksi jual beli secara online.",
        "Jenius adalah sebuah aplikasi perbankan digital. Aplikasi ini membantu penggunanya melakukan aktivitas finansial seperti menabung, bertransaksi, atau mengatur keuangan serta memungkinkan nasabah untuk memiliki rekening bank. Semua dilakukan dari satu tempat, dari ponsel, baik yang berbasis Android maupun iOS. Aplikasi ini diluncurkan oleh Bank BTPN pada 11 Agustus 2016, setelah menjalani masa pengembangan selama 18 bulan dengan total nilai investasi Rp500 miliar. Dalam operasinya, Jenius terkoneksi dengan ekosistem perbankan nasional dan sistem pembayaran internasional melalui kartu debit Visa dan Gerbang Pembayaran Nasional (GPN).",
        "Dana adalah layanan keuangan digital yang berbasis di Jakarta, Indonesia, yang berperan sebagai pembayaran digital untuk menggantikan dompet konvensional. Didirikan sejak tahun 2018, DANA merupakan dompet digital yang terdaftar di Bank Indonesia dengan memiliki empat lisensi diantaranya sebagai uang elektronik, dompet digital, kirim uang, dan Likuiditas Keuangan Digital (LKD).",
        "PT. Inspirasi Bisnis Nusantara merupakan perusahaan yang bergerak di bidang Food & Beverage dan dikenal dengan brand \"Haus!\" yang menyediakan minuman dan makanan kekinian yang di gandrungi oleh generasi milenial dengan berbagai macam varian rasa serta harga yang terjangkau. Saat ini Haus! sudah memiliki 126 cabang outlet di Jabodetabek, Bandung dan Surabaya. Selain ekspansi ke kota-kota besar di Indonesia, Haus! juga akan terus melakukan pengembangan dan inovasi.",
        "Dibangun pada tahun 2019, Hangry hadir sebagai jawaban untuk berbagai momen \"mau makan apa?\" dengan membangun multi-brand restoran cepat saji yang menjual beragam jenis kuliner lokal hingga mancanegara."
    };
    
    String [] location = {
        "Jakarta, Indonesia",
        "Jakarta, Indonesia",
        "Jakarta, Indonesia",
        "Jakarta, Indonesia",
        "Jakarta, Indonesia",
        "Jakarta, Indonesia"
    };

    Integer [] investment_stock = {
        10,
        15,
        20,
        25,
        30,
        35
    };

    Integer [] investment_target = {
        110000,
        120000,
        130000,
        140000,
        150000,
        160000
    };

    String [] image = { 
        "../assets/companies/traveloka.jpg",
        "../assets/companies/tokopedia.jpg",
        "../assets/companies/jenius.jpg",
        "../assets/companies/dana.jpg",
        "../assets/companies/haus.jpg",
        "../assets/companies/hangry.jpg"
    };
    
    String [] email = {
        "cs@traveloka.com",
        "care@tokopedia.com",
        "btpncare@btpn.com",
        "help@dana.id",
        "hello@haus.co.id",
        "contact@ishangry.com"
    };

    String [] phone = {
        "+62 21-2910-3300",
        "0853 1111 1010",
        "1500360",
        "1500 445",
        "0877-9789-9666",
        "+62 817 5092 000"
    };

    String [] url = {
        "https://www.traveloka.com/",
        "https://www.tokopedia.com/",
        "https://www.jenius.com/",
        "https://www.dana.id/",
        "https://haus.co.id/",
        "https://www.ishangry.com/"
    };

    String [] founded = {
        "2012",
        "2009",
        "2016",
        "2018",
        "2018",
        "2019"
    };  
   
    String [] shortDescription = {
        "Solution for your lifestyle needs from flight, hotel, train, and more.",
        "Indonesian technology company specializing in e-commerce.",
        "Digital banking and part of PT Bank BTPN Tbk.",
        "Indonesia\'s digital wallet that can be counted on anytime, anywhere.",
        "Spreading Happiness to Everyone Through Cup of Drink",
        "Satisfy your cravings here!"
    };
    %>
</body>
</html>