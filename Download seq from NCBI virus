import argparse
import configparser
import os


download_command = "datasets download virus genome taxon {taxid} \
    --host {host} --released-after {date_after} \
    --geo-location {location} --filename {output_file}"


if __name__ == '__main__':

    parser = argparse.ArgumentParser(
                    prog='DownloadGenome',
                    description='Download viros genome data from NCBI database',
                    epilog='List of viruses is read from configuration file')
    
    parser.add_argument('--config', default='viruses.ini', help='Configuration file with list of viruses')
    parser.add_argument('--dir', default='data', help='Folder to save downloaded data')

    args = parser.parse_args()
    os.makedirs(args.dir, exist_ok=True)
    print(f"Reading config file {args.config}")

    config = configparser.ConfigParser()
    config.read(args.config)

    for virus in config.sections():
        print(f"Downloading {virus} genome data")
        os.system(download_command.format(
            taxid=config[virus]['taxid'],
            host=config[virus]['host'],
            date_after=config[virus]['date_after'],
            location=config[virus]['location'],
            output_file=os.path.join(args.dir, f'{virus}.zip')
        ))
        print(f"Genome data downloaded for {virus}")
    print("All genome data downloaded")
