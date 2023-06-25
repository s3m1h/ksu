# -*- coding: utf-8 -*-
"""
Created on Sat Dec 10 12:14:38 2022

@author: semih
"""

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

data = pd.read_csv("heart.csv")
     
data.info()

data[data.duplicated()]
data.drop_duplicates(inplace=True)
data.describe()


### benzersiz değer sayısı
sutunlar = data.columns
for sutun in sutunlar:
    print(sutun,":", len(data[sutun].unique()))

### Kategorik olan verilerin grafikleri
kategorik_sutunlar = ['sex','exng','caa','cp','fbs','restecg','slp','thall',"output"]

for sutun in kategorik_sutunlar:
    plt.figure(figsize=(5,3))
    sns.countplot( 
            x=sutun,
            data=data[kategorik_sutunlar],
            hue="output")

### devamlılık gösteren sütunlar
## pair plot
kategorik_olmayan = ["age","trtbps","chol","thalachh","oldpeak","output"]  
sns.pairplot(data[kategorik_olmayan], hue="output")


### Swarm Plot
from sklearn.preprocessing import RobustScaler
kategorik_olmayan_data = data[kategorik_olmayan]

scaler = RobustScaler()
kategorik_olmayan_data = scaler.fit_transform(kategorik_olmayan_data.drop(columns="output"))
print(kategorik_olmayan_data)
### numpy array oldugu için dataframe çeviriyoruz
kategorik_olmayan_dataF = pd.DataFrame(kategorik_olmayan_data, columns = kategorik_olmayan[:-1])
kategorik_olmayan_dataF.head()


kategorik_olmayan_dataF = pd.concat([kategorik_olmayan_dataF, data.loc[:, "output"]], axis = 1)
kategorik_olmayan_dataF.head()


kategorik_olmayan_dataF_melt = pd.melt(kategorik_olmayan_dataF,id_vars="output",var_name="features",value_name="values")
kategorik_olmayan_dataF_melt.head()

plt.figure(figsize=(8,8))
sns.swarmplot(x="features",y="values",data=kategorik_olmayan_dataF_melt,hue="output")


### heatmap
plt.figure(figsize=(14,10))
sns.heatmap(data.corr(), annot=True, fmt=".1f")



kategorik_sutunlar = ['sex','exng','caa','cp','slp','thall']
kategorik_olmayan = ["age","thalachh","oldpeak"]

# encoding the categorical columns
df = pd.get_dummies(data, columns = kategorik_sutunlar, drop_first = True)

# defining the features and target
x = df.drop(columns=['output',"chol","trtbps","fbs",'restecg'])
y = df['output']

# scaling the continuous featuree
x[kategorik_olmayan] = scaler.fit_transform(x[kategorik_olmayan])


from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(x,y, test_size=0.2, random_state=42)
print("X_train :",X_train.shape)
print("X_test :",X_test.shape)
print("y_train :",y_train.shape)
print("y_test :",y_test.shape)

from sklearn.metrics import confusion_matrix
def confusion(alg_predict, title):
    
    
    #logreg_prediction = logreg.predict(X_test)
    plt.figure()
    sns.heatmap(confusion_matrix(y_test, alg_predict), annot=True)
    plt.xlabel("Tahmin")
    plt.ylabel("Gerçek")
    plt.title(title)

## logistic

from sklearn.linear_model import LogisticRegression

logreg = LogisticRegression()
logreg.fit(X_train,y_train)
print("Logistic Regression: ",logreg.score(X_test,y_test))
## Confusion Matrix
logreg_prediction = logreg.predict(X_test)
print(confusion_matrix(y_test, logreg_prediction))
confusion(logreg_prediction, "Logistic Regression")



#Decision Tree 
from sklearn.tree import DecisionTreeClassifier
tree = DecisionTreeClassifier()
tree.fit(X_train,y_train)
print("Karar Ağaçları: ",tree.score(X_test,y_test))
## Confusion Matrix
decision_prediction = tree.predict(X_test)
print(confusion_matrix(y_test, decision_prediction))
confusion(decision_prediction,"Karar Ağaçları")



#KNN
from sklearn.neighbors import KNeighborsClassifier
## öklid uzaklığı -- euclidean
ken = KNeighborsClassifier(n_neighbors=5, metric="euclidean")
ken.fit(X_train,y_train)
print("K-en yakın komşu algoritması: ",ken.score(X_test,y_test))
## Confusion Matrix
ken_prediction = ken.predict(X_test)
print(confusion_matrix(y_test, ken_prediction))
confusion(ken_prediction,"K-en yakın komşu algoritması")



### Naive Bayes
from sklearn.naive_bayes import GaussianNB
nb = GaussianNB()
nb.fit(X_train,y_train)
print("Naive Bayes:",nb.score(X_test,y_test))
## Confusion Matrix
nb_prediction = nb.predict(X_test)
print(confusion_matrix(y_test, nb_prediction))
confusion(nb_prediction,"Naive Bayes")

