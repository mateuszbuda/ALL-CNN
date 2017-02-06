# ALL-CNN

This is the implementation of All-CNN-C model for [CIFAR-10](https://www.cs.toronto.edu/~kriz/cifar.html) from the paper [Striving for Simplicity: The All Convolutional Net](https://arxiv.org/abs/1412.6806) by Jost Tobias Springenberg, Alexey Dosovitskiy, Thomas Brox, Martin Riedmiller, accepted as a workshop contribution at ICLR 2015.

The best saved model, from iteration 52000, achieves 90.25% accuracy on test set.
It was trained on Caffe commit [5a201dd960840c319cefd9fa9e2a40d2c76ddd73](https://github.com/BVLC/caffe/tree/57a5bbde4ede19c545c5932334782e3a755b2265).

# Dataset

This model was trained on global contrast normalized and ZCA whitened CIFAR-10 whithout any data augmentation.

## Training

```
caffe train -solver ALL_CNN_C_solver.prototxt -gpu all |& tee ALL_CNN_C.log
```

I have found this network training highly unstable.
You may need to run the training more a few times to achieve sub 10% error rate.

## Testing

```
caffe test -model ALL_CNN_C_train_val.prototxt -weights ALL_CNN_C_iter_52000.caffemodel
```

