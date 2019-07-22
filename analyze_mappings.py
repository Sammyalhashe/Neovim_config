import os
import re
import vim
# from pprint import pprint

FILE = "./plugin_conf.vim"
HOME = os.path.expanduser("~")

mapping_commands = {
    "noremap": {},
    "nnoremap": {},
    "xnoremap": {},
    "inoremap": {}
}

angled = re.compile(r'<([a-z]+|[A-Z]+)>')

vim_commands = {":call", ":norm"}


def check_file(fp, inside_call=False):
    with open(fp, "r") as f:
        line_num = 1
        for line in f.readlines():
            # search for \n
            if re.search("(\\r|)\\n$", line):
                line = re.sub("(\\r|)\\n$", "", line)

            if line.split(' ')[0].strip() == 'source':
                check_file(
                    line.split(' ')[1].strip().replace("~", HOME),
                    inside_call=True)

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
            ret_string = ""
            print("-----------------------")
            for mapping in mapping_commands:
                for mapped in mapping_commands[mapping]:
                    if len(mapping_commands[mapping][mapped]['lines']) > 1:
                        ret_string += "It seems {} has an assignment conflict\n".format(
                            mapped)
                        print("It seems {} has an assignment conflict".format(
                            mapped))
                        print("-----------------------")
                        ret_string += "-----------------------\n"
                        print("    On lines: {}".format(", ".join(
                            list(
                                map(lambda x: str(x), mapping_commands[mapping]
                                    [mapped]['lines'])))))
                        ret_string += "    On lines: {}\n".format(", ".join(
                            list(
                                map(lambda x: str(x), mapping_commands[mapping]
                                    [mapped]['lines']))))
                        print("    With mappings: {}".format(", ".join(
                            mapping_commands[mapping][mapped]['mapped_to'])))
                        ret_string += "    With mappings: {}\n".format(
                            ", ".join(mapping_commands[mapping][mapped][
                                'mapped_to']))
                        print("-----------------------")
                        ret_string += "-----------------------"
            return ret_string


def main():
    val = check_file(FILE)
    vim.command("let ret_string = {}".format(val))


main()
