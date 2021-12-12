import os

def create_folders():
    # define the name of the directory to be created
    for i in range(1 , 50):
        path = f"./Clase {i}"

        try:
            os.mkdir(path)
        except OSError:
            print ("Creation of the directory %s failed" % path)
        else:
            print ("Successfully created the directory %s " % path)
    

if __name__ == "__main__":
    create_folders()