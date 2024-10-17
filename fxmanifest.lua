fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Masniuuu1ki'

version '1.0.0'

client_scripts {
    'client.lua',
    'config.lua',
}

shared_scripts {
    'config.lua',
}

server_scripts {
    'server.lua',
    'config.lua',
}

dependencies {
    'es_extended',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/images/*'
}
