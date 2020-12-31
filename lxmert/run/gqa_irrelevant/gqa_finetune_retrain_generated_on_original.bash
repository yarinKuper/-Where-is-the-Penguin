# Fine tune the model that was trained on the original train set
# on the generated data
# The name of this experiment.
name=$2

# Save logs and models under snap/gqa; make backup.
output=snap/gqa/presuppositions/$name
mkdir -p $output/src
cp -r src/* $output/src/
cp $0 $output/run.bash

# See Readme.md for option details.
CUDA_VISIBLE_DEVICES=$1 PYTHONPATH=$PYTHONPATH:./src \
    python src/tasks/gqa.py \
    --train train --valid testdev \
    --train_second train_original \
    --llayers 9 --xlayers 5 --rlayers 5 \
    --loadLXMERTQA snap/pretrained/model \
    --batchSize 32 --optim bert --lr 1e-5 --epochs 4 --epochs_second 2\
    --tqdm --output $output ${@:3}
