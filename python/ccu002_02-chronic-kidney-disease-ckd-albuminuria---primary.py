# CVD-COVID-UK consortium, William N Whiteley, et al., 2024.

import sys, csv, re

codes = [{"code":"950181000000106","system":"snomedct"},{"code":"950101000000101","system":"snomedct"},{"code":"949421000000107","system":"snomedct"},{"code":"950311000000102","system":"snomedct"},{"code":"949561000000100","system":"snomedct"},{"code":"949901000000109","system":"snomedct"},{"code":"949481000000108","system":"snomedct"},{"code":"950081000000107","system":"snomedct"},{"code":"950231000000104","system":"snomedct"},{"code":"949521000000108","system":"snomedct"},{"code":"949621000000109","system":"snomedct"},{"code":"949401000000103","system":"snomedct"},{"code":"950251000000106","system":"snomedct"},{"code":"950291000000103","system":"snomedct"},{"code":"950061000000103","system":"snomedct"},{"code":"949881000000106","system":"snomedct"},{"code":"949921000000100","system":"snomedct"},{"code":"950211000000107","system":"snomedct"}];
REQUIRED_CODES = 1;
with open(sys.argv[1], 'r') as file_in, open('ccu002_02-chronic-kidney-disease-potential-cases.csv', 'w', newline='') as file_out:
    csv_reader = csv.DictReader(file_in)
    csv_writer = csv.DictWriter(file_out, csv_reader.fieldnames + ["ccu002_02-chronic-kidney-disease-ckd-albuminuria---primary-identified"])
    csv_writer.writeheader();
    codes_identified = 0;
    for row in csv_reader:
        newRow = row.copy();
        for cell in row:
            # Iterate cell lists (e.g. codes)
            for item in re.findall(r'\(([^,]*)\,', row[cell]):
                if(item in list(map(lambda code: code['code'], codes))): codes_identified+=1;
                if(codes_identified>=REQUIRED_CODES):
                    newRow["ccu002_02-chronic-kidney-disease-ckd-albuminuria---primary-identified"] = "CASE";
                    break;
            if(codes_identified>=REQUIRED_CODES): break;
        if(codes_identified<REQUIRED_CODES):
            newRow["ccu002_02-chronic-kidney-disease-ckd-albuminuria---primary-identified"] = "UNK";
        codes_identified=0;
        csv_writer.writerow(newRow)
