%% yorum satırları
% clc -- konsolu temizler
% clear -- oluşturulan değişkenleri temizler ekranı temizlemez
% clear all -- tüm değişkenleri temizler ekranı temizlemez

yariCap = input("bir sayi gir: ");
yukseklik = input("yuksekligi giriniz: ");
sonuc = pi * yariCap^2 * yukseklik;
fprintf("%f\n",sonuc);


%%
% herhangi bir değişkene atama yapmadan kod çalıştırırsak konsolda bunu ans
% değişkenine default olarak atamasını yapar..

% linspace(-5,5) -- belirtilen aralıkta 100 adet sayı oluşturuyor
% length(ans) -- komutu ile oluşturulan sayıların uzunlugunu bulabiliriz.


% sayilar = linspace(1,10,10); -- 3.parametre olarak 10 verdiğimizde 1den
% 10a kadar sayilari oluşturmuş oluyoruz.

%1     2     3     4     5     6     7     8     9    10

% matlabda diziler 1den başlıyor. ve diğer dillerden farklı olarak seçim
% yapılıyor. sayilar[1] değilde sayilar(1) şeklinde seçmemiz lazım.
% dizide belirli kısımları parça parça almak için örneğin 3ten 8e kadar
% olan kısmı almak için sayilar(3:8) yapmamız lazım
%%
saydir = 1:7 % 1den başlayıp 7ye kadar 7de dahil sayip dizi oluşturur

%  1     2     3     4     5     6     7

saydir = 0:10:50 % sıfırdan başla 50ye kadar git ve 10ar artış yap

% 0    10    20    30    40    50

sayilar([1 5 7]) % 3 tane belirli değerleri almak için bu şekilde yazıyoruz

% 1     5     7

sayilar(3) = 33; % değiştirmek için bu şekilde yazıyoruz.
saydir(3) = []; % 3.elemanı yok ediyor
saydir + 100; %% dizinin bütün elemanlarına 100 ekler  
%% dizinin tüm değerlerinin karesini almak istiyorsak aşağıdaki gibi
saydir.^2; % nokta olmadan çalışmıyor.
% bir sayi ile çarpma bölme işlemi yaparken sorun yok ama kare alırken
% matrisi yine kendisiyle çarpacağı için nokta kullanmamız gerekiyor
% yukarıdaki örneği şu şekildede yazabiliriz
saydir.*saydir;
%% 2 matrisi birleştirmek  
a = [1 2 3 4]
b = [5 6 7 8]
[a,b] % şeklinde yazmamız yeterli a matrisinin sonuna ekleme yapacak aşağıdaki gibi bir sonuc olacaktır.
% 1     2     3     4     5     6     7     8
% bunların yanında kendi üzerine ekleme, alt alta ekleme gibi farklı şekilde birleştirme
% yapılabilir
[a;b] % alt satıra geçmek için noktalı virgül yazıyoruz.
 % 1     2     3     4
 % 5     6     7     8
 % örnek1
 [a;b;b;a]
 % örnek2
 [a,a,a,a] % veya [a a a a]
%% hazır fonksiyonlar
zeros(1,10) % tamamı sıfırlardan oluşan 1satır 10 sütun bir matris veya dizi oluşturdu
zeros(10,1) % terside yapılabilir.
ones(10,1) % 1lerden oluşan bir dizi oluşturma
rand(1,10) % sıfır ve bir aralığında random 10 sayı oluşturma
ortalama = mean(ans) % random oluşturulan sayıların ortalamasını mean ile alabiliriz.
%
random = rand(1,10)
random(end) % end bize dizinin son elemanını getiriyor
random(end) = [] % medyanını bulabilmek için garanti olsun diye 1 sayı sildik
random = sort(random) % sayilari sort ile sıralayıp tekrar random değişkenine atama yaptık
median(random) % ile medyan yani ortadaki değeri bulduk. yukarıdaki sıralama işleminin medyan değerine etkisi yok
% sayısal olarak ortadaki değeri bulduk rastgelede olsa aynı sonucu
% verecektir
max(random) % max değer
min(random) % min değer
sum(random) % sayiların toplamı
std(random) % standart sapma
var(random) % varyans 
fliplr(random) % diziyi ters çeviriyor
% 0.9706    0.9572    0.9157    0.8003    0.7922    0.4854    0.4218    0.1576    0.1419

random' % transpoz alma
%     0.1419
%     0.1576
%     0.4218
%     0.4854
%     0.7922
%     0.8003
%     0.9157
%     0.9572
%     0.9706

flipud(ans) % transpoz alınmıştı. bunu ters çevirme işlemi
%     0.9706
%     0.9572
%     0.9157
%     0.8003
%     0.7922
%     0.4854
%     0.4218
%     0.1576
%     0.1419




