;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     rust
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     csv
     octave
     (javascript
      :variables javascript-repl `skewer
      )
     markdown
     yaml
     html
     helm
     ess
     python
     emacs-lisp
     auto-completion
     spell-checking
     treemacs
     ranger
     lsp
     git
     org
     (org :variables
          org-enable-reveal-js-support t
          )
     latex
     bibtex
     pandoc
     pdf
    (shell :variables
            shell-default-shell 'multi-term)
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(interleave
                                      org-super-agenda
                                      yasnippet-snippets
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    smartparens
                                    orgit
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18 
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
'dotspacemacs/user-config' first."
  (setenv "WORKON_HOME" "/home/plawson/miniconda3/envs")
  )

(defun dotspacemacs/user-config ()
(custom-set-variables
 ;; Your other configuration here
 ;; ...
 '(TeX-view-program-list (quote (("Zathura" "zathura %o")))) ; [1]
 '(TeX-view-program-selection
  (quote
   (((output-dvi style-pstricks) "dvips and gv")
   (output-dvi "xdvi")
   (output-pdf "Zathura")                                    ; [2]
   (output-html "xdg-open")))))
  (setq bibtex-completion-notes-path "~/Documents/research/org/articles.org")
(setq bibtex-completion-notes-template-one-file
      (format
       "\n* ${year} - ${title}\n :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :AUTHOR: ${author}\n  :JOURNAL: ${journal}\n  :YEAR: ${year}\n  :VOLUME: ${volume}\n  :PAGES: ${pages}\n  :Keywords: ${keywords}\n  :Projects: ${groups}\n  :INTERLEAVE_PDF: /Users/geekypete/Documents/research/org/research/pdfs/${=key=}.pdf\n :END:\n [[/Users/geekypete/Documents/research/org/research/pdfs/${=key=}.pdf][${=key=}]]\n"))
  (setq helm-bibtex-bibliography "~/Documents/research/org/research/articles.bib"
        helm-bibtex-library-path "~/Documents/research/org/research/pdfs"
        helm-bibtex-notes-path "~/Documents/research/org/research/articles.org")
  (setq ess-use-auto-complete t)
  ;; Set zsh as default shell 
  (setq multi-term-program "/bin/zsh")
	(with-eval-after-load 'org
    ;; Set python3 as default in org-mode
    (setq org-babel-python-command "python3")
    ;; Org-super-agenda configuration
    (use-package org-super-agenda
      :config (org-super-agenda-mode))
    (setq org-super-agenda-groups
          '(
            (:name "Complete Today"
                   :tag "today")
            (:name "To Read"
                   :tag "toread")
            (:name "Priority"
                   :priority "A")
            (:auto-parent t)
            ))

    ;; Custom agenda view (only used when org-super-agenda-mode is not enabled
    (setq org-agenda-custom-commands
          '(("c" "Simple agenda view"
             ((tags "PRIORITY=\"A\""
                    ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                     (org-agenda-overriding-header "High-prority unfinished tasks:")))
              (agenda "")
              (tags "paper"
                     ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
                      (org-agenda-overriding-header "Ongoing publication")
                      (org-agenda-hide-tags-regexp "paper")))
              (alltodo "")))))
    ;; Custom capture templates
    (setq org-capture-templates
          '(("t" "Todo" entry (file "~/Documents/research/org/todo.org")
             "* TODO %?\n  %U\n  %i\n  %a")
            ("T" "Todo with Clipboard" entry (file "~/Documents/research/org/todo.org")
             "* TODO %?\n  %U\n  %x  %a")
            ("a"               ; key
             "Article"         ; name
             entry             ; type
             (file+headline "~/Documents/research/org/notes.org" "Article")  ; target
             "* %^{Title} %(org-set-tags) :article: \n:PROPERTIES:\n:Created: %U\n:Linked: %a\n:END:\n%i\nBrief description:\n%?"  ; template
             :prepend t        ; properties
             :empty-lines 1    ; properties
             :created t        ; properties
             )  
            ("m" "Meeting" entry (file "~/Documents/research/org/meetings.org")
             "* MEETING: with %?\n" :clock-in t :clock-resume t :empty-lines 1)
            ("n" "Note" entry (file "~/Documents/research/org/research.org")
             "* NOTE %?\n%U" :empty-lines 1)
            ("N" "Note with Clipboard" entry (file "~/Documents/research/org/research.org")
             "* NOTE %?\n%U\n   %x" :empty-lines 1)
             ))  
    ;; Set org-todo keywords
    (setq org-todo-keywords
          '((sequence "TODO" "IN-PROGRESS(p)" "WAITING(w)" "|" "DONE(d)" "CANCELED(c)")))
    ;; Set Codeblocks to execute without prompt
    (setq org-confirm-babel-evaluate nil)
    (setq org-ref-note-title-format "* [[/Users/geekypete/Documents/research/org/research/pdfs/%k.pdf][%k]] - %t\n :PROPERTIES:\n :Custom_ID: %k\n :INTERLEAVE_PDF: /Users/geekypete/Documents/research/org/research/pdfs/%k.pdf\n :END:\n")
    ;; Set default bibliography location for org-ref
    (setq org-ref-default-bibliography "~/Documents/research/org/research/articles.bib"
          org-ref-bibliography-notes "~/Documents/research/org/research/articles.org"
          org-ref-pdf-directory "~/Documents/research/org/research/pdfs/"
          org-ref-notes-directory "~/Documents/research/org/research/notes/")
    ;; Ensure that org-ref-open-bibtex-notes is used instead of doi-utils-make-notes
    (setq doi-utils-make-notes-function 'org-ref-open-bibtex-notes)
    ;; Ensure LaTeX compiles documents with bibtex
    (require 'ox-bibtex)
	  (setq org-latex-pdf-process
         '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
           "bibtex %b"
            "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
    ;; Export org-mode as LaTeX article
    ;; see http://orgmode.org/worg/org-tutorials/org-latex-export.html
    (unless (boundp 'org-latex-classes)
      (setq org-latex-classes nil))
    (add-to-list 'org-latex-classes
                 '("article"
                   "\\documentclass{article}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
    ;; Allow images to manually be resized in org-mode buffer
    (setq org-image-actual-width 100)
    ;; Set headline level of org export
    (setq org-export-headline-levels 4)
    ;; Use mintify when exporting codeblocks to LaTeX
    (add-to-list 'org-latex-packages-alist '("" "minted"))
    (setq org-latex-listings 'minted)
    ;; Allow execution of code blocks in languages below
    ;; Refer to https://github.com/syl20bnr/spacemacs/issues/3314 for config
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((python . t)
       (shell . t)
       (octave . t)
       (R . t)))
    ;;fontify code in code blocks
    (setq org-src-fontify-natively t)
	  (setq org-agenda-files (quote ("~/Documents/research/org/")))
	  (setq org-enforce-todo-dependencies t)
	  ;;  forces you to mark all child tasks as “DONE” before you can mark the parent as “DONE.”
	  ;; (setq org-log-done (quote time)) 	
	  ;; Setting this option causes Org to insert an annotation in a task when it is 
	  ;; marked as done including a timestamp of when exactly that happened.
	  (setq org-log-redeadline (quote time))
	  ;; causes Org to insert annotations when you change the deadline of a task, which 
	  ;; will note the previous deadline date and when it was changed. Very useful for 
	  ;; figuring out how many times you “kicked the can down the road.”
	  (setq org-log-reschedule (quote time))
	  ;; This does the same as above, but for the scheduled dates,
	  (setq org-log-done 'note)
	  ;; Add a closing note upon closing TODO item ... there is a bug here, need to resolve
	  (setq org-refile-targets '((nil :maxlevel . 9)
				       (org-agenda-files :maxlevel . 9)))
	  (setq org-ref-default-bibliography '("~/Documents/research/org/references.bib"))
    ;; Increase org-mode inline latex fragment display size
    (plist-put org-format-latex-options :scale 1.5)
  ))


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("Zathura" "zathura %o"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open"))))
 '(org-agenda-files nil)
 '(org-trello-current-prefix-keybinding "C-c o")
 '(package-selected-packages
   (quote
    (org-super-agenda ts toml-mode racer pos-tip cargo rust-mode pandoc-mode ox-pandoc ht fuzzy org-trello csv-mode pdf-tools flyspell-correct-helm flyspell-correct auto-dictionary xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ein websocket interleave helm-company helm-c-yasnippet company-web web-completion-data company-tern dash-functional tern company-statistics company-auctex company-anaconda company auto-yasnippet ac-ispell auto-complete auctex-latexmk auctex web-beautify livid-mode skewer-mode simple-httpd js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode dockerfile-mode docker json-mode tablist docker-tramp json-snatcher json-reformat ox-reveal org-gcal request-deferred deferred calfw google-maps mmm-mode markdown-toc markdown-mode gh-md yaml-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor org-ref key-chord ivy helm-bibtex parsebib biblio biblio-core web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic org-projectile org-present org org-pomodoro alert log4e gntp org-download htmlize gnuplot ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(safe-local-variable-values
   (quote
    ((org-download-image-dir . "./resources/lab_notebook")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-list (quote (("Zathura" "zathura %o"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Zathura")
     (output-html "xdg-open"))))
 '(org-agenda-files nil)
 '(org-trello-current-prefix-keybinding "C-c o")
 '(package-selected-packages
   (quote
    (doom-modeline org-super-agenda ts toml-mode racer pos-tip cargo rust-mode pandoc-mode ox-pandoc ht fuzzy org-trello csv-mode pdf-tools flyspell-correct-helm flyspell-correct auto-dictionary xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help ein websocket interleave helm-company helm-c-yasnippet company-web web-completion-data company-tern dash-functional tern company-statistics company-auctex company-anaconda company auto-yasnippet ac-ispell auto-complete auctex-latexmk auctex web-beautify livid-mode skewer-mode simple-httpd js2-refactor yasnippet multiple-cursors js2-mode js-doc coffee-mode dockerfile-mode docker json-mode tablist docker-tramp json-snatcher json-reformat ox-reveal org-gcal request-deferred deferred calfw google-maps mmm-mode markdown-toc markdown-mode gh-md yaml-mode smeargle orgit magit-gitflow helm-gitignore gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link evil-magit magit magit-popup git-commit with-editor org-ref key-chord ivy helm-bibtex parsebib biblio biblio-core web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode anaconda-mode pythonic org-projectile org-present org org-pomodoro alert log4e gntp org-download htmlize gnuplot ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(safe-local-variable-values
   (quote
    ((org-download-image-dir . "./resources/lab_notebook")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
