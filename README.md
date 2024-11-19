# Terraform S3 Replication Setup: Infrastructure Automation with AWS

This project demonstrates the use of **Terraform** and **AWS services** to build and automate cloud infrastructure. By implementing **cross-region replication** for Amazon S3, this repository showcases a practical application of **Infrastructure as Code (IaC)** principles while adhering to AWS best practices.

## 🚀 Key Features
- **Infrastructure as Code (IaC)**: Automates the provisioning of S3 buckets, IAM roles, and replication policies using Terraform.
- **AWS S3 Bucket Replication**: Configures cross-region replication to ensure data durability, redundancy, and compliance with disaster recovery strategies.
- **Versioning**: Enables S3 versioning to maintain object history and prevent data loss.
- **IAM Role Management**: Implements secure, least-privilege IAM policies for S3 replication.
- **Automated Cleanup**: Supports automatic deletion of S3 objects during resource destruction (`force_destroy`).
- **Scalability and Modularity**: Uses modular Terraform architecture to support scalability and code reusability.

---

## 🌟 Skills Demonstrated

### AWS Skills
- **S3**: Expertise in configuring S3 buckets, enabling versioning, and implementing cross-region replication for disaster recovery and compliance.
- **IAM**: Securely managing permissions with IAM roles and policies.
- **Cloud Best Practices**: Designing infrastructure that supports fault tolerance, high availability, and scalability.
- **Cross-Region Strategies**: Leveraging cross-region replication for data redundancy and global accessibility.

### Terraform Skills
- **Infrastructure as Code (IaC)**: Writing reusable, modular Terraform code to provision and manage AWS resources.
- **State Management**: Understanding how Terraform tracks resources with its state file.
- **Dynamic Variables and Outputs**: Using variables to parameterize configurations and outputs for clarity and reusability.
- **Resource Dependencies**: Managing dependencies between resources (e.g., IAM roles and S3 replication).

### General Cloud Engineering Skills
- **Automation**: Automating infrastructure deployment to reduce manual intervention and minimize errors.
- **Disaster Recovery**: Configuring replication strategies to ensure data durability.
- **Version Control**: Using Git and GitHub to track and manage infrastructure changes.

---

## 🛠 Technologies Used
- **Terraform**: Automates resource provisioning and configuration in AWS.
- **AWS S3**: Object storage service for scalability, durability, and data replication.
- **AWS IAM**: Securely manages permissions for replication tasks.
- **Git/GitHub**: Version control and collaboration for code management.

---

## 📁 File Structure
```plaintext
project-directory/
├── main.tf                # Root Terraform configuration
├── variables.tf           # Global variables
├── terraform.tfvars       # Variable values (e.g., bucket names, environment)
├── outputs.tf             # Outputs (e.g., bucket ARNs, role ARNs)
│
├── s3buckets/             # S3 buckets module
│   ├── buckets.tf         # Defines S3 buckets
│   ├── versioning.tf      # Enables versioning for buckets
│   ├── replication.tf     # Configures cross-region replication
│   ├── iam_roles.tf       # IAM roles and policies for replication
│   ├── variables.tf       # Module-specific variables
│   ├── outputs.tf         # Module-specific outputs
