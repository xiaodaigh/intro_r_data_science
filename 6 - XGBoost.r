xgboost::xgb.dump(xgm)

str(xgm)

xgboost::xgb.plot.tree(xgm)

xgboost::xgb.plot.multi.trees(xgm)


xgboost::xgb.plot.tree(xgm[1])
xgm[1]

xgboost::xgb.plot.multi.trees(xgm)

library(xgboost)
importance_matrix  = xgboost::xgb.importance(model=xgm)


xgboost::xgb.plot.importance(importance_matrix=importance_matrix)


df_test = fread("data/cs-test.csv")

df_test_data = xgboost::xgb.DMatrix(data=as.matrix(df_test[,-"SeriousDlqin2yrs", with=F]))

predict(xgm, df_test_data)
