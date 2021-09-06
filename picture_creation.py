from PIL import Image
import cv2
import random
import numpy as np
import os


def three_colours(image):
    height = image.shape[0]
    width = image.shape[1]
    for i in range(height):
        for j in range(width):
            current_pixel = image[i, j]
            (b, g, r) = current_pixel
            if r < 130 and g < 90:
                image[i, j] = (40, 40, 40)
            elif r < 210 and r < 170:
                image[i, j] = (130, 130, 130)
            else:
                image[i, j] = (220, 220, 220)

    return image


cross_size = 16

image = cv2.imread("krest.jpg")
image = cv2.resize(image, (cross_size, cross_size))
image = three_colours(image)
cv2.imwrite('krest_three_colours.jpg', image)

#reading the image of the half of the cross
half = cv2.imread("half.jpg")
half = cv2.resize(half, (cross_size, cross_size))
half = three_colours(half)

cv2.imwrite('half_three_colours.jpg', half)
# 0.0.0 - black; 255.255.255 - white

#the number of crosses in the image
cross_number = int(1048576/cross_size)

#connect the crosses horizontally
image_list = []
for i in range(cross_number):
    image_list.append('krest_three_colours.jpg')
images = [Image.open(x) for x in image_list]
widths, heights = zip(*(i.size for i in images))
total_width = sum(widths)
max_height = max(heights)
new_im = Image.new('RGB', (total_width, max_height))
x_offset = 0
for im in images:
    new_im.paste(im, (x_offset,0))
    x_offset += im.size[0]
new_im.save('horizontal_connection.jpg')

#connect the crosses vertically:
img1 = cv2.imread('horizontal_connection.jpg')
img2 = cv2.imread('horizontal_connection.jpg')
for i in range(cross_number-2):
    img1 = cv2.vconcat([img1, img2])
new_im = cv2.vconcat([img1, img2])
cv2.imwrite('result.jpg', new_im)

#we read the original image that we want to change. in my case, it was 1 picture - a statue
our_image = cv2.imread("im1.jpg")
our_image = cv2.resize(our_image, (1048576, 1048576))

for i in range(cross_number):
    for j in range(cross_number):
        #for each cross, choose a random color from those that were in the image.
        # this color will determine the color in our new drawing
        current_pixel1 =our_image[i*cross_size+int(random.random()*(cross_size-1)), j*cross_size+int(random.random()*(cross_size-1))]
        (b1, g1, r1) = current_pixel1

        for k in range(cross_size):
            for l in range(cross_size):
                current_pixel = new_im[i*cross_size+k, j*cross_size+l]
                (b, g, r) = current_pixel
                if r >= 220:
                    if b1> 150 and r1> 150 and g1>150:
                        new_im[i*cross_size+k, j*cross_size+l] = (b1, g1, r1)

                    elif b1 >= g1 and b1 >= r1:
                        new_im[i*cross_size+k, j*cross_size+l] = (int(200), int(120), int(120))
                    elif g1 >= b1 and g1 >= r1:
                        new_im[i*cross_size+k, j*cross_size+l] = (int(120), int(200), int(120))
                    elif r1 >= b1 and r1 >= g1:
                        new_im[i*cross_size+k, j*cross_size+l] = (int(120), int(120), int(200))
                elif r >= 130:
                    if b1> 150 and r1> 150 and g1>150:
                        new_im[i*cross_size+k, j*cross_size+l] = (b1-50, g1-50, r1-50)

                    elif b1 >= g1 and b1 >= r1:
                        t1 = g1 / 2 - 10
                        t2 = r1 / 2 - 10
                        if t1 < 0:
                            t1 = 0
                        if t2 < 0:
                            t2 = 0
                        new_im[i*cross_size+k, j*cross_size+l] = (int(20 + b1 / 2), int(t1), int(t2))
                    elif g1 >= b1 and g1 >= r1:
                        t1 = b1 / 2 - 10
                        t2 = r1 / 2 - 10
                        if t1 < 0:
                            t1 = 0
                        if t2 < 0:
                            t2 = 0
                        new_im[i*cross_size+k, j*cross_size+l] = (int(t1), int(20 + g1 / 2), int(t2))
                    elif r1 >= b1 and r1 >= g1:
                        t1 = g1 / 2 - 10
                        t2 = b1 / 2 - 10
                        if t1 < 0:
                            t1 = 0
                        if t2 < 0:
                            t2 = 0
                        new_im[i*cross_size+k, j*cross_size+l] = (int(t2), int(t1), int(20 + r1 / 2))

                else:
                    if b1> 150 and r1> 150 and g1>150:
                        new_im[i*cross_size+k, j*cross_size+l] = (b1-100, g1-100, r1-100)

                    elif b1 >= g1 and b1 >= r1:
                        t1 = g1 / 4 - 10
                        t2 = r1 / 4 - 10
                        if t1 < 0:
                            t1 = 0
                        if t2 < 0:
                            t2 = 0
                        new_im[i * cross_size + k, j * cross_size + l] = (
                            int(0 + b1 / 4), int(t1), int( t2))
                    elif g1 >= b1 and g1 >= r1:
                        t1 = b1 / 4 - 10
                        t2 = r1 / 4 - 10
                        if t1 < 0:
                            t1 = 0
                        if t2 < 0:
                            t2 = 0
                        new_im[i * cross_size + k, j * cross_size + l] = (
                            int(t1), int(0 + g1 / 4), int(t2))
                    elif r1 >= b1 and r1 >= g1:
                        t1 = b1 / 4 - 10
                        t2 = g1 / 4 - 10
                        if t1 < 0:
                            t1 = 0
                        if t2 < 0:
                            t2 = 0
                        new_im[i * cross_size + k, j * cross_size + l] = (
                            int(t1), int(t2), int(0 + r1 / 4))

cv2.imwrite('new_im.jpg', new_im)


image_size = 1048576
population_size = image_size*image_size
amount_of_operations = 600000
# this number is more than enough to make the picture acceptable to us

for i in range(cross_number):
    for j in range(cross_number):
        (b1, g1, r1) = our_image[i*cross_size, j*cross_size]
        #draw the center stripe
        if (i > 20 and i < 40  and ((b1> 112 and b1< 130) or j< 5 or j > 57)):
            for k in range(cross_size):
                for l in range(cross_size):
                    (b, g, r) = half[k, l]
                    if r >= 220 :
                        if b1 > 150 and r1 > 150 and g1 > 150:
                            new_im[i * cross_size + k, j * cross_size + l] = (b1, g1, r1)

                        elif b1 >= g1 and b1 >= r1:
                            new_im[i * cross_size + k, j * cross_size + l] = (int(220), int(160), int(160))
                        elif g1 >= b1 and g1 >= r1:
                            new_im[i * cross_size + k, j * cross_size + l] = (int(160), int(220), int(160))
                        elif r1 >= b1 and r1 >= g1:
                            new_im[i * cross_size + k, j * cross_size + l] = (int(160), int(160), int(220))
                    elif r >= 130:
                        if b1 > 150 and r1 > 150 and g1 > 150:
                            new_im[i * cross_size + k, j * cross_size + l] = (b1 - 50, g1 - 50, r1 - 50)

                        elif b1 >= g1 and b1 >= r1:
                            t1 = g1 / 2 - 10
                            t2 = r1 / 2 - 10
                            if t1 < 0:
                                t1 = 0
                            if t2 < 0:
                                t2 = 0
                            new_im[i * cross_size + k, j * cross_size + l] = (int(20 + b1 / 2), int(t1), int(t2))
                        elif g1 >= b1 and g1 >= r1:
                            t1 = b1 / 2 - 10
                            t2 = r1 / 2 - 10
                            if t1 < 0:
                                t1 = 0
                            if t2 < 0:
                                t2 = 0
                            new_im[i * cross_size + k, j * cross_size + l] = (int(t1), int(20 + g1 / 2), int(t2))
                        elif r1 >= b1 and r1 >= g1:
                            t1 = g1 / 2 - 10
                            t2 = b1 / 2 - 10
                            if t1 < 0:
                                t1 = 0
                            if t2 < 0:
                                t2 = 0
                            new_im[i * cross_size + k, j * cross_size + l] = (int(t2), int(t1), int(20 + r1 / 2))

                    else:
                        if b1 > 150 and r1 > 150 and g1 > 150:
                            new_im[i * cross_size + k, j * cross_size + l] = (b1 - 100, g1 - 100, r1 - 100)

                        elif b1 >= g1 and b1 >= r1:
                            t1 = g1 / 4 - 10
                            t2 = r1 / 4 - 10
                            if t1 < 0:
                                t1 = 0
                            if t2 < 0:
                                t2 = 0
                            new_im[i * cross_size + k, j * cross_size + l] = (
                                int(0 + b1 / 4), int(t1), int(t2))
                        elif g1 >= b1 and g1 >= r1:
                            t1 = b1 / 4 - 10
                            t2 = r1 / 4 - 10
                            if t1 < 0:
                                t1 = 0
                            if t2 < 0:
                                t2 = 0
                            new_im[i * cross_size + k, j * cross_size + l] = (
                                int(t1), int(0 + g1 / 4), int(t2))
                        elif r1 >= b1 and r1 >= g1:
                            t1 = b1 / 4 - 10
                            t2 = g1 / 4 - 10
                            if t1 < 0:
                                t1 = 0
                            if t2 < 0:
                                t2 = 0
                            new_im[i * cross_size + k, j * cross_size + l] = (
                                int(t1), int(t2), int(0 + r1 / 4))

ideal = new_im
# image 'ideal' is what our population will strive for
cv2.imwrite('ideal.jpg', ideal)

# creating a new image. in it, each pixel has a random color
image = np.random.randint(255, size=(image_size, image_size, 3), dtype=np.uint8)
population_list = []
for i in range(image_size):
    population_list.append([0] * image_size)

for i in range(image_size):
    for j in range(image_size):
        population_list[i][j] = image[i][j]
#population_list contains the color values of each pixel in the new image

k = 0
is_not_ideal = 1
f = 100
while(is_not_ideal and f > 25 and k < amount_of_operations):
    k = k + 1
    is_not_ideal = 0
    f = 0
    for i in range(image_size):
        for j in range(image_size):
            (b,g,r) = population_list[i][j]
            (b1,g1,r1) = ideal[i][j]
            fitness_level = 0
            # fitness level is equal to 1 if the following condition is met:
            if abs(int(b)-int(b1))<=60 and abs(int(g)-int(g1))<=60 and abs(int(r)-int(r1))<=60:
                fitness_level = 1
            # if the fitness level is 0, then the value of this pixel, its color, does not suit us.
            # we change this value (color) to another one
            if fitness_level == 0:
                is_not_ideal = 1
                f = f + 1
                b = random.randint(0, 255)
                g = random.randint(0, 255)
                r = random.randint(0, 255)
                population_list[i][j] = (b, g, r)

#we delete the images that we created in the process; we no longer need them
try:
    os.remove("half_three_colours.jpg")
    os.remove("horizontal_connection.jpg")
    os.remove("ideal.jpg")
    os.remove("new_im.jpg")
    os.remove("krest_three_colours.jpg")
    os.remove("result.jpg")
except: pass
#assign the changed value to each pixel of the image
for i in range(image_size):
    for j in range(image_size):
        image[i, j] = population_list[i][j]
cv2.imwrite('im.jpg', image)

