
## Meeting the Criteria

Since the company forbids using long-term access keys and secrets for developers, that means we need to find a way to ensure that they can get access to an S3 bucket without creating an IAM user. Since IAM users can access resources either by a secret or access keys (essentially public/private keys that get generated so that the user stores the private key on their system and the public key resides within AWS to validate the connection), we will need to give the developers access via IAM roles. Roles are known for acquiring STS (security token service) keys that are temporary for the role. The role can be assumed by an individual (or API/resource, though not relevant in our case) without concern for long-term access.

We also want to prevent the developers from "direct console administrative access". This doesn't mean we can't let them assume administrative duties, but it will be specifically denied for console access. In order to do this, we must make sure we assign the role a policy that addresses that exact requirement (among any others that might apply, if deemed necessary). In theory, an IAM user or group policy could work, but since we are only allowing developers access via IAM roles, this wouldn't be applicable.

Finally, it's forbidden for the developers to be granted permission to ANYTHING beyond uploading to that specific log bucket. Again, here we want to make sure that the policy applied to this role only has an effect that allows access to that specific S3 bucket and to only have the access to upload—nothing else.

---

## The Steps

### 1. Provisioning the S3 Bucket

First, we need to create a private S3 bucket for the developers to upload their logs to. We will go with a bucket named `nick-secure-logs-app-2026` (assuming by the time I actually run this that it's available, since S3 buckets need to be globally unique). Since this is my first real go at this, off the break I simply don't know what the AWS CLI command structure is like. I had to review it at a high level so I could try to put it together for myself to see if it would work. From my research, I see that the commands are built out like:

    aws <service> <operation> [--parameter-name parameter-value] [--global-options]

* `<service>` = what service we would be referring to, so in this case it would be `s3`
* `<operation>` = what are we doing to/with the service? I imagine there are a TON of different operations that could be chosen from, and they probably even vary based on the service being called. Since we need to "create" an s3 bucket, I'm going to guess it's `create`. We shall see if that's correct & I will report on this later in my notes (since I am taking them in real time as I work through this).
* `--parameter-name parameter-value` = the options / configurations specific to that service API. I'm thinking this would probably look like `--parameter-name nick-secure-logs-app-2026`
* `--global-options` = this impacts how the CLI processes or returns data. From my research, this looks like it could be determining a region the command should relate to (`--region xyz`) or maybe how the output could be within the CLI (`--output table` could display the output formatted as a table).

So with all of this said, my first whack at creating an S3 bucket in AWS via the CLI would look something like:

    aws s3 --create --parameter-name nick-secure-logs-app-2026 --global private

---

### 2. Drafting the IAM Permissions Policy

Now that an S3 bucket is created, a policy needs to be written for the IAM Role that will be created in the next step. I feel it makes sense to create the policy before the role so that there is no possibility whatsoever for an IAM Role to be taken advantage of if it has been created first before the right policies have been created and applied. I feel it's better to create the policy with the correct security measures in place and then to create an IAM Role and attach the policy directly as it's being created.

So creating a policy will involve creating either a JSON or YAML file with the correctly formatted configurations. For now, I will go with a JSON file, though I may switch it up to creating a YAML file in future projects. Although it would be too easy to simply search up a blank JSON file format or to even ask for a blank AWS JSON formatted file, I'm going to do this the long way to burn it into my brain. I will write out my policy below and then explain it afterwards (although it may take a moment to review it, I assure you, it took time to actually write this out manually):

    {
        "Version":"2012-17-10",
        "Statement": [
            {
            "Effect":"Allow",
            "Action":"Upload",
            "Resource":"s3::nick-secure-logs-app-2026"
            }
        ]
    }

Before I go in and fix my probable mistakes, here's why I wrote out exactly what I did:

* First, JSON files follow a format where the entire contents of the file exists within the curly brackets, so I started and ended my file with them.
* Second, I kept seeing the same "Version" line in all of the same AWS examples out there, and so I learned that it is the most up-to-date and accepted "Version" information out there as of Aug 2026. I may have gotten the date mixed up, but I remember 2012 being the end of the world year, so I definitely remembered that.
* Each different "Key-Value" pair ends with a comma to indicate the next one is following.
* I've looked at enough of these AWS JSON files to recall that the meat and potatoes of the file is within the "Statement" section, so I opened with that. This led into the next piece...
* I believe square brackets indicate lists. Regardless of that being correct, I do know the next part of the format is that within the statement, we've got a few key-value pairs to address. Not to be PUNNY, but I've also learned that acronym PEARS is a good way to remember what needs to be involved. I believe "P" stands for principal, but I don't think that really applies here. I could be wrong, so I'll find out soon. The following bullet points will address my reasoning for their existence given the PEARS acronym.
* "E" stands for "Effect" which I think is "Allow". Again, I may have gotten this mixed up with action, but I don't think so.
* "A" is for "Action" and we determine what the action is, and in our case we want to allow developers to "Upload".
* "R" is for "Resource", and we are calling out the S3 resource, but we specifically only want to allow it to the `nick-secure-logs-app-2026` bucket. I believe the double colons indicate that nothing else needs to be specified since they are not applicable.
* "S"... I forget what S is for but I thought it was Statement... which I already addressed...
* Finally, I ended the list with a closing curly bracket. I actually forgot to add one until I started writing this bullet point. I remembered it because since my logic was that it was a list, I could have multiple "PEARS" in my list but I didn't close them off with their own curly brackets.
* Finally, make sure the correct closing brackets are in place, and voila!

---

### Reviews & Updates

At this point, I've gone and done some review of what I've said thus far and here are my updates:

* I had the date backwards—oops! Fixed it so that we don't have to see a version working with the 17th month of the year.
* The final comma I had was actually going to throw an exception if I left it. After the final key-pair value there isn't supposed to be a comma.
* The action requires the format to be in the `service:ActionName` pattern. I added `s3:PutObject` since the service is S3 and the correct syntax is `PutObject`, not "Upload".
* The Resource has a more specific format. It requires the `"arn:aws:s3:::nick-secure-logs-app-2026/*"` formatting. I added the wildcard at the end because the developers need access to upload anything into the bucket. The original syntax would have been to simply allow developers to add the bucket itself, defeating the purpose of the policy.
* Regarding the AWS CLI command: the executable and service/command aspects were correct but then I veered off a little bit for the subcommand. Instead of `--create`, I needed to say `mb` for make bucket.
* After the `mb` command, I needed to add the actual value of the bucket preceded by the correct s3 bucket & file structure formatting: `s3://nick-secure-logs-app-2026`.
* By default, newly created buckets are private, so I didn't need to add any additional flags to make it so.

---

## Correct Command & JSON

**S3 Bucket Creation Command**

    aws s3 mb s3://nick-secure-logs-app-2026

**Permissions Policy (`developer-role-policy.json`)**

    {
        "Version":"2012-10-17",
        "Statement": [
            {
            "Effect":"Allow",
            "Action":"s3:PutObject",
            "Resource":"arn:aws:s3:::nick-secure-logs-app-2026/*"
            }
        ]
    }

---

## The Next Steps

Now that we've got the appropriate command to create the S3 bucket and the correct policy JSON written up, we need to actually create the IAM Role itself. So similarly to the bucket creation, we also need to run a command to create the role (and then attach the policy). Following the same command structure, here's what I expect to be an acceptable command to do this:

    aws iam create-role --role-name developers --assume-role-policy-document

After the role is created, we've got to upload the policy that we created earlier so that it can be attached. After having a few moments to scratch my head, I realized I need to choose between an in-line policy or a managed policy. In my scenario, I felt going with a managed policy was the better move because, despite only being used once for this scenario, I'd like to apply it in such a way that are best practices for enterprise environments. Here's my command to upload the policy:

    aws iam create-policy --policy-name DeveloperLogUploadPolicy --policy-document file://./developer-role-policy.json

    aws iam attach-role-policy --role-name developers --policy-arn arn:aws:iam::{unique_arn_number}:policy/DeveloperLogUploadPolicy

So after digging into this some more and recognizing I've had some mistakes in my thinking, I've come to learn a few things:

* I've been working on only one of the two necessary policies for the Developers role. I recognized that I needed to create a restriction on what the role could do (Permissions Policy) but not who could actually assume the role (Trust Policy).
* There is a particular order of operations that these actions need to be taken in. Here's what I've learned is the correct way:
    * Write the `trust-policy.json` (The Trust Policy). I hadn't done this up to this point.
    * Write `developer-role-policy.json` (The Permissions Policy I've been refining).
    * Run `aws iam create-role` (using `trust-policy.json`).
    * Run `aws iam create-policy` (uploading `developer-role-policy.json`).
    * Run `aws iam attach-role-policy` (linking the two together).

So before officially correcting my commands above, I want to create my Trust Policy, `trust-policy.json`:

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

The same formatting applies since we are working with JSON and we are following the same PEARS methodology, but we are actually including a Principal whereas before we did not need to. This is because the principal identifies the "who" where the permissions policy was focused on the "what". Now while training courses often use `ec2.amazonaws.com` as a default example, our scenario specifically calls for a local Linux server/developer environment. Therefore, using an EC2 principal would fail in a true on-premises environment. This means that we need to use an alternative service type in the principal. Technically, there are other alternatives instead of "Service" such as "AWS", which allows a specific Account ID, IAM User or IAM role to be specified; and "Federated" which would allow external IdPs to be specified. If we were going to allow developers to access the local Linux machine and then connect via SSO to assume the role, we could leverage the Federated option, but I opted to go another route. 

Of course because I like to make things harder on myself, I went another Service route called "Roles Anywhere". "Roles Anywhere" is a service that lets external servers (among other things) that are run outside of AWS use digital certificates to get short-term AWS security credentials. It removes the need to store risky, long-term access keys on local systems, which lines up nicely to meet our strict requirements while meeting the infrastructure where it is. I've done a little more research on the side of the "how" and for the sake of this challenge, I will only present the necessary information. The main item I wanted to address was why I included the specific "Service", "Action" and "Condition" information in the policy:

* **The Service** is actually called out as `rolesanywhere.amazonaws.com`, so that's the service we added in.
* **The Action** requires a little more than we previously discussed in the permissions policy:
    * `sts:AssumeRole`: Grants "Roles Anywhere" permission to exchange an authenticated request for temporary session credentials.
    * `sts:SetSourceIdentity`: Allows "Roles Anywhere" to pass the local server’s unique certificate ID into the temporary session log. This ensures that every AWS API call made by that local script can be traced back to that specific server in CloudTrail logs.
    * `sts:TagSession`: Allows attaching session tags (like `Environment=OnPrem` or `ServerID=LogServer01`) dynamically to the temporary token.
* **The Condition** `{ "StringEquals": { "aws:PrincipalArn": "..." } }`: Without this condition, any organization or team using Roles Anywhere in AWS could attempt to assume the role. By requiring `aws:PrincipalArn` to match your specific Roles Anywhere Profile ARN, you ensure that only authentication requests routed through our registered Trust Anchor and Profile are granted access.

---

## Final Execution Plan

Now that we've got the Trust Policy created, I can check my steps along with remediating and pasting my commands to run below:

1. **Write `trust-policy.json`** — DONE!
2. **Write `developer-role-policy.json`** — DONE!
3. **Run `aws iam create-role` (using `trust-policy.json`):**

       aws iam create-role --role-name developers --assume-role-policy-document file://./trust-policy.json

4. **Run `aws iam create-policy` (uploading `developer-role-policy.json`):**

       aws iam create-policy --policy-name DeveloperLogUploadPolicy --policy-document file://./developer-role-policy.json

5. **Run `aws iam attach-role-policy` (linking the two together):**

       aws iam attach-role-policy --role-name developers --policy-arn arn:aws:iam::123456789012:policy/DeveloperLogUploadPolicy

From here, the necessary criteria would be met based on the Problem Statement for this challenge!

