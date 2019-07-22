function! CheckClashes() abort
    "pyfile ~/.config/nvim/analyze_mappings.py
    
python3 << EOF
import os
import re
import vim
# from pprint import pprint

FILE = "~/.config/nvim/plugin_conf.vim"
HOME = os.path.expanduser("~")

FILE = FILE.replace('~', HOME)

mapping_commands = {
    "noremap": {},
    "nnoremap": {},
    "xnoremap": {},
    "inoremap": {}
}

angled = re.compile(r'<([a-z]+|[A-Z]+)>')

vim_commands = {":call", ":norm"}


def check_file(fp, inside_call=False, verbose=False):
    with open(fp, "r") as f:
        line_num = 1
        for line in f.readlines():
            # search for \n
            if re.search("(\\r|)\\n$", line):
                line = re.sub("(\\r|)\\n$", "", line)

            if line.split(' ')[0].strip() == 'source':
                fixed_file = line.split(' ')[1].strip().replace("~", HOME)
                check_file(fixed_file,inside_call=True)
            for mapping in mapping_commands:
                if re.search(r'(^{0})|( {1})'.format(mapping, mapping),
                             line) and line[0] != '"':
                    first_split = re.split(
                        r'(^{0})|( {1})'.format(mapping, mapping), line)
                    first_split = list(
                        filter(lambda x: x is not None and x != '',
                               first_split))
                    for el in first_split:
                        el.strip()
                    line_spl = re.split(r'[  ]+', first_split[-1])

                    mapped = line_spl[1]

                    j = 2
                    mapped_to = line_spl[j]

                    while angled.match(mapped_to):
                        mapped += mapped_to
                        j += 1
                        mapped_to = line_spl[j]

                    # if mapped_to in vim_commands:
                    # mapped_to += " " + " ".join(line_spl[j:])
                    mapped_to = " ".join(line_spl[j:])

                    if mapped not in mapping_commands[mapping]:
                        mapping_commands[mapping][mapped] = {
                            'lines': [line_num],
                            'mapped_to': [mapped_to]
                        }
                    else:
                        mapping_commands[mapping][mapped]['lines'].append(
                            line_num)
                        mapping_commands[mapping][mapped]['mapped_to'].append(
                            mapped_to)
            line_num += 1
        # pprint(mapping_commands)

        # gather all mappings
        if not inside_call:
            lines = []
            for mapping in mapping_commands:
                for mapped in mapping_commands[mapping]:
                    if len(mapping_commands[mapping][mapped]['lines']) > 1:
                        lines.append(mapping_commands[mapping][mapped]['lines'])
                        if verbose:
                            print("-----------------------")
                            print("It seems {} has an assignment conflict".format(mapped))
                            print("-----------------------")
                            print("    On lines: {}".format(" ".join(list(map(lambda x: str(x), mapping_commands[mapping][mapped]['lines'])))))
                            print("    With mappings: {}".format(" ".join(list(map(lambda x: x.replace("'", '"'), mapping_commands[mapping][mapped]['mapped_to'])))))
                            print("-----------------------")

            return lines


def main():
	return check_file(FILE)

ret_string = main()
vim.command("let clashes = {}".format(ret_string))

EOF
return clashes

endfunction

let s:clashes = CheckClashes()

function Caller() abort
    if !empty(s:clashes)
        echomsg "Clashes: " . string(s:clashes)
    endif
endfunction

autocmd VimEnter * call Caller()
