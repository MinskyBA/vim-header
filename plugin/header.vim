" Vim File
" AUTHOR:   Agapo (fpmarias@google.com)
" CREATED:  21:06:35 05/10/2004
" TITLE:    header.vim
" SUMMARY:  When a new file is created of specific types, a header is added on the top.
" INSTALL:  Easy! Copy the file to vim's plugin directory (global or personal)
"           and run vim.

function s:filetype ()

  let s:file = expand("<afile>:t")
  let l:ft = &ft

  if l:ft ==# 'sh'
      let s:comment = "#"
      let s:type = s:comment . "!/bin/bash"
  elseif l:ft ==# 'python'
      let s:comment = "#"
      let s:type = s:comment . "-*- coding:utf-8 -*-"
  elseif l:ft ==# 'perl'
      let s:comment = "#"
      let s:type = s:comment . "!/usr/bin/env perl"
  elseif l:ft ==# 'vim'
      let s:comment = "\""
      let s:type = s:comment . " Vim File"
  elseif l:ft ==# 'c' || l:ft ==# 'cpp'
      let s:comment = "\/\/"
      let s:type = s:comment . " C/C++ File"
  elseif l:ft==# 'rst'
      let s:comment = ".."
      let s:type = s:comment . " reStructuredText "
  elseif l:ft==# 'php'
      let s:comment = "\/\/"
      let s:type = s:comment . " Php File "
  elseif l:ft ==# 'javascript'
      let s:comment = "\/\/"
      let s:type = s:comment . " Javascript File"
  else
      let s:type = "NONE"
  endif

  unlet s:file

endfunction

function s:insert ()

  call s:filetype ()

  if s:type ==# 'NONE'
	  unlet s:type
	  return
  endif

  let s:div = s:comment .		"==============================================================================="
  let s:space = s:comment .		""
  let s:file = s:comment .		"         FILE: " . expand("<afile>")
  let s:usage = s:comment .		"        USAGE: "
  let s:desc = s:comment .		"  DESCRIPTION: "
  let s:req = s:comment .		" REQUIREMENTS: "
  let s:bugs = s:comment .		"         BUGS: "
  let s:notes = s:comment .		"        NOTES: "
  let s:author = s:comment .	"       AUTHOR: " . system ("id -un | tr -d '\n'") . " ()"
  let s:created = s:comment .	"      CREATED: " . strftime ("%Y-%m-%d %H:%M:%S")

  call append (0, s:type)
  call append (1, s:div)
  call append (2, s:space)
  call append (3, s:file)
  call append (4, s:space)
  call append (5, s:usage)
  call append (6, s:space)
  call append (7, s:desc)
  call append (8, s:space)
  call append (9, s:req)
  call append (10, s:bugs)
  call append (11, s:notes)
  call append (12, s:author)
  call append (13, s:created)
  call append (14, s:div)
  call append (15, "")

  unlet s:comment
  unlet s:type
  unlet s:div
  unlet s:space
  unlet s:usage
  unlet s:desc
  unlet s:req
  unlet s:bugs
  unlet s:notes
  unlet s:author
  unlet s:created

endfunction


autocmd BufNewFile * call s:insert ()
