import argparse
# from emvee_nl on discord
def generate_hta(js_file, out_file):
    with open(js_file, 'r') as f:
        js_data = f.read()

    template = '''
<html>
<head>
<script language="JScript">
{}
</script>
</head>
<body>
<script language="JScript">
self.close();
</script>
</body>
</html>
'''

    with open(out_file, 'w') as f:
        f.write(template.format(js_data))

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--in', dest='js_file', required=True, help='Input JS file')
    parser.add_argument('--out', dest='out_file', required=True, help='Output HTA file')
    args = parser.parse_args()

    generate_hta(args.js_file, args.out_file)