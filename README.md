# Fraudulent-Financial-Transaction-Prediction
Data Engineering Zoomcamp 2025 final project.

Dataset:
https://www.kaggle.com/api/v1/datasets/download/younusmohamed/fraudulent-financial-transaction-prediction

## Problem Statement

## Objective

## Tech Stack

## Installation and Setup

### 0) Prerequites

Make sure the following softwares have been installed on your local machine:
- TerraForm  

### 1) Google Cloud & Terraform : setup cloud infrastructure

For this project it is necessary to setup the following Cloud Resources:
- Data Lake
- Data Warehouse

The resources above are set up with Google Cloud. Terraform is used in combination with Google Cloud to make the deployment reproducible.

Follow these steps:
 
  1.1) Create an account on [Google Cloud Platform](https://cloud.google.com/cloud-console?utm_source=google&utm_medium=cpc&utm_campaign=emea-fi-all-en-dr-bkws-all-all-trial-e-gcp-1707574&utm_content=text-ad-none-any-DEV_c-CRE_677761787511-ADGP_Hybrid+%7C+BKWS+-+MIX+%7C+Txt+-+Management+Developer+Tools+-+Cloud+Console-KWID_43700078355835721-kwd-55675752867-userloc_9072483&utm_term=KW_google+cloud+console-NET_g-PLAC_&&gad_source=1&gclid=EAIaIQobChMI9fbUzamWjAMVX0KRBR39aS0LEAAYASAAEgIt-_D_BwE&gclsrc=aw.ds&hl=en) with your Google email ID

  1.2) Setup your first [project](https://console.cloud.google.com/) if you haven't already
  * eg. "Fraudulent-Financial-Transaction-Prediction", and note down the "Project ID" (we'll use this later when deploying infra with TF)

  1.3) Setup a Google Cloud Service Account: ([Video](https://www.youtube.com/watch?v=Y2ux7gq3Z0o&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&index=12))
  * 1.3.1) Create a Service Account with the following Roles:
       - Storage Admin
       - BigQuery Admin
       - Compute Admin
  * 1.3.2) Download service-account-keys (.json) for auth.
  * 1.3.3) Setup environment variable to enable authentication:
     ```shell
     export GOOGLE_APPLICATION_CREDENTIALS="<path/to/your/service-account-authkeys>.json"
     ```

   1.4) Edit the [variables.tf](https://github.com/LolloPero/Fraudulent-Financial-Transaction-Prediction/blob/main/code/terraform/variables.tf) file with your
   * [project_id](https://github.com/LolloPero/Fraudulent-Financial-Transaction-Prediction/blob/main/code/terraform/variables.tf#L11)
   * [bucket name](https://github.com/LolloPero/Fraudulent-Financial-Transaction-Prediction/blob/main/code/terraform/variables.tf#L35)
   * [BigQuery dataset name](https://github.com/LolloPero/Fraudulent-Financial-Transaction-Prediction/blob/main/code/terraform/variables.tf#L29)
  
   1.5) Execute terraform commands:
```shell
   cd code/terraform
   terraform init
   terraform plan
   terraform apply
```


## FInd
