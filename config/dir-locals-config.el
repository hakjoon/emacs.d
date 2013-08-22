((python-mode
  (python-shell-interpreter . "python")
  (python-shell-interpreter-args . "/Users/hakjoon/code/python/webtest/manage.py shell")
  (python-shell-prompt-regexp . "In \\[[0-9]+\\]: ")
  (python-shell-prompt-output-regexp . "Out\\[[0-9]+\\]: ")
  (python-shell-completion-setup-code . "from IPython.core.completerlib import module_completion")
  (python-shell-completion-module-string-code . "';'.join(module_completion('''%s'''))\n")
  (python-shell-completion-string-code . "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  (python-shell-virtualenv-path . "/Users/hakjoon/.virtualenvs/webtest")))
