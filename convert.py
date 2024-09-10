import json

with open ('ipset', 'r', encoding='utf-8-sig') as file :
	ip_list = file.read().replace(' ','').splitlines()

formatted_data = [{"hostname": ip,"ip" : ""} for ip in ip_list]

with open ('ipset.json', 'w') as json_file:
	json.dump(formatted_data, json_file, indent=1)
print("Файл ipset.json создан.")
