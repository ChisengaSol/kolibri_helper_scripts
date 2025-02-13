#!/bin/bash

# channel_ids
#==============
# Level 1 Section 1 - f3f6bf4b9c424b6fbd90bece1418a415
# Level 1 Section 2 - 3a126f041a9e4127978bb6544a099d0d
# Level 1 Section 3 - 03761fe9a2424e9ebd367fbae14dc134
# Level 1 Section 4 - f12e2f67d5894b34bb942484d880c4a6
# Level 2 Section 1 - f6e8f1f569c54bc58ecb54d826cd3783
# Level 2 Section 2 - 5126a907e5284345847c8ca749c8cd9b
# Level 2 Section 3 - c32737bf26474dc8a81de3d093075830
# Level 2 Section 4 - 0985900c047a41738e796f19d9b57ed5
# Level 3 Section 1 - c0302f6cd0624778bc8dd7a2b91d09b4
# Level 3 Section 2 - ddf25e8fcde84e8998118daffb2d8655
# Level 3 Section 3 - e2217b872f784190a0a55c46e9ee8bc1
# Level 3 Section 4 - f908fac9fe5644b996abe25dfbd530bc
# Level 4 Section 1 - d4b44e6dd4de450ebbc799085ba656e5
# Level 4 Section 2 - 763eafc24e684dbe8f54c9a22dd63599
# Level 4 Section 3 - 7de1d8eca4874856b508c1a4f51a839e
# Level 4 Section 4 - 904d419f53e24b6fb60d2aca7e729683
# Level 5 Section 1 - 5b679315a02c40359505fc84701c482d
# Level 5 Section 2 - a5cd9f9f000e41459a95875d7dfd3e68
# Level 5 Section 3 - 6c4089232a72447eabbdf83b7c5612a4
# Level 5 Section 4 - 28f4920a7b444e29af4f1e8d00ca332b
# Grade 7 Numeracy (Zambia) - 8d368058656544e2b7fe62eb2a632698
# Grade 7 Literacy (Zambia) - 96578ffc06e44a46b021540cb217f9c9
# Coach Professional Development - 19ea4c94ee484cb0b5bb617f5511f4c1


# Export channels to a specified directory
export_channels(){
	# Directory to export the channels to
	EXPORT_DIR=$1
	
	# Declare array containing all channel_ids
	declare -a channel_ids=(
		"f3f6bf4b9c424b6fbd90bece1418a415"
		"3a126f041a9e4127978bb6544a099d0d"
		"03761fe9a2424e9ebd367fbae14dc134"
		"f12e2f67d5894b34bb942484d880c4a6"
		"f6e8f1f569c54bc58ecb54d826cd3783"
		"5126a907e5284345847c8ca749c8cd9b"
		"c32737bf26474dc8a81de3d093075830"
		"0985900c047a41738e796f19d9b57ed5"
		"c0302f6cd0624778bc8dd7a2b91d09b4"
		"ddf25e8fcde84e8998118daffb2d8655"
		"e2217b872f784190a0a55c46e9ee8bc1"
		"f908fac9fe5644b996abe25dfbd530bc"
		"d4b44e6dd4de450ebbc799085ba656e5"
		"763eafc24e684dbe8f54c9a22dd63599"
		"7de1d8eca4874856b508c1a4f51a839e"
		"904d419f53e24b6fb60d2aca7e729683"
		"5b679315a02c40359505fc84701c482d"
		"a5cd9f9f000e41459a95875d7dfd3e68"
		"6c4089232a72447eabbdf83b7c5612a4"
		"28f4920a7b444e29af4f1e8d00ca332b"
		"8d368058656544e2b7fe62eb2a632698"
		"96578ffc06e44a46b021540cb217f9c9"
		"19ea4c94ee484cb0b5bb617f5511f4c1"
		)

	# Inform the user that the exporting has begun
	echo "Begin exporting Kolibri channels to $EXPORT_DIR"

	# To export channels individually, 
	# run the two lines as below and insert the appropriate channel_id e.g
	# python -m kolibri manage exportchannel -- network <channel_id>
	# python -m kolibri manage exportchannel -- network <channel_id>

	# Loop through channel_ids array
	for channel in "${channel_ids[@]}"
	do
		# For each channel, always exportchannel before exportcontent
		python -m kolibri manage exportchannel "$channel" "$EXPORT_DIR"
		python -m kolibri manage exportcontent "$channel" "$EXPORT_DIR"
	done

	echo "${GREEN}Done!${RESET}"
}


# Path to the content pack directory
CONTENT_PACK_DIR=~/new_kolibri_content_pack/KOLIBRI_DATA/

# If the content pack directory does not exist, create it
if [ ! -d "$CONTENT_PACK_DIR" ]; then
	mkdir -p "$CONTENT_PACK_DIR"
	echo "Creating directory : $CONTENT_PACK_DIR"
else
	echo "${BLUE}$CONTENT_PACK_DIR already exists. Skipping this step${RESET}"
fi

# Run the export channels function passing in the content pack directory
export_channels $CONTENT_PACK_DIR

