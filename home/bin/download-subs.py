#!/usr/bin/env python3

#pip install subliminal babelfish

from __future__ import unicode_literals  # for python 2 only

import os
import sys
import os.path as op
import logging as log
import argparse
import subliminal

from   babelfish import Language
from   datetime  import timedelta


# Helpers
def search_video_files(rootdir, max_age=7, embedded_subs=False):
    '''Return a list of video files in rootdir which does not have any subtitle.

    Parameters
    ----------
    rootdir: str
        Root folder path from where to start the search.

    # this has been deprecated
    age: datetime.timedelta
        Maximum age of the video files in days to be included in the result.

    embedded_subs: bool
        If True will also take into account the subtitles embedded in the video file.

    Returns
    -------
    list of subliminal.video
    '''
    dirpath = op.abspath(op.expanduser(rootdir))

    # data path
    if not op.exists(dirpath):
        raise IOError('Folder {} not found.'.format(dirpath))

    # configure the cache
    # subliminal.cache_region.configure('dogpile.cache.dbm', arguments={'filename': data_dir.joinpath('cachefile.dbm')})

    # scan for videos in the folder and their subtitles
    videos = subliminal.scan_videos(dirpath, subtitles=True, embedded_subtitles=embedded_subs)
                                    #age=timedelta(days=max_age))

    return videos


def download_subs(videos, languages):
    """
    Will scan for videos newer than one week and try to download
    subtitles in English and Spanish for them.

    Parameters
    ----------
    videos: list of

    languages: list of babelfish.language

    """
    nu_vids = []
    for vid in videos:
        if len(vid.subtitle_languages) == 0:
            nu_vids.append(vid)

    # download
    try:
        subs = subliminal.download_best_subtitles(nu_vids, languages)
    except:
        raise

    log.info('Subs found:')
    log.info(subs)

    # save
    log.debug('Saving subtitle files.')
    subliminal.save_subtitles(subs, single=False)


def setup_log(filename='', verbose=False):
    """ Set up the logging system.

    Parameters
    ----------
    filename: str
        Path to a logging file. If empty, will print the log to sys.stderr.

    verbose: bool
        If True will turn on verbose mode.
    """
    log_level = log.ERROR
    if verbose == 2:
        log_level = log.DEBUG
    elif verbose == 1:
        log_level = log.INFO
    log_args = {'level': log_level}

    if filename:
        log_args['filename'] = filename

    log.basicConfig(**log_args)


def setup_argparser():
    """ Define and return the command argument parser. """
    parser = argparse.ArgumentParser(description='Video subtitle downloader.')
    parser.add_argument('-i', '--dir', dest='dirpaths', required=True,
                        default=[], action='append',
                        help='''Root folder path from where to start the search.
                             You can set more than one.
                             ''')
    parser.add_argument('-l', '--lang', dest='langs', required=False,
                        action='append', default=['eng', 'spa'],
                        help='''Subtitle languages to look for.
                             Many can be specified. Use 3-letter code (ISO-639-3).
                             ''')
    parser.add_argument('-d', '--days', dest='days', required=False,
                        default=7, type=int,
                        help='Maximum age of the videos to be considered, in days.')
    parser.add_argument('-o', '--log', dest='logfile', required=False,
                        help='Log file path.')
    parser.add_argument('-v', '--verbose', dest='verbose', required=False,
                        default=0, type=int,
                        help='Verbose level: 0 for errors, 1 for info or 2 for debug.')

    return parser


def main(argv=None):

    parser = setup_argparser()

    try:
        args = parser.parse_args()
    except argparse.ArgumentError as exc:
        log.exception('Error parsing options.')
        parser.error(str(exc.message))
        raise

    verbose  = args.verbose
    logfile  = args.logfile
    dirpaths = args.dirpaths
    langs    = args.langs
    days     = args.days

    setup_log(logfile, verbose)
    log.info('{0} {1}'.format(os.path.basename(__file__), locals()))

    # Languages
    languages = {Language(lang) for lang in langs}

    try:
        for dirpath in dirpaths:
            log.info('Looking for video files in folder {} for {}.'.format(dirpath, languages))
            videos = search_video_files(dirpath, max_age=days, embedded_subs=False)
    except:
        log.exception('Error when searching for video files.')
        raise

    log.info('Videos found:')
    log.info(videos)

    try:
        download_subs(videos, languages)
    except:
        log.exception('Error when downloading subtitles.')
        raise

    return 0


if __name__ == "__main__":
    sys.exit(main())
