Config = {}
Config.Debug = false -- Set to true to enable debug mode 启用调试模式

Config.DatabaseChecker = {}
Config.DatabaseChecker.Enabled = true -- if true, the phone will check the database for any issues and fix them if possible 自动检查数据库
Config.DatabaseChecker.AutoFix = true -- 自动修复数据库

--[[ FRAMEWORK OPTIONS ]] --
Config.Framework = "auto"
--[[
    Supported frameworks: 支持的框架
        * auto: auto-detect framework (ONLY WORKS WITH THE ONES LISTED BELOW) 自动选择
        * esx: es_extended, https://github.com/esx-framework/esx-legacy
        * qb: qb-core, https://github.com/qbcore-framework/qb-core
        * ox: ox_core, https://github.com/overextended/ox_core
        * vrp2: vrp 2.0 (ONLY THE OFFICIAL vRP 2.0, NOT CUSTOM VERSIONS)
        * standalone: no framework, note that framework specific apps will not work unless you implement the functions 独立, 需要自己实现相关功能
]]
Config.CustomFramework = false -- if set to true and you use standalone, you will be able to use framework specific apps
Config.QBMailEvent = true -- if you want this script to listen for qb email events, enable this. 监听QBMail事件
Config.QBOldJobMethod = false -- use the old method to check job in qb-core? this is slower, and only needed if you use an outdated version of qb-core. 使用旧方法检查QB职业, 仅在您使用旧版本QB框架时才需要

Config.Item = {}
Config.Item.Require = true -- require a phone item to use the phone 打开手机需要物品
Config.Item.Name = "phone" -- name of the phone item 手机物品名称

Config.Item.Unique = false -- should each phone be unique? https://docs.lbphone.com/phone/configuration#unique-phones 独特的手机
Config.Item.Inventory = "auto" --[[
    The inventory you use, IGNORE IF YOU HAVE Config.Item.Unique DISABLED.
    Supported: 支持的库存插件
        * auto: auto-detect inventory (ONLY WORKS WITH THE ONE LISTED BELOW) 自动选择
        * ox_inventory - https://github.com/overextended/ox_inventory
        * qb-inventory - https://github.com/qbcore-framework/qb-inventory
        * lj-inventory - https://github.com/loljoshie/lj-inventory
        * core_inventory - https://www.c8re.store/package/5121548
        * mf-inventory - https://modit.store/products/mf-inventory?variant=39985142268087
        * qs-inventory - https://buy.quasar-store.com/package/4770732
        * codem-inventory - https://codem.tebex.io/package/5900973
]]

Config.ServerSideSpawn = false -- should entities be spawned on the server? (phone prop, vehicles) 服务器生成实体

Config.PhoneModel = `lb_phone_prop` -- the prop of the phone, if you want to use a custom phone model, you can change this here 手机模型
Config.PhoneRotation = vector3(0.0, 0.0, 180.0) -- the rotation of the phone when attached to a player 手机模型旋转
Config.PhoneOffset = vector3(0.0, -0.005, 0.0) -- the offset of the phone when attached to a player 手机模型偏移

Config.DynamicIsland = true -- if enabled, the phone will have a Iphone 14 Pro inspired Dynamic Island. 灵动岛
Config.SetupScreen = true -- if enabled, the phone will have a setup screen when the player first uses the phone. 欢迎屏幕

Config.AutoDeleteNotifications = false -- notifications that are more than X hours old, will be deleted. set to false to disable. if set to true, it will delete 1 week old notifications. 产出超过X小时的通知, true: 删除超过一周的通知, false: 禁用此功能
Config.MaxNotifications = 100 -- the maximum amount of notifications a player can have. if they have more than this, the oldest notifications will be deleted. set to false to disable 最大通知数量, 收到新的删除旧的, 设置false禁用此功能
Config.DisabledNotifications = { -- an array of apps that should not send notifications, note that you should use the app identifier, found in config.json 不发送通知的App, 使用config.json内的标识符
    -- "DarkChat",
}

-- 仅允许白名单职业使用的App
Config.WhitelistApps = {
    -- ["test-app"] = {"police", "ambulance"}
}

-- 禁止黑名单职业使用的App
Config.BlacklistApps = {
    -- ["DarkChat"] = {"police"}
}

Config.Companies = {}
Config.Companies.Enabled = true -- allow players to call companies?
Config.Companies.MessageOffline = true -- if true, players can message companies even if no one in the company is online
Config.Companies.DefaultCallsDisabled = false -- should calles be disabled by default?
Config.Companies.Services = {
    {
        job = "police",
        name = "警察",
        icon = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png",
        canCall = true, -- if true, players can call the company 允许呼叫职业
        canMessage = true, -- if true, players can message the company 允许给职业发信息
        bossRanks = {"boss", "lieutenant"}, -- ranks that can manage the company 可以管理职业的等级
        location = {
            name = "密申罗",
            coords = {
                x = 428.9,
                y = -984.5,
            }
        }
        -- customIcon = "IoShield", -- if you want to use a custom icon for the company, set it here: https://react-icons.github.io/react-icons/icons?name=io5
        -- onCustomIconClick = function()
        --    print("Clicked")
        -- end
    },
    {
        job = "ambulance",
        name = "医护",
        icon = "https://cdn-icons-png.flaticon.com/128/1032/1032989.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "doctor"}, -- ranks that can manage the company
        location = {
            name = "药盒山",
            coords = {
                x = 304.2,
                y = -587.0
            }
        }
    },
    {
        job = "mechanic",
        name = "机械师",
        icon = "https://cdn-icons-png.flaticon.com/128/10281/10281554.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "worker"}, -- ranks that can manage the company
        location = {
            name = "洛圣都改装王",
            coords = {
                x = -336.6,
                y = -134.3
            }
        }
    },
    {
        job = "taxi",
        name = "出租车",
        icon = "https://cdn-icons-png.flaticon.com/128/433/433449.png",
        canCall = true, -- if true, players can call the company
        canMessage = true, -- if true, players can message the company
        bossRanks = {"boss", "driver"}, -- ranks that can manage the company
        location = {
            name = "出租车总部",
            coords = {
                x =984.2,
                y = -219.0
            }
        }
    },
}

Config.Companies.Contacts = { -- not needed if you use the services app, this will add the contact to the contacts app 将职业添加到电话App
    -- ["police"] = {
    --     name = "Police",
    --     photo = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png"
    -- },
}

Config.Companies.Management = {
    Enabled = true, -- if true, employees & the boss can manage the company 启用职业管理

    Duty = true, -- if true, employees can go on/off duty 启用上下班班切换
    -- Boss actions
    Deposit = true, -- if true, the boss can deposit money into the company 允许存款
    Withdraw = true, -- if true, the boss can withdraw money from the company 允许取款
    Hire = true, -- if true, the boss can hire employees 允许雇佣员工
    Fire = true, -- if true, the boss can fire employees 允许开除员工
    Promote = true, -- if true, the boss can promote employees 允许设置员工等级
}

Config.CustomApps = {} -- https://docs.lbphone.com/phone/custom-apps

Config.Valet = {}
Config.Valet.Enabled = true -- allow players to get their vehicles from the phone 允许通过车库App获得车辆
Config.Valet.Price = 100 -- price to get your vehicle 获得车辆花费
Config.Valet.Model = `S_M_Y_XMech_01` -- 驾驶员Ped模型
Config.Valet.Drive = true -- should a ped bring the car, or should it just spawn in front of the player? true: 驾驶员将车辆开过来 false: 直接生成
Config.Valet.DisableDamages = false -- disable vehicle damages (engine & body health) on esx 在ESX上禁用车身和引擎损坏
Config.Valet.FixTakeOut = false -- repair the vehicle after taking it out? 取出车辆时修理

Config.HouseScript = "auto" --[[
    The housing script you use on your server
    Supported: 支持的房产插件
        * loaf_housing - https://store.loaf-scripts.com/package/4310850
        * qb-houses - https://github.com/qbcore-framework/qb-houses
        * qs-housing - https://buy.quasar-store.com/package/5677308
]]

--[[ VOICE OPTIONS ]] --
Config.Voice = {}
Config.Voice.CallEffects = false -- enable call effects while on speaker mode? (NOTE: This may create sound-issues if you have too many submixes registered in your server) 在扬声器开启时启用电话效果 (若服务器存在过多子混音可能造成声音问题)
Config.Voice.System = "auto"
--[[
    Supported voice systems: 支持的语音系统
        * pma: pma-voice - HIGHLY RECOMMENDED 强 烈 推 荐
        * mumble: mumble-voip - Not recommended, update to pma-voice
        * salty: saltychat - Not recommended, change to pma-voice
        * toko: tokovoip - Not recommended, change to pma-voice
]]

Config.Voice.HearNearby = true --[[
    Only works with pma-voice
    仅支持pma-voice

    If true, players will be heard on instagram live if they are nearby
    若为true, 在直播中的玩家和附近玩家均可听到主播说话
    If false, only the person who is live will be heard
    若为false, 仅在直播中的玩家可以听到主播说话

    If true, allow nearby players to listen to phone calls if speaker is enabled
    若为true, 当扬声器开启时附近的玩家可以听到电话中的声音
    If false, only the people in the call will be able to hear each other
    若为false, 仅电话中的两人可以互相听到

    This feature is a work in progress and may not work as intended. It may have an impact on performance.
    实验性功能, 可能存在问题或对性能造成影响
]]


Config.Voice.RecordNearby = true --[[
    Should video recordings include nearby players?
    视频录制是否包含附近玩家
]]

--[[ PHONE OPTIONS ]] --
Config.Locations = { -- Locations that'll appear in the maps app. 地图App中的位置
    {
        position = vector2(428.9, -984.5),
        name = "警察局",
        description = "密申罗警察局",
        icon = "https://cdn-icons-png.flaticon.com/512/7211/7211100.png",
    },
    {
        position = vector2(304.2, -587.0),
        name = "医院",
        description = "药盒山医院",
        icon = "https://cdn-icons-png.flaticon.com/128/1032/1032989.png",
    },
}

Config.Locales = { -- languages that the player can choose from when setting up a phone [Check the docs to see which languages the phone supports]
    {
        locale = "en",
        name = "English"
    },
    {
        locale = "zh-cn",
        name = "简体中文"
    },
    {
        locale = "de",
        name = "Deutsch"
    },
    {
        locale = "fr",
        name = "Français"
    },
    {
        locale = "es",
        name = "Español"
    },
    {
        locale = "nl",
        name = "Nederlands"
    },
    {
        locale = "dk",
        name = "Dansk"
    },
    {
        locale = "no",
        name = "Norsk"
    },
    {
        locale = "th",
        name = "ไทย"
    },
    {
        locale = "ar",
        name = "عربي"
    },
    {
        locale = "ru",
        name = "Русский"
    },
    {
        locale = "cs",
        name = "Czech"
    },
    {
        locale = "sv",
        name = "Svenska"
    },
    {
        locale = "pl",
        name = "Polski"
    },
    {
        locale = "hu",
        name = "Magyar"
    },
    {
        locale = "tr",
        name = "Türkçe"
    },
    {
        locale = "pt-br",
        name = "Português (Brasil)"
    },
    {
        locale = "pt-pt",
        name = "Português"
    },
    {
        locale = "it",
        name = "Italiano"
    }
}

Config.DefaultLocale = "zh-cn"
Config.DateLocale = "zh-Hans" -- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Intl/DateTimeFormat/DateTimeFormat

Config.FrameColor = "#39334d" -- This is the color of the phone frame. Default (#39334d) is SILVER. 默认手机框架颜色(银色)
Config.AllowFrameColorChange = true -- Allow players to change the color of their phone frame? 允许玩家修改手机框架颜色

Config.PhoneNumber = {}
Config.PhoneNumber.Format = "({3}) {3}-{4}" -- Don't touch unless you know what you're doing. IMPORTANT: The sum of the numbers needs to be equal to the phone number length + prefix length 别动, 除非你知道你在干什么, 数字总和需等于区号长度加电话号码长度
Config.PhoneNumber.Length = 7 -- This is the length of the phone number WITHOUT the prefix. 电话号码长度(不包含区号)
Config.PhoneNumber.Prefixes = { -- These are the first numbers of the phone number, usually the area code. They all need to be the same length 区号, 长度需保持一致
    "205",
    "907",
    "480",
    "520",
    "602"
}

Config.Battery = {} -- WITH THESE SETTINGS, A FULL CHARGE WILL LAST AROUND 2 HOURS.
Config.Battery.Enabled = false -- Enable battery on the phone, you'll need to use the exports to charge it. 启用电池系统
Config.Battery.ChargeInterval = { 5, 10 } -- How much battery
Config.Battery.DischargeInterval = { 50, 60 } -- How many seconds for each percent to be removed from the battery
Config.Battery.DischargeWhenInactiveInterval = { 80, 120 } -- How many seconds for each percent to be removed from the battery when the phone is inactive
Config.Battery.DischargeWhenInactive = true -- Should the phone remove battery when the phone is closed?

Config.CurrencyFormat = "$%s" -- ($100) Choose the formatting of the currency. %s will be replaced with the amount. 货币格式, %s会被替换为数字
Config.MaxTransferAmount = 1000000 -- The maximum amount of money that can be transferred at once via wallet / messages. 允许通过钱包/短信转账的最大金额

Config.TransferLimits = {}
Config.TransferLimits.Daily = false -- The maximum amount of money that can be transferred in a day. Set to false for unlimited. 一天内允许转账的最大金额, 设为false不限制
Config.TransferLimits.Weekly = false -- The maximum amount of money that can be transferred in a week. Set to false for unlimited. 一周内允许转账的最大金额, 设为false不限制

Config.EnableMessagePay = true -- Allow players to pay other players via messages? 允许通过短信转账
Config.EnableVoiceMessages = true -- Allow players to send voice messages? 允许发送语音备忘录

Config.CityName = "洛圣都" -- The name that's being used in the weather app etc. 天气App显示的城市名称
Config.RealTime = true -- if true, the time will use real life time depending on where the user lives, if false, the time will be the ingame time. true: 使用用户所在位置现实时间 false: 使用游戏时间
Config.CustomTime = false -- NOTE: disable Config.RealTime if using this. you can set this to a function that returns custom time, as a table: { hour = 0-24, minute = 0-60 }

Config.EmailDomain = "lbphone.com"
Config.AutoCreateEmail = false -- should the phone automatically create an email for the player when they set up the phone? 设置手机时自动创建邮箱
Config.DeleteMail = true -- allow players to delete mails in the mail app? 允许删除邮件

Config.DeleteMessages = true -- allow players to delete messages in the messages app? 允许删除短信

Config.SyncFlash = true -- should flashlights be synced across all players? May have an impact on performance 同步手电筒, 可能影响性能
Config.EndLiveClose = false -- should InstaPic live end when you close the phone? 关闭手机时是否结束直播

Config.AllowExternal = { -- allow people to upload external images? (note: this means they can upload nsfw / gore etc) 允许使用外部图片链接
    Gallery = false, -- allow importing external links to the gallery?
    Twitter = false, -- set to true to enable external images on that specific app, set to false to disable it.
    Instagram = false,
    Tinder = false,
    TikTok = false,
    YellowPages = false,
    MarketPlace = false,
    Mail = false,
    Messages = false,
    Other = true, -- other apps that don't have a specific setting (ex: setting a profile picture for a contact, backgrounds for the phone etc)
}

-- Blacklisted domains for external images. You will not be able to upload from these domains.
-- 不允许使用的外部图片域名
Config.ExternalBlacklistedDomains = {
    "imgur.com",
    "discord.com",
    "discordapp.com",
}

-- Whitelisted domains for external images. If this is not empty/nil/false, you will only be able to upload images from these domains.
-- 允许使用的外部图片域名, 设置为 空/nil/false 允许所有域名
Config.ExternalWhitelistedDomains = {
    -- "fivemanage.com"
}

Config.WordBlacklist = {}
Config.WordBlacklist.Enabled = false
Config.WordBlacklist.Apps = { -- apps that should use the word blacklist (if Config.WordBlacklist.Enabled is true) 使用黑名单的App
    Birdy = true,
    InstaPic = true,
    Trendy = true,
    Spark = true,
    Messages = true,
    Pages = true,
    MarketPlace = true,
    DarkChat = true,
    Mail = true,
}
Config.WordBlacklist.Words = {
    -- array of blacklisted words, e.g. "badword", "anotherbadword" 黑名单词语
}

-- 创建账号时自动关注
Config.AutoFollow = {}
Config.AutoFollow.Enabled = false

Config.AutoFollow.Birdy = {}
Config.AutoFollow.Birdy.Enabled = true
Config.AutoFollow.Birdy.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoFollow.InstaPic = {}
Config.AutoFollow.InstaPic.Enabled = true
Config.AutoFollow.InstaPic.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoFollow.TikTok = {}
Config.AutoFollow.TikTok.Enabled = true
Config.AutoFollow.TikTok.Accounts = {} -- array of usernames to automatically follow when creating an account. e.g. "username", "anotherusername"

Config.AutoBackup = true -- should the phone automatically create a backup when you get a new phone? 当获取新手机时自动创建备份

Config.Post = {} -- What apps should send posts to discord? You can set your webhooks in server/webhooks.lua
Config.Post.Birdy = true -- Announce new posts on Birdy?
Config.Post.InstaPic = true -- Anmnounce new posts on InstaPic?
Config.Post.Accounts = {
    Birdy = {
        Username = "Birdy",
        Avatar = "https://loaf-scripts.com/fivem/lb-phone/icons/Birdy.png"
    },
    InstaPic = {
        Username = "InstaPic",
        Avatar = "https://loaf-scripts.com/fivem/lb-phone/icons/InstaPic.png"
    }
}

Config.BirdyTrending = {}
Config.BirdyTrending.Enabled = true -- show trending hashtags? 展示趋势标签
Config.BirdyTrending.Reset = 7 * 24 -- How often should trending hashtags be reset on birdy? (in hours) 几小时重置一次趋势标签

Config.BirdyNotifications = false -- should everyone get a notification when someone posts? 发帖时每个人都收到通知

Config.PromoteBirdy = {}
Config.PromoteBirdy.Enabled = true -- should you be able to promote post? 允许推广帖子
Config.PromoteBirdy.Cost = 2500 -- how much does it cost to promote a post? 推广帖子要花费多少钱
Config.PromoteBirdy.Views = 100 -- how many views does a promoted post get? 推广帖子增加多少浏览量

Config.TikTok = {}
Config.TikTok.TTS = {
    {"English (US) - Female", "en_us_001"},
    {"English (US) - Male 1", "en_us_006"},
    {"English (US) - Male 2", "en_us_007"},
    {"English (US) - Male 3", "en_us_009"},
    {"English (US) - Male 4", "en_us_010"},

    {"English (UK) - Male 1", "en_uk_001"},
    {"English (UK) - Male 2", "en_uk_003"},

    {"English (AU) - Female", "en_au_001"},
    {"English (AU) - Male", "en_au_002"},

    {"French - Male 1", "fr_001"},
    {"French - Male 2", "fr_002"},

    {"German - Female", "de_001"},
    {"German - Male", "de_002"},

    {"Spanish - Male", "es_002"},

    {"Spanish (MX) - Male", "es_mx_002"},

    {"Portuguese (BR) - Female 2", "br_003"},
    {"Portuguese (BR) - Female 3", "br_004"},
    {"Portuguese (BR) - Male", "br_005"},

    {"Indonesian - Female", "id_001"},

    {"Japanese - Female 1", "jp_001"},
    {"Japanese - Female 2", "jp_003"},
    {"Japanese - Female 3", "jp_005"},
    {"Japanese - Male", "jp_006"},

    {"Korean - Male 1", "kr_002"},
    {"Korean - Male 2", "kr_004"},
    {"Korean - Female", "kr_003"},

    {"Ghostface (Scream)", "en_us_ghostface"},
    {"Chewbacca (Star Wars)", "en_us_chewbacca"},
    {"C3PO (Star Wars)", "en_us_c3po"},
    {"Stitch (Lilo & Stitch)", "en_us_stitch"},
    {"Stormtrooper (Star Wars)", "en_us_stormtrooper"},
    {"Rocket (Guardians of the Galaxy)", "en_us_rocket"},

    {"Singing - Alto", "en_female_f08_salut_damour"},
    {"Singing - Tenor", "en_male_m03_lobby"},
    {"Singing - Sunshine Soon", "en_male_m03_sunshine_soon"},
    {"Singing - Warmy Breeze", "en_female_f08_warmy_breeze"},
    {"Singing - Glorious", "en_female_ht_f08_glorious"},
    {"Singing - It Goes Up", "en_male_sing_funny_it_goes_up"},
    {"Singing - Chipmunk", "en_male_m2_xhxs_m03_silly"},
    {"Singing - Dramatic", "en_female_ht_f08_wonderful_world"}
}

-- ICE Servers for WebRTC (ig live, live video). If you don't know what you're doing, leave this as it is.
-- see https://developer.mozilla.org/en-US/docs/Web/API/RTCPeerConnection/RTCPeerConnection
-- Config.RTCConfig = {
--     iceServers = {
--         { urls = "stun:stun.l.google.com:19302" },
--     }
-- }

Config.Crypto = {}
Config.Crypto.Enabled = true
Config.Crypto.Coins = {"bitcoin","ethereum","tether","binancecoin","usd-coin","ripple","binance-usd","cardano","dogecoin","solana","shiba-inu","polkadot","litecoin","bitcoin-cash"}
Config.Crypto.Currency = "usd" -- currency to use for crypto prices. https://api.coingecko.com/api/v3/simple/supported_vs_currencies
Config.Crypto.Refresh = 5 * 60 * 1000 -- how often should the crypto prices be refreshed (client cache)? (Default 5 minutes)
Config.Crypto.QBit = true -- support QBit? (requires qb-crypto & qb-core)

Config.KeyBinds = {
    -- Find keybinds here: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
    Open = { -- toggle the phone
        Command = "phone",
        Bind = "F1",
        Description = "切换手机"
    },
    Focus = { -- keybind to toggle the mouse cursor. 切换鼠标光标
        Command = "togglePhoneFocus",
        Bind = "LMENU",
        Description = "切换手机光标"
    },
    StopSounds = { -- in case the sound would bug out, you can use this command to stop all sounds. 如果手机声音出现问题, 可使用此命令强制停止所有声音
        Command = "stopSounds",
        Bind = false,
        Description = "停止手机所有声音"
    },

    FlipCamera = {
        Command = "flipCam",
        Bind = "UP",
        Description = "切换摄像头"
    },
    TakePhoto = {
        Command = "takePhoto",
        Bind = "RETURN",
        Description = "拍照/录像"
    },
    ToggleFlash = {
        Command = "toggleCameraFlash",
        Bind = "E",
        Description = "切换闪光灯"
    },
    LeftMode = {
        Command = "leftMode",
        Bind = "LEFT",
        Description = "更改模式"
    },
    RightMode = {
        Command = "rightMode",
        Bind = "RIGHT",
        Description = "更改模式"
    },

    AnswerCall = {
        Command = "answerCall",
        Bind = "RETURN",
        Description = "接听电话"
    },
    DeclineCall = {
        Command = "declineCall",
        Bind = "BACK",
        Description = "挂断电话"
    },
    UnlockPhone = {
        Bind = "SPACE",
        Description = "解锁手机",
    },
}

Config.KeepInput = true -- keep input when nui is focused (meaning you can walk around etc) NUI获取焦点时允许输入 (打开手机时可以移动等)

--[[ PHOTO / VIDEO OPTIONS ]] --
-- Set your api keys in lb-phone/server/apiKeys.lua
-- 在 lb-phone/server/apiKeys.lua 设置 API Key
Config.UploadMethod = {}
-- You can edit the upload methods in lb-phone/shared/upload.lua
-- 在 lb-phone/shared/upload.lua 自定义上传方式
-- 推荐使用 Fivemanage 或 KOOK 作为上传方式
-- We recommend Fivemanage, https://fivemanage.com
-- A video tutorial for how to set up Fivemanage can be found here: https://www.youtube.com/watch?v=y3bCaHS6Moc
-- If you want to host uploads yourself, you can use LBUpload: https://github.com/lbphone/lb-upload
-- We STRONGLY discourage using Discord as an upload method, as uploaded files may become inaccessible after a while.
Config.UploadMethod.Video = "Fivemanage" -- "Fivemanage" or "KOOK" or "LBUpload" or "Custom"
Config.UploadMethod.Image = "Fivemanage" -- "Fivemanage" or "KOOK" or "LBUpload" or "Custom
Config.UploadMethod.Audio = "Fivemanage" -- "Fivemanage" or "KOOK" or "LBUpload" or "Custom"

Config.Video = {}
Config.Video.Bitrate = 400 -- video bitrate (kbps), increase to improve quality, at the cost of file size 视频比特率, 以文件大小为代价提高画质
Config.Video.FrameRate = 24 -- video framerate (fps), 24 fps is a good mix between quality and file size used in most movies 视频帧率, 推荐24
Config.Video.MaxSize = 25 -- max video size (MB) 视频最大大小
Config.Video.MaxDuration = 60 -- max video duration (seconds) 视频最大时长

Config.Image = {}
Config.Image.Mime = "image/webp" -- image mime type, "image/webp" or "image/png" or "image/jpg" 图片格式
Config.Image.Quality = 0.95 -- 图片质量
