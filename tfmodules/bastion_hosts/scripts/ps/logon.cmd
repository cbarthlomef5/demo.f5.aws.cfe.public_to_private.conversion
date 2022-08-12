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

mkdir %homedrive%%homepath%\code
cd %homedrive%%homepath%\code

git clone git@github.com:cbarthlomef5/aws.cfe.public.to.private.demo.git