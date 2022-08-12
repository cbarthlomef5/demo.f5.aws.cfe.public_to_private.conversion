if exist %homedrive%%homepath%\.ssh\ (
    copy C:\temp\id_rsa %homedrive%%homepath%\.ssh\id_rsa
    copy C:\temp\known_hosts %homedrive%%homepath%\.ssh\known_hosts
) else (
    mkdir %homedrive%%homepath%\.ssh
    copy C:\temp\id_rsa %homedrive%%homepath%\.ssh\id_rsa
    copy C:\temp\known_hosts %homedrive%%homepath%\.ssh\known_hosts
)

if exist %homedrive%%homepath%\.aws\ (
    copy C:\temp\config %homedrive%%homepath%\.aws\config
    copy C:\temp\credentials %homedrive%%homepath%\.aws\credentials
) else (
    mkdir %homedrive%%homepath%\.aws
    copy C:\temp\config %homedrive%%homepath%\.aws\config
    copy C:\temp\credentials %homedrive%%homepath%\.aws\credentials
)

choco install postman

mkdir %homedrive%%homepath%\Documents\Code
cd %homedrive%%homepath%\Documents\Code

git clone https://github.com/cbarthlomef5/demo.f5.aws.cfe.public_to_private.conversion.git