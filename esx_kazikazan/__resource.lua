resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/main.lua",
}

client_scripts {
    "client/main.lua",
}

ui_page {
    'html/ui.html',
}
files {
    'html/ui.html',
    'html/css/main.css',
    'html/js/jquery-3.3.1.js',
    'html/js/app.js',
    'html/js/wScratchPad.min.js',
    'html/img/kazikazan.jpg',
    'html/img/1.png'
}
