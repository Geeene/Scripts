import numpy as np
import obspython as obs
import math
from PIL import Image

# Global variables
target_source = ""
selected_images = []
img_paths = []
line_break_point = 1
vertical = False

def script_description():
    return "Utility for simplifying creating Teams Displays for Fire Emblem Draft Races, and Death counters for Ironmans.\n" \
           "Select the images you want to show, select an image source, and the Script combines all the " \
           "images into one single image and then sets the Image Source to show that image.\n" \
           "Note: Due to technical limitations the Script resizes all images to be the same size, for games that have " \
           "inconsistent portrait sizes (f.e. FE9) it is recommended to resize them manually so they don't look weird "


def script_properties():
    props = obs.obs_properties_create()

    # Int input to know when to line break
    obs.obs_properties_add_int(props, "line_break", "Max. images before line break\n(Horizontally/Vertically)", 1, 99,
                               1)

    # Lets the user select the image source that will be updated.
    potential_target_sources = obs.obs_properties_add_list(props, "potential_target_sources", "Target Image Source",
                                                           obs.OBS_COMBO_TYPE_LIST, obs.OBS_COMBO_FORMAT_STRING)
    load_sources(potential_target_sources)

    obs.obs_properties_add_button(props, "refresh_button", "Refresh list",
                                  lambda props, prop: True if load_sources(potential_target_sources) else True)

    # List where the user can select the images to add to the picture
    obs.obs_properties_add_editable_list(props, "character_list", "Images for source", obs.OBS_EDITABLE_LIST_TYPE_FILES,
                                         "(*.png *.jpg)", script_path())

    obs.obs_properties_add_bool(props, "bool_vertical", "Order pictures vertically?")

    obs.obs_properties_add_button(props, "confirm_button", "Create Image", handle)

    return props


def handle(param, param2):
    global vertical, line_break_point, target_source
    imgs = []

    if target_source and img_paths:
        for currentImage in img_paths:
            imgs.append(Image.open(currentImage))
        # In the case of a Horizontal Layout this gets the number of rows
        # In the case of vertical, it decides the number of columns
        row_column_number = int(np.ceil(len(imgs) / line_break_point))
        print(f'Number of Rows / Columns {row_column_number}')

        # Find the largest size of an image and resize all images to match
        max_shape = sorted([(np.sum(i.size), i.size) for i in imgs], reverse=True)[0][1]
        use_zigzag = vertical and len(imgs) > line_break_point

        print(f'Vertical: {vertical}, Zigzag {use_zigzag}')
        if (not vertical) or (vertical and use_zigzag):
            np_array_list = []

            for i in range(0, math.ceil(len(imgs)/line_break_point), 1):
                print(f'Currently trying to add line {i} in horizontal mode')
                row_imgs = imgs[i*line_break_point: i * line_break_point + line_break_point]
                number_missing_images = line_break_point - len(row_imgs)
                np_array_list.append([np.asarray(img.resize(max_shape)) for img in row_imgs])

                
                # Check that there is more than one row, since otherwise it's not necessary since
                # the transparent image is only added so that we can stack the images.
                if number_missing_images > 0 and row_column_number > 1:
                    while len(np_array_list[-1]) < line_break_point:
                        print(f'This row would be incomplete, fill the row with empty images.')
                        transparency = np.zeros_like(row_imgs[0].resize(max_shape))
                        np_array_list[-1].append(transparency)
            for item in np_array_list:
                print("test " + str(len(item)))
            # np_array_list contains lists of Numpy Arrays, we want to stack each of these Arrays (which represent an
            # Image) horizontally, and then we stack each of the stacked arrays horizontally to combine all images
            combined_images = np.vstack([np.hstack(line) for line in np_array_list])
        elif vertical and not use_zigzag:
            print("creating image in vertical mode.")
            np_array = [np.asarray(i.resize(max_shape)) for i in imgs]
            combined_images = np.vstack(np_array)

        imgs_comb = Image.fromarray(combined_images)
        image_path = f'{script_path()}{target_source}.png'
        print(f'image_path: {image_path}')
        imgs_comb.save(image_path)

        source_to_change = get_source_from_source_name(target_source)
        set_image_path_of_source(source_to_change, image_path)


def script_update(settings):
    global target_source, selected_images, vertical, line_break_point, img_paths
    img_paths = []
    # Load the properties the user can set in the UI into global variables
    # so that I can access them from the button method.
    target_source = obs.obs_data_get_string(settings, "potential_target_sources")
    selected_images = obs.obs_data_get_array(settings, "character_list")
    vertical = obs.obs_data_get_bool(settings, "bool_vertical")
    line_break_point = obs.obs_data_get_int(settings, "line_break")

    i = 0
    while obs.obs_data_array_item(selected_images, i) is not None:
        # get the obs_data_t from the obs_data_array_t
        current_image_swig_object = obs.obs_data_array_item(selected_images, i)
        # get the value string form the obs_data_t
        path_to_image = obs.obs_data_get_string(current_image_swig_object, "value")
        # save the image so we know to use it when the button is pressed.
        img_paths.append(path_to_image)
        i += 1


# Called before data settings are saved
def script_save(settings):
    obs.obs_save_sources()


def load_sources(list_property):
    obs.obs_property_list_clear(list_property)
    obs.obs_property_list_add_string(list_property, "", "")

    sources = obs.obs_enum_sources()
    for source in sources:
        name = obs.obs_source_get_name(source)
        obs.obs_property_list_add_string(list_property, name, name)
    obs.source_list_release(sources)


def get_source_from_source_name(name):
    result_source_item = None
    sources = obs.obs_enum_sources()
    for source in sources:
        if name == obs.obs_source_get_name(source):
            result_source_item = source
            break

    obs.source_list_release(sources)

    return result_source_item


def set_image_path_of_source(source, path):
    source_data = obs.obs_source_get_settings(source)
    obs.obs_data_set_string(source_data, "file", path)
    obs.obs_source_update(source, source_data)
    obs.obs_data_release(source_data)
