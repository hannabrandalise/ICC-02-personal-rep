#!/bin/python

opcao = ""

while opcao != "3":

    print ("Escolha uma das opções: ")
    print ("1- Read and display names")
    print ("2- Add a new name")
    print ("3- Exit\n")
    opcao = input()
    print()

    if opcao == "1":

        with open ("names.txt", "r") as file:
            content = file.read()
        print (content + "\n")
   
    elif opcao == "2":
        new_name = input ("Nome a adicionar: ")
        with open ("names.txt", "a") as file: 
            file.write (new_name + "\n")
        print(f"\n'{new_name}' adicionado com sucesso!")
        print ("\nLista atualizada:\n" + content + new_name + "\n")
   
    elif opcao == "3":
        print ("=================================Exit=================================")

    else:
        print ("Opção inválida\n")
