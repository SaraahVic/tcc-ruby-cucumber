Dado("que o appium foi iniciado") do
  require 'appium_lib'
  @capabilitie = {
    caps: {
      platformName: 'Android',
      deviceName: 'RX8T50DEBYP',
      appPackage: 'com.sec.android.app.camera',
      appActivity: 'com.sec.android.app.camera.Camera'
    }
  }
  @driver = Appium::Driver.new(@capabilitie, true)
  @driver.start_driver
end

Dado("que estou na tela inicial da camera") do
  @capturar_botao = @driver.find_element(:id, 'normal_center_button')
  @capturar_botao.displayed?
end

E("adiciono um efeito") do
  efeito_botao = @driver.find_element(:xpath, '//android.widget.FrameLayout[@content-desc="Effects, New content available"]')
  @driver.action.click(efeito_botao).perform

  efeito_loli_botao = @driver.find_element(:xpath, '//android.widget.FrameLayout[@content-desc="Lolli"]')
  @driver.action.click(efeito_loli_botao).perform
  sleep 5
end

E("eu clico para mudar camera") do
  mudar_camera = @driver.find_element(:id, 'switch_camera_button')
  @driver.action.click(mudar_camera).perform
  sleep 5

end

E("seleciono a opção 'Video'") do
  video_botao = @driver.find_element(:xpath, '//android.widget.Button[@text="VIDEO"]')
  @driver.action.click(video_botao).perform
end

E("clico no botão de pausar") do
  sleep 5
  pause_botao = @driver.find_element(:id, 'stop_button')
  @driver.action.click(pause_botao).perform

end

Entao("a gravação deve ser concluída") do
  event = @driver.execute_script('mobile: shell', command: 'logcat -d')
  puts event

  if event.include?('isVideoRecordAllowed : true')
    # CameraGenericEventHandler: onPictureSaved : end
    puts 'Video concluído!'
  else
    puts 'Erro ao concluir vídeo!'
  end
end

Entao("a gravação de vídeo deve iniciar") do
  event = @driver.execute_script('mobile: shell', command: 'logcat -d')
  puts event

  if event.include?('VideoMaker: initializeMaker')
    # CameraGenericEventHandler: onPictureSaved : end
    puts 'Video iniciado!'
  else
    puts 'Erro ao iniciar vídeo!'
  end
end

Quando("eu clico no botão de capturar") do
  @driver.action.click(@capturar_botao).perform
end

Entao("uma foto é capturada") do
  event = @driver.execute_script('mobile: shell', command: 'logcat -d')
  puts event

  if event.include?('onPictureSaved : end')
    # CameraGenericEventHandler: onPictureSaved : end
    puts 'Foto tirada com sucesso!'
  else
    puts 'Erro ao tirar foto.'
  end
end

E("o aplicativo é finalizado") do
  @driver.driver_quit
end