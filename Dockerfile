FROM runpod/worker-comfyui:5.8.5-base

RUN comfy-node-install comfyui_ipadapter_plus comfyui_controlnet_aux comfyui-impact-pack comfyui-impact-subpack

RUN pip install --no-cache-dir segment-anything scikit-image piexif transformers \
    opencv-python-headless GitPython "scipy>=1.11.4" ultralytics

RUN printf 'runpod_worker_comfy:\n  base_path: /runpod-volume\n  checkpoints: models/checkpoints/\n  clip: models/clip/\n  clip_vision: models/clip_vision/\n  configs: models/configs/\n  controlnet: models/controlnet/\n  embeddings: models/embeddings/\n  loras: models/loras/\n  upscale_models: models/upscale_models/\n  vae: models/vae/\n  unet: models/unet/\n  ipadapter: models/ipadapter/\n  sams: models/sams/\n  onnx: models/onnx/\n  ultralytics_bbox: models/ultralytics/bbox/\n  ultralytics_segm: models/ultralytics/segm/\n' > /comfyui/extra_model_paths.yaml
