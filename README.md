##### Table of contents

1. [Environment setup](#environment-setup)

2. [Dataset preparation](#dataset-preparation)

3. [How to run MYOPIA](#how-to-run)

# Code implement for MYOPIA

</div>

> **Abstract**: Personalized text-to-image synthesis models, such as DreamBooth, have demonstrated significant potential in creating lifelike images tailored to a specific individual by fine-tuning from a limited set of face images and simple prompts. However, if misused, these model could pose a serious risk of privacy infringement by generating harmful images containing violent or pornographic content. To tackle this issue, this paper introduces MYOPIA, a method that renders facial images unlearnable by incorporating error-minimizing perturbations. These meticulously designed perturbations enables the model to quickly overfit to them, resulting in a swift reduction in loss and the cessation of model fine-tuning, effectively preventing the model from capturing genuine facial features. Moreover, to ensure the imperceptibility and robustness of the perturbations, we utilize the Just-Noticeable-Difference and Expectation-of-Transformation techniques to regulate both their location and intensity.  Evaluation on two face dataset, i.e., VGGFace2 and CelebA-HQ, with various model versions illustrates the effectiveness of our approach in preserving personal privacy. Furthermore, our method showcases robust transferability across diverse model versions and demonstrates resilience against various image pre-processing techniques.

**TLDR**: This paper introduces MYOPIA, a method using error-minimizing perturbations to prevent models from learning genuine facial features, thus ensuring privacy preservation from malicious personalized T2I synthesis.

## Environment setup

Our code relies on the [diffusers](https://github.com/huggingface/diffusers) library from Hugging Face and the implementation of latent caching from [ShivamShrirao's diffusers fork](https://github.com/ShivamShrirao/diffusers).

Install dependencies:

```shell
cd myopia

conda create -n myopia python=3.9 

conda activate myopia 

pip install -r requirements.txt 
```

Pretrained checkpoints of different Stable Diffusion versions can be **downloaded** from Hugging Face, we use the Stable Diffusion V2.1 as our default model.

## Dataset

We have experimented on these two datasets, you can download from their offcial sources:

- VGGFace2: contains around 3.31 million images of 9131 person identities. We only use subjects that have at least 15 images of resolution above $500 \times 500$.

- CelebA-HQ: consists of 30,000 images at $1024 × 1024$ resolution. 

## Results

For convenient testing, we have provided a split set of one subject in VGGFace2 at `./data/n000057/`.

## How to run MYOPIA

To generate the unlearnable perturbations, you can run

```bash
bash scripts/myopia_gen.sh
```

</tr>

</table>

If you want to train a DreamBooth model only, you can run:

```bash
bash scripts/train_dreambooth_alone.sh
```

If you want to generate images from the trained models, you can run

```bash
bash scripts/infer.sh
```
