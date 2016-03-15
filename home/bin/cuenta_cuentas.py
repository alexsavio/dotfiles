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



def read_excel(file_name):
    df = pd.read_excel(file_name, skiprows=4)

    # remove unknown columns
    unnamed_cols = [col for col in df.columns if 'Unnamed' in col]
    df = df.drop(unnamed_cols, axis=1)

    return df


def clean_obs(obs):
    obs = obs.replace(',', ' ').replace(';', ' ')
    res = ''
    for o in obs.split(' '):
        if o.isdigit() or len(o) < 2:
            continue
        res += o
    return res.title()


def gdrive_row(row):
    return '{};;{};;{}'.format(row['Fecha'].strftime('%d.%m.%Y'),
                               clean_obs(row['Observaciones']),
                               row['Importe'],
                               )


def month_expenses(df, month):
    df['Mes'] = df['Fecha'].map(lambda x: x.month)
    return df[df['Mes'] == month]


def set_parser():
    parser = argparse.ArgumentParser(description='Read a BBVA spreadsheet and print the '
                                                 ' content for our GDrive spreadsheet.')
    parser.add_argument('-i', '--in', dest='file_name', action='store',
                       help='The path to the spreadsheet.')
    parser.add_argument('-m', '--month', dest='month', action='store',
                       help='The number of the month of the transactions that you want to print.')
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

    df  = read_excel(file_name)
    mdf = month_expenses(df, month)

    lines = mdf.apply(axis=1, func=lambda x: gdrive_row(x))
    for line in lines:
        print(line)


if __name__ == "__main__":
    sys.exit(main())
