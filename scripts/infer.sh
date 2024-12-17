export MODEL_PATH="stable-diffusion/stable-diffusion-2-1-base"
export OUTPUT_DIR="infer_test"
export CLASS_PROMPT="a photo of person"
export CLASS_DIR="data/class-person"
export CUDA_VISIBLE_DEVICES="0" 

# ------------------------- Train ASPL on set B -------------------------
mkdir -p $OUTPUT_DIR

python infer.py --model_path $MODEL_PATH --output_dir $OUTPUT_DIR 

