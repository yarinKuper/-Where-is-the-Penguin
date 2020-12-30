# The name of this experiment.
name=$2

# Save logs and models under snap/gqa; make backup.
output=snap/gqa/irrelevant_questions_new_pretrain/$name
mkdir -p $output/src
cp -r src/* $output/src/
cp $0 $output/run.bash

# See Readme.md for option details.
CUDA_VISIBLE_DEVICES=$1 PYTHONPATH=$PYTHONPATH:./src \
    python src/tasks/gqa.py \
    --train train_irrelevant_dbca_2000 --valid testdev_irrelevant_dbca \
    --llayers 9 --xlayers 5 --rlayers 5 \
    --loadLXMERTQA snap/pretrained_new/BEST_EVAL_LOSS \
    --batchSize 32 --optim bert --lr 1e-5 --epochs 4 \
    --tqdm --output $output ${@:3}
