# Train DyGIE++ model on the scierc data set.
# Usage: bash scripts/train/train_scierc.sh [gpu-id]
# gpu-id can be an integer GPU ID, or -1 for CPU.

experiment_name="scirex_data_abstract"
data_root="../scirex_dataset/release_data_in_scierc_format_abstracts_only/"
config_file="./training_config/scirex_working_example.jsonnet"
cuda_device=$1

# Train model.
ie_train_data_path=$data_root/train.jsonl \
    ie_dev_data_path=$data_root/dev.jsonl \
    ie_test_data_path=$data_root/test.jsonl \
    cuda_device=$cuda_device \
    allennlp train $config_file \
    --cache-directory $data_root/cached \
    --serialization-dir ./models/$experiment_name \
    --include-package dygie
