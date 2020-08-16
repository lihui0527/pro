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

X = data.iloc[:,[1,3,4,5,6,7,9,11,12,13,14,15,16,17,18,19]].values
y_logged_in = data.iloc[:,8].values
y_protocol_type = data.iloc[:,2].values
y_root_shell = data.iloc[:,10].values
from sklearn.preprocessing import LabelEncoder, OneHotEncoder

labelencoder_X = LabelEncoder()
labelencoder_y = LabelEncoder()
# #y= labelencoder_y.fit_transform(y)
X[:, 1] = labelencoder_X.fit_transform(X[:, 1])
X[:, 2] = labelencoder_X.fit_transform(X[:, 2])
# X[:, 3] = labelencoder_X.fit_transform(X[:, 3])
y_logged_in = labelencoder_y.fit_transform(y_logged_in)
y_protocol_type = labelencoder_y.fit_transform(y_protocol_type)
y_root_shell = labelencoder_y.fit_transform(y_root_shell)

from sklearn.model_selection import train_test_split
X_train_logged_in, X_test_logged_in, y_train_logged_in, y_test_logged_in = train_test_split(X, y_logged_in, test_size = 0.2, random_state = 0)

X_train_protocol_type, X_test_protocol_type, y_train_protocol_type, y_test_protocol_type = train_test_split(X, y_protocol_type, test_size = 0.2, random_state = 0)

X_train_root_shell, X_test_root_shell, y_train_root_shell, y_test_root_shell = train_test_split(X, y_logged_in, test_size = 0.2, random_state = 0)


# Feature Scaling
from sklearn.preprocessing import StandardScaler
sc_X = StandardScaler()
X_train_logged_in = sc_X.fit_transform(X_train_logged_in)
X_train_logged_in = sc_X.transform(X_train_logged_in)

X_train_protocol_type = sc_X.fit_transform(X_train_protocol_type)
X_train_protocol_type = sc_X.transform(X_train_protocol_type)

X_train_root_shell = sc_X.fit_transform(X_train_root_shell)
X_train_root_shell = sc_X.transform(X_train_root_shell)


from sklearn.ensemble import RandomForestClassifier
classifier1 = RandomForestClassifier(n_estimators = 10, criterion = 'entropy', random_state = 0 )
classifier1.fit(X_train_logged_in, y_train_logged_in)

# classifier2 = RandomForestClassifier(n_estimators = 10, criterion = 'entropy', random_state = 0 )
# classifier2.fit(X_train_protocol_type, y_train_protocol_type)

classifier3 = RandomForestClassifier(n_estimators = 10, criterion = 'entropy', random_state = 0 )
classifier3.fit(X_train_root_shell, y_train_root_shell)

from sklearn.naive_bayes import GaussianNB
# classifier2 = GaussianNB()
# classifier2.fit(X_train_protocol_type, y_train_protocol_type)

from sklearn.neighbors import KNeighborsClassifier
# Predicting the Test set results
# y_pred2 = classifier2.predict(X_test_protocol_type)

knc = KNeighborsClassifier()
knc.fit(X_train_protocol_type, y_train_protocol_type)
y_pred2 = knc.predict(X_test_protocol_type)

# Predicting the Test set results
y_pred1 = classifier1.predict(X_test_logged_in)
# y_pred2= classifier2.predict(X_test_protocol_type)
y_pred3 = classifier3.predict(X_test_root_shell)

from sklearn.metrics import confusion_matrix
cm1 = confusion_matrix(y_test_logged_in, y_pred1)
print(cm1)
print("logged_in_accuracy：%.2f"%(100*((cm1[0][0]+cm1[1][1])/np.sum(cm1)))+"%")

from sklearn.model_selection import cross_val_score
accuracies = cross_val_score(estimator = knc, X = X_train_protocol_type, y = y_train_protocol_type, cv = 10)
accuracies.mean()
accuracies.std()
accuracy=accuracy_score(y_test_protocol_type,y_pred2)
print("protocol_type_accuracy: %.2f%%" % (accuracy * 100.0))


# cm2= confusion_matrix(y_test_protocol_type, y_pred2)
cm3 = confusion_matrix(y_test_root_shell, y_pred3)
print("root_shell_accuracy：%.2f"%(100*((cm3[0][0]+cm3[1][1])/np.sum(cm3)))+"%")



# print(cm2)

#print('The accuracy of K-Nearest Neighbor Classifier is', knc.score(X_test_protocol_type, y_test_protocol_type))

from sklearn.datasets import load_iris
from sklearn.metrics import classification_report
iris = load_iris()
print(classification_report(y_test_protocol_type, y_pred2, target_names=iris.target_names))

joblib.dump(classifier1,"logged_in.m")
joblib.dump(knc,"protocol_type.m")
joblib.dump(classifier3,"root_shell.m")


msg1=[0,7,0,0,0,0,0,0,11,2,0,0,255,254,1,0]
msg1=np.array(msg1).reshape(1,-1)
model1= joblib.load("./logged_in.m")
preds1 = model1.predict(msg1)
print(preds1)

msg2=[0,7,0,0,0,0,0,0,11,2,0,0,255,254,1,0]
msg2=np.array(msg2).reshape(1,-1)
model2= joblib.load("./protocol_type.m")
preds2 = model2.predict(msg2)
print(preds2)

msg3=[0,7,0,0,0,0,0,0,11,2,0,0,255,254,1,0]
msg3=np.array(msg3).reshape(1,-1)
model3= joblib.load("./root_shell.m")
preds3 = model3.predict(msg3)
print(preds3)

