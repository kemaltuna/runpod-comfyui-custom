FROM runpod/worker-comfyui:5.8.5-base

RUN comfy-node-install comfyui_ipadapter_plus comfyui_controlnet_aux comfyui-impact-pack

RUN pip install --no-cache-dir segment-anything scikit-image piexif transformers \
    opencv-python-headless GitPython "scipy>=1.11.4" ultralytics
