import re
import json

def parse_sql_copy(sql_file):
    with open(sql_file, 'r', encoding='utf-8') as f:
        content = f.read()

    tables = {
        'users': [],
        'announcements': [],
        'student_lists': [],
        'calendarAppointments': []
    }

    # Regex for COPY public.tablename (cols) FROM stdin;
    copy_pattern = re.compile(r"COPY public\.(?P<table>\w+|\"\w+\") \((?P<cols>.*?)\) FROM stdin;\n(?P<data>.*?)\\\.", re.DOTALL)

    for match in copy_pattern.finditer(content):
        table_name = match.group('table').replace('"', '')
        cols = [c.strip() for c in match.group('cols').split(',')]
        data_rows = match.group('data').strip().split('\n')

        target_table = None
        if table_name == 'users':
            target_table = 'users'
        elif table_name == 'announcement':
            target_table = 'announcements'
        elif table_name == 'student_list':
            target_table = 'student_lists'
        elif table_name == 'calendarAppointment':
            target_table = 'calendarAppointments'

        if target_table:
            for row in data_rows:
                vals = row.split('\t')
                record = {}
                for i, col in enumerate(cols):
                    val = vals[i]
                    if val == '\\N':
                        val = None
                    record[col] = val
                tables[target_table].append(record)

    return tables

def main():
    data = parse_sql_copy('supabase/backup.sql')
    for table, records in data.items():
        with open(f'supabase/{table}.json', 'w', encoding='utf-8') as f:
            json.dump(records, f, indent=2)
        print(f"Exported {len(records)} records for {table}")

if __name__ == '__main__':
    main()
