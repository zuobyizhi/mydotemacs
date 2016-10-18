(require 'package)
(add-to-list 'package-archives'
  ("elpa" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives' 
  ("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives'
  ("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/elisp/evil")
(require 'evil)
(evil-mode 1)
(global-set-key (kbd "C-h")
'backward-delete-char-untabify)

(electric-pair-mode 1)
(ido-mode t)

(setq visible-bell t)

(set-foreground-color "grey")
(set-background-color "black")
(set-cursor-color "gold1")
(set-mouse-color "gold1")

(tool-bar-mode 0)  
(menu-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-startup-message 0)
(setq gnus-inhibit-startup-message 0)

;;;---  关闭出错量的提示音
(setq visible-bell t)
;; ---禁止备份
(setq make-backup-files nil)
;; 不生成临时文件
(setq-default make-backup-files nil)
;;允许emacs和外部其他程序的粘贴
(setq x-select-enable-clipboard t)

;;;--- 显示行号
(require 'linum)
(setq linum-format "%3d ")
;;;---对所有文件生效
(add-hook 'find-file-hooks (lambda () (linum-mode 1)))
;;;--- 显示列号
(setq column-number-mode t)
(setq line-number-mode t)

;;设置窗口位置为屏库左上角(0,0)
;;(set-default-font "Courier New-12")
;;(set-default-font "Verdana-12")
;;(set-default-font "Microsoft YaHei-12")
(set-default-font "consolas-12")
;;(set-default-font "Fixedsys Excelsior 3.01-14")
;;(dolist (charset '(kana han symbol cjk-misc bopomofo))
;;  (set-fontset-font (frame-parameter nil 'font)
;;            charset
;;            (font-spec :family "Microsoft Yahei" :size 14)))
;; (set-frame-position (selected-frame) 50 50)
(set-frame-position (selected-frame) 700 50)
;;(when window-system (set-frame-size (selected-frame) 140 50))
;;(split-window-right)

;;for Courier New
;;(when window-system (set-frame-size (selected-frame) 70 40))
;;for consolas
;;(when window-system (set-frame-size (selected-frame) 80 40))
(when window-system (set-frame-size (selected-frame) 80 40))
;(split-window-below)
;;window jump
(global-set-key (kbd "s-k") 'windmove-up)
(global-set-key (kbd "s-j") 'windmove-down)
(global-set-key (kbd "s-h") 'windmove-left)
(global-set-key (kbd "s-l") 'windmove-right)

 (show-paren-mode t)
;;打开括号匹配显示模式

;; w3m
;load & init 
(add-to-list 'exec-path "~/.emacs.d/w3m")
(autoload 'w3m "w3m" "interface for w3m on emacs" t)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)

;settings
(setq w3m-use-cookies t)
(setq w3m-home-page "http://wallstreetcn.com/")

;;(require 'mime-w3m) 
;;(setq w3m-default-display-inline-image t) 
;;(setq w3m-default-toggle-inline-images t)
;; 设置快捷键
(global-set-key [f5] 'w3m) 

;; 语法高亮
(global-font-lock-mode t)

;; 防止页面滚动时跳动
(setq scroll-margin 3
     scroll-conservatively 10000)

(load "desktop")
(desktop-load-default)
(desktop-read)
;;(add-hook 'kill-emacs-hook '(lambda()(desktop-save "~/")))
(desktop-save-mode 1)

(add-to-list 'load-path "~/.emacs.d/elisp/popup")
(add-to-list 'load-path "~/.emacs.d/elisp/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/auto-complete/ac-dict")
(ac-config-default)
(setq ac-auto-show-menu 0.2)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(auto-image-file-mode)
;; (setq frame-title-format "emacs@%b")
;; (setq frame-title-format "emacs@%f")
(setq frame-title-format "%b@%f@emacs")
(mouse-avoidance-mode 'animate)

;;设置speedbar默认出现在左侧
;;(add-hook 'speedbar-mode-hook
		  ;;(lambda ()
			;;(auto-raise-mode 1)
			;;(add-to-list 'speedbar-frame-parameters '(top . 0))
			;;(add-to-list 'speedbar-frame-parameters '(right . 0))
			;;))

;;(add-to-list 'load-path "~/.emacs.d/")
;;(require 'sr-speedbar)

;;;;;;;;;;;;;;;;;;
;; nyan-mode
;;;;;;;;;;;;;;;;;;
;; 这里你要将路径改为你的东西放置的文件夹
(add-to-list 'load-path "~/.emacs.d/elisp/nyan-mode")
(require 'nyan-mode)
(setq default-mode-line-format
      (list ""
            'mode-line-modified
            "<"
            "zuobyige" ;; 这里可以改成自己的名字神马的
            "> "
            "%10b"
            '(:eval (when nyan-mode (list (nyan-create))));;注意添加此句到你的format配置列表中
            " "
            'default-directory
            " "
            "%[("
            'mode-name
            'minor-mode-list
            "%n"
            'mode-line-process
            ")%]--"
            "Line %l--"
            '(-3 . "%P")
            "-%-"))
(nyan-mode t);;启动nyan-mode
(nyan-start-animation);;开始舞动吧（会耗cpu资源）

(require 'color-theme)
(color-theme-initialize)
;; 这个是你选择的主题，后面的calm forest就是它的名字，注意使用小写。
;;(color-theme-billw) 
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/themes/")
;;(color-theme-zenburn) 
(load-theme 'zenburn t)

(defun my-encoding (string)
  "Encoding."
  (decode-coding-string
(encode-coding-string string 'utf-8) 'gbk))

(defun one--create-link-in-buffer (_title _url)
  "Insert clickable string inside a buffer."
  (let ((title _title)
                (url _url)
                (map (make-sparse-keymap)))
    (define-key map (kbd "<RET>")
      #'(lambda (e) (interactive "p") (browse-url url)))
    (define-key map (kbd "<down-mouse-1>")
      #'(lambda (e) (interactive "p") (browse-url url)))
    (insert
     (propertize
      title
      'keymap map
      'mouse-face 'highlight))))

(defun dealscript (str)
  "deal sina api script"
  ;;(replace-regexp-in-string "var hq_str_s_(sh|sz)[0-9]*" "" str)
  ;;(replace-regexp-in-string "var hq_str_s_s[zh][0-9]*=" "" str)
  (replace-regexp-in-string "var hq_str_s_" "" str)
)

(defun my-stock-list ()
  "stocks"
  (interactive)
  (progn
    (switch-to-buffer-other-window "*stocks*")
    (erase-buffer)
    (insert (with-current-buffer
	      (url-retrieve-synchronously "http://hq.sinajs.cn/list=s_sh000001,s_sz399001,s_sz002739,s_sz300443,s_sh600362")
	      ;;(my-encoding (buffer-string))
	      (dealscript (my-encoding (buffer-string)))
	      )
	    )
	;;(re-search-forward "^$" nil 'move)
	;;(one--create-link-in-buffer "百度" "https://www.baidu.com/")
	)
  (other-window 1)
  )
(global-set-key [f6] 'my-stock-list) 

;;tab设置
(setq indent-tabs-mode t)
(setq default-tab-width 4)
(setq tab-width 4)
;; (custom-set-variables '(tab-width 4))

(global-set-key [f3] 'eshell) 
(global-set-key [f4] 'buffer-menu) 
(global-set-key [f8] 'other-window) 
(global-set-key [f9] 'delete-other-windows) 

(defun w3m-zhihu-search (key)
  "zhihu search with w3m"
  (interactive "szhihu search with w3m: ")
  (w3m-browse-url (format "https://www.zhihu.com/search?type=content&q=%s"  key)
    )
  )
;; (global-set-key [f10] 'w3m-zhihu-search) 
(defun zhihu-search (key)
  "zhihu search"
  (interactive "szhihu search: ")
  (browse-url (format "https://www.zhihu.com/search?type=content&q=%s"  key)
    )
  )
(global-set-key [C-f10] 'zhihu-search) 

(defun w3m-stock-chart (key)
  "zhihu search with w3m"
  (interactive "schart search with w3m: ")
  (w3m-browse-url (format "http://image.sinajs.cn/newchart/daily/n/%s.gif"  key)
    )
  )
(global-set-key [C-f6] 'w3m-stock-chart) 

(defun w3m-stock-chart-at-point ()
  "zhihu search with w3m"
  (interactive )
  (w3m-browse-url (format "http://image.sinajs.cn/newchart/daily/n/%s.gif"  (thing-at-point 'symbol))
    )
  )
(global-set-key [M-f6] 'w3m-stock-chart-at-point) 

(defun w3m-bing-search (key)
  "bing search with w3m"
  (interactive "sbing search with w3m: ")
  (w3m-browse-url (format "https://www.bing.com/search?q=%s"  key)
    )
  )
(global-set-key [f12] 'w3m-bing-search) 
(defun bing-search (key)
  "bing search"
  (interactive "sbing search: ")
  (browse-url (format "https://www.bing.com/search?q=%s"  key)
    )
  )
(global-set-key [C-f12] 'bing-search) 

(defun github-search (key)
  "github search"
  (interactive "sgithub: ")
  (browse-url (format "https://github.com/search?utf8=✓&q=%s"  key)
    )
  )
;; (global-set-key [C-f2] 'github-search)
(defun w3m-github-search (key)
  "github search with w3m"
  (interactive "sgithub with w3m: ")
  (w3m-browse-url (format "https://github.com/search?utf8=✓&q=%s"  key)
    )
  )
;; (global-set-key [f2] 'w3m-github-search)

(defun stackoverflow-search (key)
  "stackoverflow search"
  (interactive "sstackoverflow search: ")
  (browse-url (format "http://stackoverflow.com/search?q=%s"  key)
    )
  )
;; (global-set-key [f7] 'stackoverflow-search)
;; (global-set-key [C-f7] 'stackoverflow-search)
(defun jiejingu-search (key)
  "jiejingu search"
  (interactive "sjiejingu search: ")
  (browse-url (format "http://data.eastmoney.com/dxf/q/%s.html" key)
    )
  )

;; (add-to-list 'load-path "~/.emacs.d")
(require 'smex) ; Not needed if you use package.el
(smex-initialize) ; Can be omitted. This might cause a (minimal) delay
                  ; when Smex is auto-initialized on its first run.
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "S-M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key [f1] 'ivy-smex) 
;;(global-set-key [f1] 'smex-major-mode-commands) 

;;https://github.com/mickeynp/discover.el
;;(require 'discover)
;;(global-discover-mode 1)

(require 'cl)
;;https://github.com/magnars/s.el
(require 's)

(add-to-list 'load-path
			 "~/.emacs.d/elisp/yasnippet")
(require 'yasnippet)
(yas-global-mode 1)

;;hydra
;;(defhydra hydra-search 
  ;;(:foreign-keys warn) ;;hydra和evil有冲突，必须设置成warn
  ;;"search"
  ;;("q" nil "quit")
  ;;("b" bing-search "bing" :exit t)
  ;;("g" github-search "github" :exit t)
  ;;("z" zhihu-search "zhihu" :exit t)
  ;;("s" stackoverflow-search "sof" :exit t)
  ;;)
;;(global-set-key [f11] 'hydra-search/body)
(defhydra hydra-zuobyizhi
  (:foreign-keys warn
				 :hint nil) ;;hydra和evil有冲突，必须设置成warn
  "
^search^             ^词典^           ^Actions^ 
^^^^^^^^-------------------------------------------
_b_: bing          _u_: 本地搜索         _n_: shell   
_g_: github        _h_: 本地搜当前词     _i_: bufmenu 
_z_: zhihu        ^ ^                
_s_: sof          ^ ^               
"
  ("q" nil "quit")
  ("b" bing-search)
  ("g" github-search)
  ("h" local-dic-word-at-point :exit t) 
  ("i" buffer-menu) 
  ("n" eshell) 
  ("s" stackoverflow-search)
  ("u" local-dic :exit t) 
  ("z" zhihu-search)
  )
(global-set-key [f11] 'hydra-zuobyizhi/body)
(defhydra hydra-sitemap
  (:foreign-keys warn) ;;hydra和evil有冲突，必须设置成warn
  "站点地图"
  ("q" nil "quit")
  ("w" (browse-url "http://weibo.com") "微博")
  ("d" (browse-url "http://www.douban.com") "豆瓣")
  ("s" (browse-url "http://www.ishuhui.com/") "鼠绘")
  ("c" (browse-url "http://news.baidu.com/ns?cl=2&rn=20&tn=news&word=%E9%87%8D%E7%BB%84") "重组")
  ("l" (browse-url "http://tieba.baidu.com/f?kw=%E6%A4%8E%E5%90%8D%E6%9E%97%E6%AA%8E&fr=wwwt") "林吧")
  ("t" (browse-url "http://image.baidu.com/?fr=shitu") "百度识图")
  ("T" (browse-url "http://tool.oschina.net/") "在线工具")
  ("n" (browse-url "http://naotu.baidu.com/home") "百度脑图")
  ("f" (w3m-browse-url "http://fortune.com/") "财富杂志" :exit t)
  ("g" (browse-url "http://stockcharts.com/freecharts/pnf.php?c=%24SSEC,P") "上证点数图" :exit t)
  ("G" jiejingu-search "解禁股查询" :exit t)
  ("h" (browse-url "http://stockcharts.com/freecharts/pnf.php?c=$HSI,P") "恒指点数图" :exit t)
  ("y" (browse-url "http://stockcharts.com/freecharts/pnf.php?c=$WTIC,P") "美油点数图" :exit t)
  ("N" (browse-url "http://stockcharts.com/freecharts/pnf.php?c=$NDX,P") "纳指综合" :exit t)
  ("j" (browse-url "http://stockcharts.com/freecharts/pnf.php?c=$GOLD,P") "黄金点数图" :exit t)
  ("J" (browse-url "http://tieba.baidu.com/f?kw=%BD%F8%BB%F7%B5%C4%BE%DE%C8%CB&fr=ala0&tpl=5") "巨人吧" :exit t)
  ("u" (browse-url "http://news.baidu.com/ns?cl=2&rn=40&tn=news&word=%E5%AD%A3%E6%8A%A5") "季报新闻" :exit t)
  ("U" (browse-url "http://www.gurufocus.com/guru-stock-picks") "基金记录" :exit t)
  ("F" (browse-url "http://fortune.com/") "财富杂志")
  ("S" (browse-url "https://www.baidu.com/s?wd=%E6%92%92%E8%B4%9D%E5%AE%81%E6%97%B6%E9%97%B4") "撒贝宁时间")
  )
(global-set-key [C-f11] 'hydra-sitemap/body)
(global-set-key [f10] 'hydra-sitemap/body)

;;use keyfreq-show to see how many times you used a command.
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;;(require 'which-key)
;;(which-key-mode)
;;(setq which-key-use-C-h-commands nil)
;;(which-key-setup-side-window-right)
;;(setq which-key-side-window-max-height 0.3)

(defun bing-search-curword ()
  "bing search current word"
  (interactive )
  (browse-url (format "https://www.bing.com/search?q=%s"  (thing-at-point 'symbol))
    )
  )
;;(global-set-key [C-f1] 'bing-search-curword) 

(defun zh-to-en (key)
  "执行单条cmd命令"
  (interactive "schinese: ")
  (browse-url (format "http://fanyi.baidu.com/?aldtype=85#zh/en/%s" key))
  )

(defhydra hydra-search-current-word
  (:foreign-keys warn) ;;hydra和evil有冲突，必须设置成warn
  "搜索当前词语"
  ("q" nil "quit")
  ("w" (browse-url (format "https://www.baidu.com/s?wd=%s" (thing-at-point 'symbol))) "百度" :exit t)
  ;;("b" (browse-url (format "https://www.bing.com/search?q=%s" (thing-at-point 'symbol))) "bing" :exit t)
  ("b" bing-search-curword "bing" :exit t)
  ("y" (browse-url (format "http://www.iciba.com/%s" (thing-at-point 'word))) "英译中" :exit t)
  ("z" zh-to-en "中译英" :exit t)
  ("s" (swiper (thing-at-point 'symbol)) "swiper" :exit t)
  )
(global-set-key [C-f8] 'hydra-search-current-word/body)

(defhydra hydra-rectangle
  (:foreign-keys warn) ;;hydra和evil有冲突，必须设置成warn
  "rectangle"
  ("q" nil "quit")
  ("d" delete-rectangle "delete-rectangle" :exit t)
  ("o" open-rectangle "open-rectangle" :exit t)
  ("y" yank-rectangle "yank-rectangle" :exit t)
  ("t" string-rectangle "string-rectangle" :exit t)
  )

;;(require 'powerline)
;;(setq powerline-arrow-shape 'arrow)   ;; the default
;;(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
;;(setq powerline-arrow-shape 'arrow14) ;; best for small fonts
;;(custom-set-faces
 ;;'(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
 ;;'(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))

;; (add-to-list 'load-path "~/.emacs.d/elisp/powerline/")
;; (require 'powerline)
;; (require 'powerline-evil)
;; (powerline-evil-face)

;;(add-to-list 'load-path "~/.emacs.d/elisp/dash/")
;;(require 'dash)
;;(add-to-list 'load-path "~/.emacs.d/elisp/spaceline/")
;;(require 'spaceline-config)
;;(spaceline-spacemacs-theme)

(add-to-list 'load-path "~/.emacs.d/elisp/swiper/")
(require 'swiper)
(global-set-key [C-f5] 'swiper)
(require 'ivy-smex)
(require 'counsel)

(defun swiper-this-word ()
  ""
  (interactive )
  ;;(swiper (thing-at-point 'word))
  (swiper (thing-at-point 'symbol))
)

(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader ",")
;; (evil-leader/set-key "," 'other-window)
(evil-leader/set-key "," 'hydra-sitemap/body)
(evil-leader/set-key "." 'ivy-smex)
(evil-leader/set-key ";" 'comment-dwim)
(evil-leader/set-key ":" 'cmd-exe)
(evil-leader/set-key "b" 'buffer-menu)
(evil-leader/set-key "e" 'load-file)
(evil-leader/set-key "f" 'bing-search-curword)
;; (evil-leader/set-key "g" 'my-stock-list)
(evil-leader/set-key "g" 'hydra-avy/body)
;; (evil-leader/set-key "h" 'w3m)
(evil-leader/set-key "k" 'delete-other-windows)
(evil-leader/set-key "q" 'kill-buffer-and-window)
;; (evil-leader/set-key "r" 'repeat-complex-command) ;; 重复上一次minibuffer命令
(evil-leader/set-key "r" 'hydra-rectangle/body) ;; 重复上一次minibuffer命令
;;(evil-leader/set-key "s" 'swiper)
(evil-leader/set-key "s" 'swiper-this-word)
(evil-leader/set-key "t" 'shell)
;; (evil-leader/set-key "v" 'query-replace-regexp) ;; query-replace-regexp
(evil-leader/set-key "w" 'save-buffer)
(evil-leader/set-key "o" 'counsel-find-file)
(evil-leader-mode) ;;文档没有提到这句，但加上才有效。。

(require 'phi-grep)

;; (require 'browse-kill-ring)
(autoload 'browse-kill-ring "browse-kill-ring" "" t)
(evil-leader/set-key "p" 'browse-kill-ring)

;; (require 'linum-relative)
(autoload 'linum-relative-toggle "linum-relative" "" t)
(evil-leader/set-key "l" 'linum-relative-toggle)
(global-set-key [C-f4] 'linum-relative-toggle)

(require 'evil-quickscope)
(global-evil-quickscope-mode 1)

;;(require 'highlight-thing)
;;(global-highlight-thing-mode)
;;(setq highlight-thing-what-thing 'word)

;; (require 'smartscan)
;; (smartscan-mode 1)

;; (require 'highlight-symbol)
(autoload 'highlight-symbol "highlight-symbol" "" t)
(autoload 'highlight-symbol-next "highlight-symbol" "" t)
;; (evil-leader/set-key "h" 'highlight-symbol)
;; (evil-leader/set-key "n" 'highlight-symbol-next)
(evil-leader/set-key "h" 'hydra-highlight-symbol/body)
(defhydra hydra-highlight-symbol
  (:foreign-keys warn) ;;hydra和evil有冲突，必须设置成warn
  "highlight-symbol"
  ("q" nil "quit")
  ("h" highlight-symbol "highlight-symbol")
  ("n" highlight-symbol-next "highlight-symbol-next")
  ("p" highlight-symbol-prev "highlight-symbol-prev")
  )

(require 'projectile)

(require 'evil-surround)
(global-evil-surround-mode 1)

(defun python-this-buffer (key)
  ""
  (interactive "sargv:")
  (shell-command (concat "python " (buffer-file-name) " " key))
)
(global-set-key [C-f9] 'python-this-buffer)

(if (string-equal system-type "windows-nt")
	;;window下的配置
	(progn
	  (defun cmd-exe (key)
		"执行单条cmd命令"
		(interactive "scmd: ")
		(shell-command key)
		)

	  (defun open-this-buffer-with-explorer ()
		"only for win"
		(interactive )
		(shell-command "explorer %CD%")
		)
	  (evil-leader/set-key "/" 'open-this-buffer-with-explorer)

	  (defun open-win-calc ()
		"召唤计算器"
		(interactive )
		(shell-command "calc")
		)

	  (defun open-machine-time ()
		"开机时间查询，仅对window有效"
		(interactive )
		(shell-command "eventvwr /c:System /f:*[System[Provider[@Name='EventLog']]]")
		)
	  )
  )

;; 全屏
;; (require 'maxframe)
(autoload 'maximize-frame "maxframe" "" t)
(autoload 'restore-frame "maxframe" "" t)

;; 一键切buffer
(autoload 'swbuff-switch-to-next-buffer "swbuff" "" t)
(autoload 'swbuff-switch-to-previous-buffer "swbuff" "" t)
(global-set-key [f2] 'swbuff-switch-to-next-buffer)
(global-set-key [C-f2] 'swbuff-switch-to-previous-buffer)
;; (global-set-key [C-tab] 'swbuff-switch-to-next-buffer)
;; (global-set-key [C-S-tab] 'swbuff-switch-to-previous-buffer)

(setq kill-ring-max 100)

;; ;;自动换行
;; (add-hook 'org-mode-hook
;;     (lambda () (setq truncate-lines 1)))

(add-to-list 'load-path "~/.emacs.d/elisp/avy")
(autoload 'avy-goto-word-0 "avy" "" t)
(autoload 'avy-goto-line "avy" "" t)
(defhydra hydra-avy
  (:foreign-keys warn) ;;hydra和evil有冲突，必须设置成warn
  "avy"
  ("q" nil "quit")
  ("g" avy-goto-word-0 "avy-goto-word-0" :exit t)
  ("l" avy-goto-line "avy-goto-line" :exit t)
  )
(global-set-key (kbd "C-x g") 'hydra-avy/body)

;; TODO
(defun init-tbontb () 
  (progn 
	(defun to-be-or-not-to-be (lorr idx)
	  "操作还是不操作，是个问题。"
	  (interactive (list (read-string "s左侧还是右侧： ") (read-string "s大盘升跌： ")))
	  (message (concat lorr " " idx))
	  )
	)
  )
(init-tbontb)

(autoload 'tomatinho "tomatinho" "" t)

(defun init-local-dic () 
  "本地英汉汉英词典"
  (progn 
	(defun local-dic-basic (key)
	  (progn
		(switch-to-buffer-other-window "*localdic*")
		(if (string= (buffer-string) "")
			(progn 
			  (insert-file-contents "~/.emacs.d/zuobyizhi/localdic.txt")
			  (toggle-read-only 1)
			  )
		  )
		(isearch-occur key)
		;; (isearch-complete key)
		)
	  (other-window 1)
	  (delete-other-windows)
	  )

	(defun local-dic (key)
	  (interactive "skey: ")
	  (local-dic-basic key)
	  )

	(defun local-dic-word-at-point ()
	  (interactive)
	  (local-dic-basic (thing-at-point 'word))
	  )
	)
  )
(init-local-dic)

(global-set-key [f7] 'quickurl-list)
(global-set-key [C-f7] 'quickurl-browse-url)
(custom-set-variables '(quickurl-url-file "~/.emacs.d/zuobyizhi/.quickurl"))

(add-hook 'find-file-hooks 'auto-insert)
(setq auto-insert 'not-modified)
(setq auto-insert-query nil)
(setq auto-insert-directory "~/.emacs.d/zuobyizhi/autoinsert/")
(setq auto-insert-alist '(("\\.html$" . "autoinsert.html")
						  ("\\.htm$" . "autoinsert.html")
						  ("\\.css$" . "autoinsert.css")
						  ))

;; * #
(require 'evil-visualstar)
(global-evil-visualstar-mode)

;; %
(add-to-list 'load-path "~/.emacs.d/elisp/evil-matchit")
(require 'evil-matchit)
(global-evil-matchit-mode 1)

(add-to-list 'load-path "~/.emacs.d/elisp/expand-region")
(require 'expand-region)
(evil-leader/set-key "v" 'er/mark-symbol)
(evil-leader/set-key "\"" 'er/mark-inside-quotes)

(defun emacs-live ()
  "live"
  (interactive)
  (progn
	(switch-to-buffer-other-window "*live*")
	(erase-buffer)
	(progn 
	  (setq month (string-to-number (format-time-string "%m")))
	  (setq day (string-to-number (format-time-string "%d")))
	  (setq hour (string-to-number (format-time-string "%H")))
	  (setq minute (string-to-number (format-time-string "%M")))
	  (setq week (calendar-day-of-week (calendar-current-date)))
	  (setq bweekday (and (> week 0) (< week 6)))
	  (setq bweekend (or (= week 0) (= week 6)))
	  (insert "\n\n\n")
	  (insert (format-time-string "%Y-%m-%d %H:%M"))
	  (insert (if bweekday " weekday" " weekend"))
	  (insert "\n\n\n")
	  (insert (cond
			   ((and bweekday (and (<= hour 18) (>= hour 15))) "认真工作，火力全开。")
			   ((and bweekday (and (<= hour 21) (>= hour 19))) "学习时间。")
			   ((and bweekend (= hour 2)) "快睡觉。")
			   (t "Geek!")
			   ))
	  (insert "\n")
	  (insert (cond
			   ((and bweekday (= hour 9) (and (<= minute 45) (>= minute 30))) "开盘前十五分钟先观察。")
			   ((and (= hour 14) (>= minute 50) bweekday) "保险交易时间。留意大盘、恒指是否超越均线。")
			   (t "")
			   ))
	  (insert "\n\n\n")
	  )
	)
  (other-window 1)
  )
(evil-leader/set-key "a" 'emacs-live)

;; python设置
(add-hook 'python-mode-hook
		  '(lambda()
			 (setq python-indent 4)
			 (setq tab-width 4)
			 (define-coding-system-alias 'GBK 'chinese-gbk)
			 ))

;; (require 'general)
;; ;; bind a key globally in normal state; keymaps must be quoted
;; ;; (setq general-default-keymaps 'evil-normal-state-map)
;; (general-define-key :prefix "g"
;; 					:states '(normal visual emacs)
;; 					"d" 'delete-rectangle
;; 					"k" 'keyfreq-show
;; 					"o" 'open-rectangle)

(blink-cursor-mode -1) 

(defun open-init-file ()
  ""
  (interactive )
  (find-file "~/.emacs.d/init.el")
)

(require 'evil-easymotion)
(evilem-default-keybindings "SPC")

(setq diary-file "~/.emacs.d/zuobyizhi/.diary")
