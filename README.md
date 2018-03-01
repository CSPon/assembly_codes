# Raspberry Pi 3 Model B v1.2 Assembly Code
---
Just bunch of ARM assembly codes for praticing.  
Everything is based on 32-bit. Will be adding 64-bit later.  
Order I wrote these codes

---
1. print_syscall
2. print_syscall_gcc
3. load_and_view
4. branch
5. read_input
---

Unless otherwise specified in the comment section, assume  
everything is complied via following commands  
```
as -o <output_name> <assembly_file_name>  
ld -o <executable_name> <output_name>  
```

If comment says it uses gcc compiler, simply compile via  
following commands  
```
gcc -o <executable_name> <assembly_file_name>
```

