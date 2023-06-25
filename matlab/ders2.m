%% matris oluşturmayı bir hatırlayalım
a = [1 2 3 4]
% veya
a = [1,2,3,4]
% veya alt alta
a = [1;2;3;4]
% çok satır ve çok sutunlu oluşturma
a = [1 2 3 4 ;
    5 6 7 8 ; 
    9 10 11 12]
b = [1 2; 3 4; 5 6; 7 8]
% a ve b matrisini çarpabilmek için matris boyutlarının uygun olması
% gerekir
a(3,:) = [] % 3.satır virgülden sonraki sütunun tamamını belirtmek için ':'
a*b; 
% birebir çarpma işlemi için nokta kullanıyorduk ama 2 matrisinde eşit
% boyutları olmalı
% bu yüzden b matrisini transpoz alırsak eşit olur 
a.*b % ile birebir çarpım yapabiliriz.
%% birebir çarpımı kare matris ile daha net görebiliriz
a = [1 2; 3 4]
% 1     2
% 3     4

a*a
% 7    10
% 15    22

a.*a
% 1     4
% 9    16
%% matris toplama ve çıkarma işlemleride birebir şeklinda oluyor
a = [1 2; 3 4]
% 1     2
% 3     4

a+a
%  2     4
%  6     8

a-2
% -1     0
%  1     2
%% matrisde seçim işlemlerini tekrar edelim
a = magic(5) % tam sayılardan oluşan 5x5 bir matris oluşturuyor
%     17    24     1     8    15
%     23     5     7    14    16
%      4     6    13    20    22
%     10    12    19    21     3
%     11    18    25     2     9

a(3,4) % tek bir değeri 3.satır 4.sütunun kesiştiği yerdeki değeri verir
% örneğin 4.satır ve tüm sutunları almak istiyorsak
a(4,:) % şeklinde alabiliriz
%  10    12    19    21     3

a(:,2)
%     24
%      5
%      6
%     12
%     18

% 1.sütunda 2.satırdan 4e kadar olan ve 4de dahil satırları almak istersek
a(2:4,1)
%     23
%      4
%     10

% örneğin a matrisinden 2x2 veya 2x3lük matris almak istersek
a(3:4, 2:4)
%     6    13    20
%     12    19    21

% (satirlar, sütunlar)

a([2,3,4],2) % şeklinde bir kullanımda yapılabiliyor.
%     5
%      6
%     12

% a matrisinden aşağıdaki matrisi elde etmek için
% 17 8
% 11 2
a([1,5],[1,4]) % şeklinde bir seçim yapabiliriz.
%% indis olarakta seçim yapabiliyoruz
% a matrisinin 17. elemanı 14tür
a(17)

% aynı şekilde indisten indisede seçim yapılabilir
a(4:9)
% 10    11    24     5     6    12

% 1.elemandan başlayıp sona kadar 5er artarak seçip yapabliriz
a(1:5:end)
% 17    24     1     8    15

% görüldüğü gibi matriste indis yukarıdan aşağı doğru gidiyor

a(1:2:end)
% 17     4    11     5    12     1    13    25    14    21    15    22     9
%% a matrisi üzerinde  b gibi bir kare matrise denk gelen matrisi alabiliriz
b = [2 3; 5 1] % b matrisi bu olsun

a(b) % yaptığımızda b matrisi a üzerinde 2 ve 3. indis 5 ve 1.indis olarak değerleri getirir
%     23     4
%     11    17
%%
b = [a a]
b = [a a;a a]
size(b) %% bize b matrisinin 10x10 luk bir matris olduğunu söylüyor
%% 3 boyutlu matrisler
a = [1 2; 3 4]
b = [5 6; 7 8]
% satir, sutün, katman
c(:,:,1) =a; % c nin 1.katmanı a olmuş oldu
c(:,:,2) =b; % c nin 2.katmanı b olmuş oldu
% sonuc olarak küp gibi birşey ortaya çıkıcak ama görüntüleyemiyoruz
% c matrisinin çıktısı aşağıdaki gibi

% c(:,:,1) =
% 
%      1     2
%      3     4
% 
% 
% c(:,:,2) =
% 
%      5     6
%      7     8
% küp gibi olacağına göre örneğin 3ün karşısında 7 olur bunun 2sini
% seçebilmek için
% (2.satır, 1.sütun, tüm katmanlar)
c(2,1,:) % gibi yazabiliriz.
%%
eye(5) % köşegeni 1 olan diğerleri sıfır olan bir matris oluşturuyor

% a =
% 
%      1     2
%      3     4

a* inv(a) % köşegeni bir olan bir matris haline getiriyor.

%%
d = magic(5) % 5x5lik matrix
sum(d)
% sütun sütun toplama işlemi yapıyor.
% 65    65    65    65    65
sum(sum(d)) % tamamını toplamak için
% veya farklı bir kullanım aşağıdaki gibi
sum(d,'all')
%
sum(d,2)

%     65
%     65
%     65
%     65
%     65
%% grafik çizdirme
x = [1:100];
y = rand(1,100);
plot(x,y)
% başka bir grafik
stem(x,y)
%% fonksiyon oluşturma.
% hacimHesapla fonksiyonu yazdıktan sonra dosya isminide aynı yazıyoruz
% konsolda çalıştırmak için
% hacimHesapla(2,3) gibi çağıdabiliriz. 

% hacim return edilecek değer bunu belirtiyoruz 
% birden fazla değer return edeceksek köşeli parantez içerisinde
% yazmamız gerek örneğin [alan hacim]

% function hacim = hacimHesapla(r,yukseklik)
%     alan = pi * r^2;
%     hacim = alan * yukseklik;
% end

%% döngüler, şart ifadeleri

% 1den 10a kadar sayilari yazdırma
for i= 1:10
    i
end

%10dan 1e kadar 1er azalarak gitmesini istersek
for i=10:-1:1
    i
end
% while kullanımı
i = 0;
while i < 10 
    i = i+1
end 

%% karşılaştırma
% == eşit
% ~= eşit değil
%  && and
i=0;
if i==0
    disp('sıfır');
else
    disp('sıfır değil');
end




