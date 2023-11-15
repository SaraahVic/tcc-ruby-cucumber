# language: pt
Funcionalidade: Camera
  Testes para validar as funções da camera
  Fundo:
    Dado que o appium foi iniciado

  Cenario: Capturar foto
    Dado que estou na tela inicial da camera
    Quando eu clico no botão de capturar
    Entao uma foto é capturada
    E o aplicativo é finalizado

  Cenario: Capturar foto com filtro
    Dado que estou na tela inicial da camera
    E adiciono um efeito
    Quando eu clico no botão de capturar
    Entao uma foto é capturada
    E o aplicativo é finalizado

  Cenario: Gravar vídeo
    Dado que estou na tela inicial da camera
    E seleciono a opção 'Video'
    Quando eu clico no botão de capturar
    Entao a gravação de vídeo deve iniciar
    E clico no botão de pausar
    Entao a gravação deve ser concluída
    E o aplicativo é finalizado

  Cenario: Capturar foto com camera traseira e frontal
    Dado que estou na tela inicial da camera
    Quando eu clico no botão de capturar
    Entao uma foto é capturada
    E eu clico para mudar camera
    Quando eu clico no botão de capturar
    Entao uma foto é capturada
    E o aplicativo é finalizado