import netmiko
host = '192.168.1.75'
connection = netmiko.ConnectHandler(ip=host,
                                    device_type='cisco_ios_telnet',
                                    username='admin',
                                    password='cisco',
                                    secret='class')

#nieuwe lege lijn/regel + bevestigen dat copy geslaagd is "print succes"
print("\n")
print("Save running-config to startup-config...")
connection.save_config()
print("Success!")

print("\n")

#open file to write command output
file = open(host + '_output.txt', 'w')
	
# Execute commands
output = connection.send_command('skip-page-display')
output = connection.send_command('show run')
	
# Print output to console screen
print('-------------- Output from ' + host + '------------------')
print(output)
print()
print()
	
# Write output to file above
file.write(output)
file.close()

connection.disconnect()
