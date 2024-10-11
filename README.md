#AWS command

1. Config AWS

- aws configure

2. Get AWS identity

- aws sts get-caller-identity

#Terraform command

1. Init: terraform init (init provider api)
2. Plan: terraform plan (xem strategy)
3. Apply: terraform apply (provision terraform infra lên cloud)
4. Destroy: terraform destroy (xoá terraform infra lên cloud)
#Terraform advance
1. depends_on: Khai báo resource start khi phụ thuộc 1 source khác thành công
2. count: vòng lặp trong tf, không thay đổi được meta
3. for: 
4. for_each: vòng lặp có thể thay đổi meta theo variable dạng set hoặc map (each.key, each.value)
5. lifecycle: Vòng đời của resource
    - Có 4 loại lifecycle 
        + create_before_destroy: tạo resource trước rồi mới destroy resource cũ
        + prevent_destroy: khi có sự thay đổi ko destroy resource cũ
        + ignore_changes: đánh dấu 1 số meta không muốn thay đổi
        + replace_trigger_by
6. Module: 1 tập hợp các module infra
    - root module
    - child module
7. Module remote

8. Module upgrade
    - To upgrade module, first need upgrade providers -> terraform init -upgrade -> terraforn get -update

9.  Terraform expression: expression ? value if true : value if false

10. Terraform function: 
    - Terraform functions are built-in, reusable code blocks that perform specific tasks within Terraform configurations.
        + String: (format, join, split)
        + Numeric: (min, max, pow)
        + Collection: (length, lookup, merge)
        + Date and Time: (formatdate, timestamp)
        + Crypto and Hash: (base64sha512, bcrypt )
        + Filesystem: (file, filexists, abspath)
        + Ip Network: ( cidrsubnet, cidrhost)
        + Encoding: (base64decode, base64encode, jsonencode )
        + Type Conversion: ( tobool, tomap, tolist)

11. Terraform Workspace
    - command: 
        + terraform workspace show (get current workspace)
        + terraform workspace list
        + terraform workspace select "wsp-name"
    - Cho phép quản lý nhiều env để deployment
    - Lấy trong code: terraform.workspace
    
12. Terraform tfvars
    - Cho phép lưu chữ và quản lý biến env
    - Đuôi file .tfvars
    - Chọn đúng workspace khi run
    - Sử dụng -var-file="path to file tfvars"

13. Terrascan: https://github.com/tenable/terrascan

14. CICD github
    - Save state: https://developer.hashicorp.com/terraform/language/backend/s3

