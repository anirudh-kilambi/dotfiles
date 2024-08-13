"let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6, 'relative': v:true } }

function IsGitRepository()
    let l:path = expand('%:p:h') " Get the full path of the current file's directory
    let l:git_dir = finddir('.git', l:path . ';') " Look for .git directory in parent directories

    return !empty(l:git_dir)
endfunction

"function FzfPath()
    "let l:pwd = getcwd()
    ""first, find all available repositories
    "let l:repos = glob('/Users/Anirudh.Kilambi/code/repos/*', 1, 1)

    "" base case of not in repos section
    ""let l:base_path = '/Users/Anirudh.Kilambi/code/repos/'

    ""if match(pwd, base_path) != -1
        ""echo 'In the base path'
        ""execute 'FZF ' . repo
        
    ""else
    "for repo in repos
        "if match(pwd, repo) != -1
            "call fzf#run({'source': 'fd . "' . repo '"','sink': 'cd','options': ['--multi', '--layout=reverse-list', '--info=inline', '--pointer=→']})
            "break
        "else
            "continue
        "endif
    "endfor
    ""execute 'FZF ' . pwd
    "call fzf#run({'source': 'fd . "/Users/Anirudh.Kilambi/"','sink': 'cd','options': ['--multi', '--layout=reverse-list', '--info=inline', '--pointer=→']})
    ""endif
"endfunction

function Fzfpath()
    if IsGitRepository()
        "call fzf#run({'source': 'git ls-files','sink': 'e','options': ['--multi', '--layout=reverse-list', '--info=inline', '--pointer=→']})
        execute 'GitFiles'
    else
        execute 'FZF'
    endif
endfunction
        "call fzf#run({'source': 'fd .','sink': 'e','options': ['--multi', '--layout=reverse-list', '--info=inline', '--pointer=→']})
        "
