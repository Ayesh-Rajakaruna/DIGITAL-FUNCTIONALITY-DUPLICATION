import os
import wandb
from wandb.keras import WandbCallback
import numpy as np
import tensorflow as tf
import datetime
from sklearn.model_selection import train_test_split
from tensorflow import keras
from keras.models import Sequential
from keras import initializers, optimizers
from keras.layers import InputLayer, Dense, LSTM, Dropout, BatchNormalization, LayerNormalization, Embedding, Flatten
from keras.callbacks import Callback, EarlyStopping, ReduceLROnPlateau
import random

# For the purpose of omitting "WARNING:absl:Found untraced functions"
import absl.logging
absl.logging.set_verbosity(absl.logging.ERROR)


class ResetStatesCallback(tf.keras.callbacks.Callback):
    def on_epoch_end(self, epoch, logs=None):
        self.model.reset_states()
        print(" -> Resetting model states at end of epoch ", epoch)


# Read the dataset file and seperate inputs and outputs
def readFile(file, number_of_input):
    f1 = open(file, "r")
    X = []
    Y = []
    count = 1
    for line in f1:
        if count == 1:
            pass
        else: 
            items = [int(x.strip().replace("'", "")) for x in line.strip().split()] 
            X.append(items[:number_of_input])
            Y.append(items[number_of_input:])
        count += 1
    return X,Y


# Concatanate (n-1)th output to (n)th inputs
# New input ------> [ (n)th inputs + (n-1)th output ]
def intializeDataSet(X,Y):
    X_ = []
    Y_ = []
    for i in range(len(X)):
        if i == 0 and i==1:
            pass
        else:
            X_.append([i for i in X[i]]+[i for i in Y[i-1]+[i for i in Y[i-2]]])
            Y_.append([i for i in Y[i]]+[i for i in Y[i-1]])
    return X_,Y_


# Dataset reshaping/ converting 2D input array to 3D array
# 3D array ------> [Samples, Time steps, Features]
def reArangeDataSet(X, Y, time_steps):
    Sequential_X = []
    Sequential_Y = Y[time_steps:]
    for i in range(len(X) - time_steps):
        Sequential_X.append(X[i:i + time_steps])
    Sequential_X = np.array(Sequential_X)
    Sequential_Y = np.array(Sequential_Y)
    return Sequential_X, Sequential_Y


# creating the NN model for training
def createModel(i_shape, b_size, Outputs, k_initializer, opt,LSTM1_num,LSTM2_num):
    # Define model architecture
    model = Sequential()
    model.add(InputLayer(input_shape=i_shape,batch_size=b_size))
    model.add(LSTM(LSTM1_num, activation='sigmoid', recurrent_activation='sigmoid',return_sequences=True,stateful=True,kernel_initializer=k_initializer,bias_initializer ='uniform',recurrent_initializer='Zeros',dropout=0.0,recurrent_dropout=0.0))
    model.add(Embedding(LSTM1_num,2,embeddings_initializer='uniform',embeddings_regularizer=None,activity_regularizer=None,embeddings_constraint=None,mask_zero=False,input_length=None))
    model.add(Flatten())
    model.add(Dense(32, activation='sigmoid'))
    model.add(Dense(Outputs,activation='sigmoid'))
    model.summary()
    model.compile(loss='binary_crossentropy',optimizer=opt, metrics=['binary_accuracy'])
    
    # Define callbacks
    # add early stopping callback
    early_stopping = EarlyStopping(monitor='val_binary_accuracy', patience=10, verbose=1, mode='min', restore_best_weights=True)
    # add learning rate schedule callback
    reduce_lr = ReduceLROnPlateau(monitor='val_binary_accuracy', factor=0.2, patience=5, min_lr=0.001)

    return model, early_stopping, reduce_lr


# creating the NN model for testing (with batch size = 1)
def newModel(i_shape, Outputs, k_initializer, opt, b_size=1):
    # Define model architecture
    model = Sequential()
    model.add(InputLayer(input_shape=i_shape,batch_size=b_size))
    model.add(LSTM(24, activation='sigmoid', recurrent_activation='sigmoid',return_sequences=True,stateful=True,kernel_initializer=k_initializer,bias_initializer ='uniform',recurrent_initializer='Zeros',dropout=0.0,recurrent_dropout=0.0))
    model.add(LSTM(40, activation='sigmoid', recurrent_activation='sigmoid',return_sequences=False,stateful=True,kernel_initializer=k_initializer,bias_initializer ='uniform',recurrent_initializer='Zeros',dropout=0.0,recurrent_dropout=0.0))
    #model.add(Dense(64, activation='tanh'))
    #model.add(LayerNormalization())
    model.add(Dense(Outputs,activation='sigmoid'))
    model.summary()
    model.compile(loss='binary_crossentropy',optimizer=opt, metrics=['binary_accuracy'])
    return model


# fit network / training
def trainModel(model, X_train, y_train, X_val, y_val, Epochs, b_size, early_stopping, reduce_lr):    
    model.fit(X_train, y_train, validation_data=(X_val, y_val), batch_size=b_size, epochs = Epochs, verbose=1, shuffle=False, callbacks=[ResetStatesCallback(), WandbCallback()]) # callbacks=[tensorboard_callback, early_stopping, reduce_lr, WandbCallback()])
    return model


# copy weights & compile the model
def copyWeights(model, newModel):
    old_weights = model.get_weights()
    newModel.set_weights(old_weights)
    newModel.compile(loss='binary_crossentropy', optimizer='rmsprop')


def RunCode(batch_size, number_of_inputs, time_steps, lr, initialize,LSTM1_num,LSTM2_num,decay):
    dirname = os.path.dirname(__file__)
    filename_train = os.path.join(dirname, '../datasets/PISO{}Bits.txt'.format(number_of_inputs))
    number_of_oututs = 1
    epochs = 10
    dataset_name = "ShiftRegister_PISO_{}bits".format(number_of_inputs)

    # optimizers
    # opt = optimizers.Adam(learning_rate=lr,weight_decay=0.0005,amsgrad=F,use_ema=True,ema_momentum=0.99)
    opt = optimizers.Adam(learning_rate=lr,decay=decay)

    # weight initialize
    if initialize == "GlorotNormal":
        k_initializer= initializers.GlorotNormal(seed=20)
    else:
        k_initializer=initializers.RandomUniform(minval=0.4, maxval=0.42, seed=2) 

    # Wandb
    wandb.init(project="ShiftRegister_PISO", entity="ic-functionality-duplication",
    config={
    "architecture": "LSTM1={}, LSTM2={}".format(LSTM1_num,LSTM2_num),
    "callbacks": "ResetStatesCallback",
    "dataset": dataset_name,
    "batch_size": batch_size,
    "epochs": epochs,
    "learning_rate": lr,
    "optimizer": "Adam",
    "decay": decay,
    "initializer": initialize,
    "time_steps": time_steps,
    }) 

    X,Y = readFile(filename_train, number_of_inputs+1)
    X_,Y_ = intializeDataSet(X,Y)
    Sequential_X, Sequential_Y = reArangeDataSet(X_, Y_, time_steps)
    X_train, X_val, y_train, y_val = train_test_split(Sequential_X, Sequential_Y, test_size=0.2, random_state=42)
    X_train, X_val, y_train, y_val = X_train[len(X_train)%batch_size:], X_val[len(X_val)%batch_size:], y_train[len(y_train)%batch_size:], y_val[len(y_val)%batch_size:]

    print("\n input_shape ",Sequential_X.shape,"\n")
    print("output_shape ",Sequential_Y.shape,"\n")

    model, early_stopping, reduce_lr = createModel(Sequential_X[0].shape, batch_size, number_of_oututs*2, k_initializer, opt, LSTM1_num, LSTM2_num)
    model = trainModel(model, X_train, y_train, X_val, y_val-1, epochs, batch_size, early_stopping, reduce_lr)
    #wandb.init(mode= "disabled")


if __name__ == "__main__":
    RunCode(50,16,15,0.02,"GlorotNormal",24,32,0.004 )
    """
    count = 0
    number_of_inputs_list = [16]
    batch_size_list = [25,40,60]
    time_steps_list = [10,15,25]
    lr_list = [0.005,0.01,0.02]
    initialize_list = ["GlorotNormal","RandomUniform"]
    LSTM1_list = [32,24,26]
    LSTM2_list = [32,17,24]
    decay_list = [0.004, 0.001]
    f = open("demofile2.txt", "a")  
    f.close
    lis = []
    for batch_size in batch_size_list:
        for number_of_inputs in number_of_inputs_list:
            for time_steps in time_steps_list:
                for lr in lr_list:
                    for initialize in initialize_list:
                        for LSTM1_num in LSTM1_list:
                            for LSTM2_num in LSTM2_list:
                                for decay in decay_list: 
                                    if LSTM1_num != LSTM2_num:
                                        lis.append([batch_size,number_of_inputs, time_steps, lr, initialize, LSTM1_num, LSTM2_num, decay ])
                                    else:
                                        pass
    random.shuffle(lis)
    for i in lis:
        world = ""
        for j in i:
            world = world + str(j) + " "
        f.write(world + "\n")
    f.close()
    
    
    f = open("demofile2.txt", "r")
    for i in f:
        lis_i = list(i.strip().split())
        #RunCode(int(lis_i[0]), int(lis_i[1]), int(lis_i[2]), float(lis_i[3]), lis_i[4], int(lis_i[5]), int(lis_i[6]), float(lis_i[7]))
        break
    f.close() """
