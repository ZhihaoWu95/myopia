export EXPERIMENT_NAME="Unleanable"
export MODEL_PATH="stable-diffusion/stable-diffusion-2-1-base"
export CLEAN_TRAIN_DIR="/data/n000057/set_A" 
export CLEAN_ADV_DIR="data/n000057/set_B"
export OUTPUT_DIR="myopia-output"
export CLASS_PROMPT="a photo of person"
export CLASS_DIR="data/class-person"
export CUDA_VISIBLE_DEVICES="0" 

# ------------------------- Train ASPL on set B -------------------------
mkdir -p $OUTPUT_DIR

accelerate launch myopia.py \
  --pretrained_model_name_or_path=$MODEL_PATH  \
  --enable_xformers_memory_efficient_attention \
  --instance_data_dir_for_train=$CLEAN_TRAIN_DIR \
  --instance_data_dir_for_adversarial=$CLEAN_ADV_DIR \
  --instance_prompt="a photo of sks person" \
  --class_data_dir=$CLASS_DIR \
  --num_class_images=200 \
  --class_prompt="a photo of person" \
  --output_dir=$OUTPUT_DIR \
  --center_crop \
  --with_prior_preservation \
  --prior_loss_weight=1.0 \
  --resolution=512 \
  --train_text_encoder \
  --train_batch_size=1 \
  --max_train_steps=10 \
  --max_f_train_steps=3 \
  --max_adv_train_steps=100 \
  --checkpointing_iterations=10 \
  --learning_rate=5e-7 \
  --pgd_alpha=5e-3 \
  --pgd_eps=0.5  \
  --gamma=0.985 \
  --eot=False \
  

