import subprocess

out = subprocess.run(["acpi", "-b"], capture_output=True).stdout.decode('ascii')
time = out.split()[-2]
h, m, s = map(int, time.split(':'))
print(f'{h}:{m:02d} remaining')
