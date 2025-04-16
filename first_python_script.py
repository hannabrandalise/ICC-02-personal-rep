#!/bin/python

print ("Escolha uma das opções: ")
print ("1- Read and display names")
print ("2- Add a new name")
print ("3- Exit")

opcao = input("Opção desejada: ")

if opcao == "1":

    with open ("names.txt", "r") as file:
        content = file.read()
    print (content)
   
elif opcao == "2":
   with open ("names.txt", "r+") as file: 
    content = file.read()
    new_name = input ("Nome a adicionar: ")
    file.write (new_name + "\n")
        
    print("Conteúdo atualizado:")
    print (content + new_name)
   
elif opcao == "3":
   print ("Exit")

else:
   print ("Opção inválida")
