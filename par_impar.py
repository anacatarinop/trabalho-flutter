import requests

BASE_URL = "https://par-impar.glitch.me"

def cadastrar_jogador(username):
    response = requests.post(f"{BASE_URL}/novo", json={"username": username})
    return response.json()

def fazer_aposta(username, valor, parimpar, numero):
    response = requests.post(f"{BASE_URL}/aposta", json={"username": username, "valor": valor, "parimpar": parimpar, "numero": numero})
    return response.json()

def listar_jogadores():
    response = requests.get(f"{BASE_URL}/jogadores")
    return response.json()

def jogar_par_impar(username1, username2):
    response = requests.get(f"{BASE_URL}/jogar/{username1}/{username2}")
    return response.json()

def obter_pontos(username):
    response = requests.get(f"{BASE_URL}/pontos/{username}")
    return response.json()

def main():
    print("Bem-vindo ao jogo de Par ou Ímpar!")
    
    username1 = input("Digite o nome do primeiro jogador: ")
    cadastrar_jogador(username1)
    
    username2 = input("Digite o nome do segundo jogador: ")
    cadastrar_jogador(username2)
    
    jogadores = listar_jogadores()
    print("Jogadores cadastrados:", jogadores)
    
    valor = int(input(f"{username1}, digite o valor da aposta: "))
    parimpar = int(input(f"{username1}, escolha 2 para Par e 1 para Ímpar: "))
    numero = int(input(f"{username1}, digite um número entre 1 e 5: "))
    fazer_aposta(username1, valor, parimpar, numero)
    
    valor = int(input(f"{username2}, digite o valor da aposta: "))
    parimpar = int(input(f"{username2}, escolha 2 para Par e 1 para Ímpar: "))
    numero = int(input(f"{username2}, digite um número entre 1 e 5: "))
    fazer_aposta(username2, valor, parimpar, numero)
    
    resultado = jogar_par_impar(username1, username2)
    print("Resultado do jogo:", resultado)
    
    pontos1 = obter_pontos(username1)
    pontos2 = obter_pontos(username2)
    
    print(f"Pontos atuais de {username1}: {pontos1['pontos']}")
    print(f"Pontos atuais de {username2}: {pontos2['pontos']}")

if __name__ == "__main__":
    main()
