from sklearn.compose import ColumnTransformer
from numpy import loadtxt
from xgboost import plot_importance
from matplotlib import pyplot as plt
import numpy as np
import pandas as pd
from sklearn.metrics import accuracy_score
import warnings
from sklearn.externals import joblib
warnings.filterwarnings('ignore')
data = pd.read_csv('./corrected2.csv',encoding='gb18030')
data.info()
# np.isnan(data).any()
# data.dropna(inplace=True)
X = data.iloc[:,1:20].values
y = data.iloc[:,20].values

# #   数据预处理
# #from sklearn.preprocessing import Imputer
from sklearn.preprocessing import LabelEncoder, OneHotEncoder

labelencoder_X = LabelEncoder()
labelencoder_y = LabelEncoder()
# #y= labelencoder_y.fit_transform(y)
X[:, 1] = labelencoder_X.fit_transform(X[:, 1])
X[:, 2] = labelencoder_X.fit_transform(X[:, 2])
# X[:, 3] = labelencoder_X.fit_transform(X[:, 3])
y= labelencoder_y.fit_transform(y)

from sklearn.model_selection import train_test_split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train = sc_X.fit_transform(X_train)
X_test = sc_X.transform(X_test)

# from sklearn.model_selection import train_test_split
# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2, random_state = 0)

# #Fitting XGBoost to the Training set
from xgboost import XGBClassifier
classifier = XGBClassifier(
                            learning_rate=0.01,
                           n_estimators=1000,
                           max_depth=6,
                           min_child_weight = 1,
                           gamma=0.,
                           subsample=0.8,
                           colsample_btree=0.8,
                           scale_pos_weight=1,
                           random_state=27,
                             )
classifier.fit(X_train, y_train)

# Predicting the Test set results
y_pred = classifier.predict(X_test)
y_predict_train= classifier.predict(X_train)

# # Making the Confusion Matrix
from sklearn.metrics import confusion_matrix
# cm = confusion_matrix(y_test, y_pred)

#Applying k-Fold Cross Validation
from sklearn.model_selection import cross_val_score
accuracies = cross_val_score(estimator = classifier, X = X_train, y = y_train, cv = 10)
accuracies.mean()
accuracies.std()
accuracy=accuracy_score(y_test,y_pred)
print("Accuracy: %.2f%%" % (accuracy * 100.0))

# plt.figure()
# plt.scatter(y_pred,y_test,marker='X',s=5,c='blue')
# plt.scatter(y_predict_train,y_train,marker='X',s=5,c='red')
# plt.title('XGBRegressor training set & test set prediction vs true')
# plt.xlabel('xgbr_y_predict')
# plt.ylabel('y_true value')
# plt.show()    

plt.rcParams['font.sans-serif']= ['simHei']#改成中文字体
plot_importance(classifier)
plt.show()
#导出模型
joblib.dump(classifier,"data.m")

#利用混淆矩阵观察模型正确率
cm=confusion_matrix(y_test,y_pred)
print(cm)
print("xgboost正确率：%.2f"%(100*((cm[0][0]+cm[1][1])/np.sum(cm)))+"%")

#测试
msg=[0,0,1,0,0,0,0,0,0,0,0,1,1,0,0,255,254,1,0]
msg=np.array(msg).reshape(1,-1)
model= joblib.load("./data.m")
preds = model.predict(msg)
print(preds)

