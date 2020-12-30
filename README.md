# Where-is-the-Penguin

Official Github repo for the paper "Where is the Penguin? Making GQA Robust to Infelicitous Questions".

# Create New Split
Our work is based on the [GQA dataset](https://cs.stanford.edu/people/dorarad/gqa/about.html). Since GQA's test set doesn't contains the scene-graph annotations, we created a new train and test splits based on the work ["Measuring Compositional Generalization: A Comprehensive Method on Realistic Data
"](https://arxiv.org/abs/1912.09713). <br>
The implementation can be found under the DBCA folder. <br>
To create a new split please run:


# Data
To get the reuired data please follow the instructions under "lxmert" to download the original GQA data.
The new train and test splits are located in  lxmert\data\gqa\ and includs:
  * "train_irrelevant_dbca.json" - The new training set with 80k irrelevant questions.
  * "testdev_irrelevant_dbca.json" - The new testdev set with 5k irrelevant questions.
  * "testdev_irrelevant.json" - The original testdev set with 5k irrelevant questions.

# Scripts
The finetuning scripts are located in "lxmert/run"
To finetune the model on the new train split with the set of irrelevant questions replace XXX with the number of irrelevant questions (1000/2000/80000) and run:

  * bash run/gqa_finetune_irrelevant_new_pretrain_XXX.bash 0 gqa_irrelevant_questions_XXX
