# Iac - Provider AWS
Dokumentasi pembuatan infrastruktur dan provisionig server di aws
Materi    : Sekolah  Devops Cilsy
App       : sosial-media, landingpage, dan wordpress
Status    : siswa batch 6

PEMBAHASAN:
1. TERRAFORM
    - vpc berisi pembuatan subnet, sekuriti group, igw 
    - ec2 membuat 2 instance untuk jenkins master dan bastion controller cluster
        terraform sudah di set menginstall python untuk connect ansible, generate ssh-key,  
    - rds 
    - s3
2. ANSIBLE
    - isi terlebih dahulu ip server yang akan di provisioning
    - simpan id_rsa.pub ke autorized di masing-masing server yg akan di remote
    - rules dipersiapkan untuk menyediakan k8s cluster dengan bantuan tool kops

##info detail menyusul selanjutnya### 
