
ec2 = {
  vm1 = {
    associate_public_ip_address = true
    ec2_name                    = "sonlh-ec2"
    ami                         = "ami-0b0dcb5067f052a63"
    ec2_monitoring              = true
    instance_type               = "t2.micro"
    ec2_public_key              = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDL8WEkZGfZKmGaQ7qI9zhBn7q2S7MSNn5vNR96ywFPZZgZIeE4MFCeEuS/vx1aJSsx9tJGL1ynKde4YVTnrkqItzmZ8rXMuT4HZQ21MqnKN3+/K/u5Cvsu4eYcbwH///6ZwEV+RcnSEf5OLoEM5ZtxLf2Hzv0FiyU0hBuICmQOGyMQ32oMOrSMf9K7ViLGxnqYnamb18CNSoKTqRx6Z7F2lNa0OV+/eHPhn0cCA5TDwIZPpdli4MM8kFy3RMQvUF2TvLekq/o06FrIGpKJu74Nq3wZ7iagXqbBN7mFJY5Yv5mM0pMj9y355WBN7iJgNHDJEDox/vBoFNSL4IFbTIw4nPBpMPgtY3g3hixkjtYsEiW71/JWVuZvLSTP2G3yUFP1Kvy3158DvqLnRTVQQUuy7j+U50PREp82ehJfcofap/XFN8+PBRYEBrb3tXaPuYUfHZ+jvHQzkt4yJMHUgZdMxghJmbJzC91dAFdj+OldDJDexQtVk6tqH2k7VHSe+cr52WgrbXukWQXTSgJdayjPMJKO2lpZdys18VfK/7oPAgECHr0wXv96ftx9Do0XBX0tWHn4A1pabh/WKsBUVBwgaRe/sAxZGgnonS7x4VtFIX7L6Fa224IM0rYjHvdd7HmyfGhb1YPHrkEy/udkK5G5ShJapiWy6E9flyGN0MTU/Q== sonlh@sonlh-2.local"
    user_data_base64            = null
    trusted_ips                 = ["0.0.0.0/0"]
    ext-tags = {
      ext-name = "ec2-vm1"
    }
  }
}


tags = {
  Name = "sonlh"
}

