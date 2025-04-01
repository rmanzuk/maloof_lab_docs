## Accessing data on giristore

1) Be sure that you have permissions. Check with Ryan Fedon, our system administrator, that the ssh key from the computer you’ll be using is added to the list, and that your NetID has an account on giristore.

2) From your command line, ssh into giristore as an approved user with your NetID. The command should look like `ssh <netid>@giristore.princeton.edu`. Note that recent Mac ssh versions may not be compatible with giristore, so you may need to add to the command to key some algorithms. The command that works for me as of Tuesday, October 17, 2023 at 1:44:54 PM is:
   `ssh rmanzuk@giristore.princeton.edu -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa`

3) Enter your giristore password when prompted.

4) You likely will enter giristore in the directory associated with your NetID, but all of the data are kept back in the `data` directory. So you will probably have to start with `cd ..` two times to get back to the base and then `cd data` to get to the main data directory. If you just want to get to the data from GIRI, you can just go straight to the control computer data directory:  `cd /grinder/control_computer_data`

5) At any point now, you can check disk usage in the current directory with the command `df -h`. To check disk usage in any given folder or of a specific item, use the command `du -sh <file name>`. This habit is good before setting up large transfers between drives.

   *Steps 6-10 are most useful for large transfers between drives on giristore. If looking to just download or upload a few files from your local computer, look at step 11.*

6) Once you've confirmed that disk space will be adequate for your desired  file transfer, you should probably start a `tmux` insance. `tmux` is a useful session/window manager in the terminal, which will allow you to exit your terminal or use it for something else while the file transfer is occurring (especially useful for very large transfers. If you’re just working with a few GB, you may not need to bother). 

7) To start a `tmux` instance, first set the term properly with the command: `TERM=xterm-256color`

8) Start the `tmux` instance with the command `tmux`

9) To start a file transfer, navigate to your desired directory and run an `rsync`. `rsync` is our preferred transfer utility because it is versatile and easy to use. The general command for an `rsync` is: `rsync -avzh <source_file> <destination_directory>` . We use the options `avzh` to use archive mode, verbose, compressed where possible, and with human-readable progress. For more information on `rsync` see [this link](https://man7.org/linux/man-pages/man1/rsync.1.html)

10) The transfer may take a while so you might want to get out of `tmux` to have your terminal back while things are running. Hitting `ctrl+b` then `d` detaches from `tmux` without ending the file transfer. To return to an existing `tmux` session, begin a `tmux` instance with the `tmux` command, then list the active sessions with the command: `tmux ls`. To reactivate one of your active sessions use the command `tmux attach -d -t <session_index>` where `session_index` is the number of the session you want from the `tmux ls`. If you want to exit a `tmux` session completely because your transfer is over, hitting `ctrl+d` exits the session.

11) If I want to download a few files from giristore, I tend to start an `ssh` session and navigate around the directories until I find the files I’m looking for and know their path within giristore. I then exit the session and start an rsync from the terminal on my local machine. For example, I used this command on Monday, October 16, 2023 at 5:18:22 PM to download some files (note the extra algorithm commands due to my Mac ssh version): 
`rsync -avzh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa rmanzuk@giristore.princeton.edu:/data/grinder/control_computer_data/stacey_thinnies_03.15.2021/ /Users/ryan/Downloads/`

**Update 3/31/25 by Julia:**

The structure of the above command doesn't work for me (returns a link_stat error that it can't find my directory). Instead, I have to add an execute (-e) flag and put the ssh part of the command in quotes:  

`rsync -avzh -e "ssh -o HostKeyAlgorithms=+ssh-rsa -o PubkeyAcceptedAlgorithms=+ssh-rsa" jwilcots@giristore.princeton.edu:/data/grinder/control_computer_data/2DSpring2025/image_logs/ /Volumes/X9/2DTrezona`
