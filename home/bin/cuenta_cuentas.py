#!/usr/bin/env python3
"""
Este script sirve para leer la hoja Excel de transacciones
del BBVA e imprimir los gastos relativos a un mes especifico.
El formato en que se imprimen son especificos para la columna
de gastos de Miren en la hoja comun en Google Drive de Alex y Miren.

Para utilizar este script tienes que tener instalado pandas
y un modulo para leer archivos Excel.

Para instalar estas dependencias ejecuta:

    pip install pandas xlrd

Lo que imprime este script puede ser directamente
copiado a la hoja en Google Drive.
Una vez pegado el contenido alli tienes que elegir que
el cell split sea semicolon.
"""

import sys
import argparse

import pandas as pd


rename_cols = {'bbva': {'date': 'Fecha',
                        'description': 'Observaciones',
                        'amount': 'Importe',
                        },
               'comm': {'date': 'Value date',
                        'description': 'Booking text',
                        'amount': 'Amount',
                       },
                'ing': {'date': 'FECHA VALOR',
                        'description': 'DESCRIPCIÓN',
                        'amount': 'IMPORTE (€)',
                       },
              }


user_colidx = {'miren': 2,
               'alex': 1,
              }


def _clean_unnamed_cols(df):
    unnamed_cols = [col for col in df.columns if 'Unnamed' in col]
    return df.drop(unnamed_cols, axis=1)


def _rename_cols(df, bank):
    cols = {v:k for k,v in rename_cols[bank].items()}
    df.rename(columns=cols, inplace=True)


def _clean_bbva_obs(obs):
    obs = obs.replace(',', ' ').replace(';', ' ')
    res = ''
    for o in obs.split(' '):
        if o.isdigit() or len(o) < 2:
            continue
        res += o
    return res.title()


def _clean_ing_obs(obs):
    obs = obs.split('(')[0]
    return obs.strip()


def read_bbva_excel(file_name):
    df = pd.read_excel(file_name, skiprows=4)
    # remove unknown columns
    df = _clean_unnamed_cols(df)
    # rename cols
    _rename_cols(df, 'bbva')

    df['description'] = df['description'].apply(_clean_bbva_obs)

    return df


def read_comm_csv(file_name):
    df = pd.read_csv(file_name,
                     index_col=False,
                     sep=',',
                     infer_datetime_format=True)
    # remove unknown columns
    # df = _clean_unnamed_cols(df)
    # rename cols
    _rename_cols(df, 'comm')

    df['date'] = df['date'].apply(lambda x: pd.Timestamp(x))

    return df


def read_ing_excel(file_name):
        df = pd.read_excel(file_name, skiprows=3)

        # rename cols
        _rename_cols(df, 'ing')
        #datetime.fromtimestamp(int("1284101485")).strftime('%d/%m/%Y'))
        # make the date colume a timestamp
        parse_date = lambda x: pd.to_datetime(x, format='%d/%m/%Y')

        df['date'] = df['date'].apply(parse_date)

        df['description'] = df['description'].apply(_clean_ing_obs)

        return df


def gdrive_row(row, user_idx=2):
    return '{};;{}{}{}'.format(row['date'].strftime('%d.%m.%Y'),
                               row['description'],
                               ';' * user_idx,
                               row['amount'],
                               )


def month_expenses(df, month):
    df['month'] = df['date'].map(lambda x: x.month)
    return df[df['month'] == month]


def set_parser():
    parser = argparse.ArgumentParser(description='Read a spreadsheet with expenses from a specific '
                                                 'bank and print the content for our GDrive spreadsheet.')
    parser.add_argument('-i', '--in', dest='file_name', action='store',
                        help='The path to the spreadsheet.')
    parser.add_argument('-b', '--bank', dest='bank', action='store',
                        choices=['bbva', 'comm', 'ing'], default='bbva',
                        help='The bank from where the table data comes.')
    parser.add_argument('-u', '--user', dest='user', action='store',
                        choices=['miren', 'alex'], default='miren',
                        help='The user owner of the expenses.')
    parser.add_argument('-m', '--month', dest='month', action='store',
                        help='The number of the month of the transactions '
                             'that you want to print.')
    return parser


def main(argv=None):
    parser  = set_parser()

    try:
        args = parser.parse_args()
    except argparse.ArgumentError as exc:
        print(exc.message + '\n' + exc.argument)
        parser.error(str(msg))
        return 0

    file_name = args.file_name
    month     = int(args.month)
    bank      = args.bank
    user      = args.user

    colidx = user_colidx[user]

    bank_readers = {'bbva': read_bbva_excel,
                    'comm': read_comm_csv,
                    'ing':  read_ing_excel}

    reader = bank_readers.get(bank, read_comm_csv)

    df = reader(file_name)

    mdf = month_expenses(df, month)
    mdf = mdf.sort_values('date', axis=0)

    lines = mdf.apply(axis=1, func=lambda x: gdrive_row(x, user_idx=colidx))
    for line in lines:
        print(line)

    print('\n\n')
    print('Add {} lines in the spreadsheet.'.format(len(lines)))


if __name__ == "__main__":
    sys.exit(main())
