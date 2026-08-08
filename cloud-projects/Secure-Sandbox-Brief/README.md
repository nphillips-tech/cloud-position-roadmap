# AWS IAM Challenge Project

>  **Detailed Engineering Log:** For a step-by-step breakdown of my thought process, initial trials, and lessons learned, check out [solution-notes.md](./solution-notes.md).

# The Problem Statement:

Your developers need a way to upload sensitive system diagnostic logs from a local Linux server directly into an AWS S3 bucket. However, the company's security policy strictly forbids:

Generating long-term IAM access keys or secrets for local developers.

Allowing developers direct console administrative access.

Granting any permission beyond uploading to that single specific log bucket.


The challenge is to construct and deploy the following environment:

    The Target Storage: Create a private S3 bucket specifically designated for logs (e.g., nick-secure-logs-app-2026).

    The Security Boundary: Write a custom IAM Policy that adheres to the Principle of Least Privilege. It should ONLY allow s3:PutObject on that specific bucket—nothing else (no s3:GetObject, no listing other buckets, no deleting objects).

    The Identity Assumption: Create an IAM Role designed to assume this policy.

    The Validation Test: Configure a temporary session from your local Ubuntu terminal using AWS STS (Security Token Service) or an assumed role to write a local log file into that bucket, and verify that attempting to run aws s3 ls (listing buckets) throws an Access Denied error.


## Meeting the Criteria

Since the company forbids using long-term access keys and secrets for developers, we must ensure they can access an S3 bucket without creating an IAM user. IAM users typically authenticate via long-term credentials (access key IDs and secret access keys), which poses a security risk if stored locally. Instead, we will grant access via **IAM Roles**. Roles rely on AWS Security Token Service (STS) to issue short-term temporary credentials, eliminating the need for long-term access management.

We also want to prevent developers from obtaining direct AWS Management Console access. While they may assume operational duties, console access will be explicitly absent. Because we are restricting access strictly to IAM roles, user/group-level console policies do not apply.

Finally, developers must be granted **least-privilege permissions**: explicitly restricted to uploading objects to a single designated log bucket and nothing else. The attached policy will restrict both the target resource and the allowed S3 actions.

---

## Technical Walkthrough & Learning Process

### 1. Provisioning the S3 Bucket

First, we need to create a private S3 bucket for developer log uploads. We will name it `nick-secure-logs-app-2026` (assuming global uniqueness). 

AWS CLI commands follow this standard structure:

    aws <service> <operation> [--parameter-name parameter-value] [--global-options]

* `<service>`: Target AWS service (`s3`).
* `<operation>`: Action to perform.
* `--parameter-name`: Specific configuration flags.
* `--global-options`: CLI output/region flags (e.g., `--region`, `--output`).

**Initial Attempt (Concept Trial)**

    aws s3 --create --parameter-name nick-secure-logs-app-2026 --global private

**Corrections & Findings**
* S3 bucket creation uses the high-level `mb` (Make Bucket) command rather than `--create`.
* The target requires the S3 URI format: `s3://bucket-name`.
* AWS S3 buckets are private by default upon creation, so no extra privacy flags are required.

---

### 2. Drafting the IAM Permissions Policy

Next, we draft the permissions policy for the IAM Role. Creating the policy prior to the role prevents unmanaged or exposed role creation. 

We will define this policy in a JSON file (`developer-role-policy.json`).

**Initial Attempt (Concept Trial)**

    {
        "Version":"2012-17-10",
        "Statement": [
            {
                "Effect":"Allow",
                "Action":"Upload",
                "Resource":"s3::nick-secure-logs-app-2026",
            }
        ]
    }

**Corrections & Syntax Refinements**
* **Version String:** Corrected to `"2012-10-17"` (standard AWS IAM policy format).
* **Trailing Commas:** Removed invalid trailing comma after the `Resource` string.
* **Action Syntax:** Replaced custom string `"Upload"` with the official API action `"s3:PutObject"`.
* **ARN Syntax:** Fixed resource identifier to standard S3 ARN format: `"arn:aws:s3:::nick-secure-logs-app-2026/*"`. The trailing wildcard (`/*`) allows uploading objects *into* the bucket rather than attempting actions on the bucket container itself.

---

### 3. Corrected Provisioning Commands & Policy

**S3 Bucket Creation**

    aws s3 mb s3://nick-secure-logs-app-2026

**Permissions Policy (`developer-role-policy.json`)**

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Action": "s3:PutObject",
          "Resource": "arn:aws:s3:::nick-secure-logs-app-2026/*"
        }
      ]
    }

---

### 4. IAM Role & Trust Relationship Architecture

To complete the setup, an IAM Role requires two distinct policies:
1. **Permissions Policy:** Defines *what* actions the role can perform (`developer-role-policy.json`).
2. **Trust Policy:** Defines *who* (or what principal) is allowed to assume the role (`trust-policy.json`).

**Trust Policy (`trust-policy.json`)**

Since developers will authenticate from on-premises/local Linux environments without standard AWS IAM user credentials or EC2 instances, we utilize **IAM Roles Anywhere** (`rolesanywhere.amazonaws.com`). This enables external workloads to exchange X.509 digital certificates for temporary AWS STS credentials.

    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "Service": "rolesanywhere.amazonaws.com"
          },
          "Action": [
            "sts:AssumeRole",
            "sts:SetSourceIdentity",
            "sts:TagSession"
          ],
          "Condition": {
            "StringEquals": {
              "aws:PrincipalArn": "arn:aws:rolesanywhere:us-east-1:123456789012:profile/a1b2c3d4-5678-90ab-cdef-EXAMPLE11111"
            }
          }
        }
      ]
    }

**Key Trust Elements**
* **`sts:AssumeRole`:** Permits Roles Anywhere to exchange authenticated certificate requests for temporary STS credentials.
* **`sts:SetSourceIdentity`:** Passes the local server's certificate ID into AWS CloudTrail logs for end-to-end auditing.
* **`sts:TagSession`:** Enables dynamic session tags (e.g., `Environment=OnPrem`).
* **Condition Block:** Constrains role assumption strictly to requests routed through our specific Roles Anywhere Profile ARN.

---

## Final Execution Sequence

1. **Create the S3 Bucket:**

       aws s3 mb s3://nick-secure-logs-app-2026

2. **Create the IAM Role using the Trust Policy:**

       aws iam create-role \
         --role-name developers \
         --assume-role-policy-document file://trust-policy.json

3. **Create the Customer Managed Policy:**

       aws iam create-policy \
         --policy-name DeveloperLogUploadPolicy \
         --policy-document file://developer-role-policy.json

4. **Attach the Policy to the Role:**

       aws iam attach-role-policy \
         --role-name developers \
         --policy-arn arn:aws:iam::123456789012:policy/DeveloperLogUploadPolicy

