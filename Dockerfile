FROM runpod/worker-comfyui:5.8.5-base

RUN comfy-node-install comfyui_ipadapter_plus comfyui_controlnet_aux comfyui-impact-pack

RUN pip install --no-cache-dir segment-anything scikit-image piexif transformers \
    opencv-python-headless GitPython "scipy>=1.11.4" ultralytics

RUN cat > /comfyui/extra_model_paths.yaml << 'EOF'
runpod_worker_comfy:
  base_path: /runpod-volume
  checkpoints: models/checkpoints/
  clip: models/clip/
  clip_vision: models/clip_vision/
  configs: models/configs/
  controlnet: models/controlnet/
  embeddings: models/embeddings/
  loras: models/loras/
  upscale_models: models/upscale_models/
  vae: models/vae/
  unet: models/unet/
  ipadapter: models/ipadapter/
  sams: models/sams/
  onnx: models/onnx/
  ultralytics_bbox: models/ultralytics/bbox/
  ultralytics_segm: models/ultralytics/segm/
EOF
